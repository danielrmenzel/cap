/*--------------------------------------------------------------------*/
/*  compile_c_to_hex.c  ·  TinyCC-to-WASM helper                       */
/*--------------------------------------------------------------------*
 *  ✔ builds against TinyCC *mob* ( tcc_relocate() has ONE parameter ) *
 *  ✔ extracts .text and .rodata sections from ELF                     *
 *  ✔ injects .rodata into memory at 0x5000 for printf simulation      *
 *  ✔ returns .text section as Uint8Array buffer to JS                 *
 *
 *  Exports (C-ABI, visible to JS):                                    *
 *      uint8_t *compile_and_get_text(const char *src, int *out_size); *
 *      uint64_t get_text_base(void);                                  *
 *      char    *extract_symbols   (const char *obj_path);             *
 *
 *  Compile using emcc + libtcc.a                                      *
 *                                                                    */
/*--------------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <emscripten.h>
#include "libtcc.h"

/*────────────────────────────────── ELF helpers ─────────────────────────────────*/
#ifndef STT_OBJECT
#define STT_OBJECT 1
#endif
#ifndef SHN_ABS
#define SHN_ABS 0xfff1
#endif

#define EI_NIDENT       16
#define STT_FUNC         2
#define ELF64_ST_TYPE(v) ((v) & 0xf)

typedef struct {
    unsigned char e_ident[EI_NIDENT];
    uint16_t      e_type, e_machine;
    uint32_t      e_version;
    uint64_t      e_entry, e_phoff, e_shoff;
    uint32_t      e_flags;
    uint16_t      e_ehsize, e_phentsize, e_phnum,
                  e_shentsize, e_shnum,     e_shstrndx;
} __attribute__((packed)) Elf64_Ehdr;

typedef struct {
    uint32_t sh_name, sh_type;
    uint64_t sh_flags, sh_addr, sh_offset, sh_size;
    uint32_t sh_link, sh_info;
    uint64_t sh_addralign, sh_entsize;
} __attribute__((packed)) Elf64_Shdr;

typedef struct {
    uint32_t      st_name;
    unsigned char st_info, st_other;
    uint16_t      st_shndx;
    uint64_t      st_value, st_size;
} __attribute__((packed)) Elf64_Sym;

static uint64_t g_text_base = 0;

/*─────────────────────── compile C → extract .text + .rodata ───────────────────────*/

EMSCRIPTEN_KEEPALIVE
uint8_t *compile_and_get_text(const char *src_path, int *out_size)
{
    fprintf(stderr, "[TCC] create state …\n");
    TCCState *st = tcc_new();
    if (!st) { fprintf(stderr, "[TCC] tcc_new failed\n"); return NULL; }

    tcc_set_output_type (st, TCC_OUTPUT_OBJ);
    tcc_set_options     (st, "-O0");
    tcc_add_include_path(st, "/tinycc-headers");

    fprintf(stderr, "[TCC] compiling %s …\n", src_path);
    if (tcc_add_file(st, src_path) < 0) { tcc_delete(st); return NULL; }

    fprintf(stderr, "[TCC] writing out.o …\n");
    if (tcc_output_file(st, "out.o") < 0) { tcc_delete(st); return NULL; }
    tcc_delete(st);

    FILE *fp = fopen("out.o", "rb");
    if (!fp) { perror("[TCC] fopen(out.o)"); return NULL; }

    fseek(fp, 0, SEEK_END);
    long fsz = ftell(fp);
    rewind(fp);

    uint8_t *elf = malloc(fsz);
    fread(elf, 1, fsz, fp);
    fclose(fp);

    Elf64_Ehdr *eh = (Elf64_Ehdr *)elf;
    Elf64_Shdr *sh = (Elf64_Shdr *)(elf + eh->e_shoff);
    const char *shstr = (const char *)(elf + sh[eh->e_shstrndx].sh_offset);

    uint8_t *text_buf = NULL;
    uint8_t *rodata_buf = NULL;
    size_t text_size = 0;
    size_t rodata_size = 0;

    for (int i = 0; i < eh->e_shnum; i++) {
        const char *name = shstr + sh[i].sh_name;
        if (!strcmp(name, ".text")) {
            text_size = sh[i].sh_size;
            text_buf  = malloc(text_size);
            memcpy(text_buf, elf + sh[i].sh_offset, text_size);
            g_text_base = 0x2000;
            *out_size = text_size;
            fprintf(stderr, "[TCC] .text extracted: %zu bytes, VA=0x%llx\n", text_size, (unsigned long long)g_text_base);
        }
        else if (!strcmp(name, ".rodata")) {
            rodata_size = sh[i].sh_size;
            rodata_buf  = malloc(rodata_size);
            memcpy(rodata_buf, elf + sh[i].sh_offset, rodata_size);
            fprintf(stderr, "[TCC] .rodata extracted: %zu bytes\n", rodata_size);
        }
    }

    if (rodata_buf && rodata_size) {
        EM_ASM({
            const addr = 0x5000;
            for (let i = 0; i < $1; i++) {
                HEAPU8[addr + i] = HEAPU8[$0 + i];
            }
        }, rodata_buf, rodata_size);
        free(rodata_buf);
    }

    free(elf);
    return text_buf;
}

/*────────────────────────────── get base ───────────────────────────────*/

EMSCRIPTEN_KEEPALIVE
uint64_t get_text_base(void) { return g_text_base; }

/*────────────────────────── symbols → JSON ────────────────────────────*/

EMSCRIPTEN_KEEPALIVE
char *extract_symbols(const char *obj_path)
{
    FILE *fp = fopen(obj_path, "rb");
    if (!fp) { perror("[SYM] fopen"); return NULL; }

    fseek(fp, 0, SEEK_END);
    long fsz = ftell(fp);
    rewind(fp);

    uint8_t *elf = malloc(fsz);
    fread(elf, 1, fsz, fp);
    fclose(fp);

    Elf64_Ehdr *eh   = (Elf64_Ehdr *)elf;
    Elf64_Shdr *sh   = (Elf64_Shdr *)(elf + eh->e_shoff);
    const char *name = (const char *)(elf + sh[eh->e_shstrndx].sh_offset);

    Elf64_Shdr *symtab = NULL, *strtab = NULL;
    for (int i = 0; i < eh->e_shnum; i++) {
        const char *nm = name + sh[i].sh_name;
        if (!strcmp(nm, ".symtab")) symtab = &sh[i];
        else if (!strcmp(nm, ".strtab")) strtab = &sh[i];
    }
    if (!symtab || !strtab) { free(elf); return NULL; }

    const char *strs = (const char *)(elf + strtab->sh_offset);
    Elf64_Sym  *syms = (Elf64_Sym *)(elf + symtab->sh_offset);
    int nsyms        = symtab->sh_size / sizeof(Elf64_Sym);

    char *out = malloc(8192);
    char funcs[4096], locals[4096];
    strcpy(funcs, "{");
    strcpy(locals, "{");
    int wrote_f = 0, wrote_l = 0;

    for (int i = 0; i < nsyms; i++) {
        const char *sym_name = strs + syms[i].st_name;
        uint8_t type = ELF64_ST_TYPE(syms[i].st_info);

        if (type == STT_FUNC) {
            if (wrote_f++) strcat(funcs, ",");
            char tmp[128];
            snprintf(tmp, sizeof tmp, "\"%s\":%llu",
                    sym_name, (unsigned long long)syms[i].st_value);
            strcat(funcs, tmp);
        }
        else if (type == STT_OBJECT &&
                 syms[i].st_shndx == SHN_ABS &&
                 syms[i].st_value < 0x1000 &&
                 strlen(sym_name) > 0)
        {
            if (wrote_l++) strcat(locals, ",");
            char tmp[128];
            snprintf(tmp, sizeof tmp, "\"%s\":%llu",
                    sym_name, (unsigned long long)syms[i].st_value);
            strcat(locals, tmp);
        }
    }

    strcat(funcs, "}");
    strcat(locals, "}");
    snprintf(out, 8192, "{\"functions\":%s,\"locals\":%s}", funcs, locals);

    free(elf);
    return out;
}
/*───────────────────────────────────────────────────────────────────────────────*
 *  end of compile_c_to_hex.c                                                   *
 *───────────────────────────────────────────────────────────────────────────────*/