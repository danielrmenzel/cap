// compile_c_to_hex.c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "libtcc.h"
#include <emscripten.h>
#include <stdint.h>

#define EI_NIDENT 16
#define STT_FUNC 2
#define ELF64_ST_TYPE(val) ((val) & 0xf)

typedef struct {
    unsigned char e_ident[EI_NIDENT];
    uint16_t e_type;
    uint16_t e_machine;
    uint32_t e_version;
    uint64_t e_entry;
    uint64_t e_phoff;
    uint64_t e_shoff;
    uint32_t e_flags;
    uint16_t e_ehsize;
    uint16_t e_phentsize;
    uint16_t e_phnum;
    uint16_t e_shentsize;
    uint16_t e_shnum;
    uint16_t e_shstrndx;
} Elf64_Ehdr;

typedef struct {
    uint32_t sh_name;
    uint32_t sh_type;
    uint64_t sh_flags;
    uint64_t sh_addr;
    uint64_t sh_offset;
    uint64_t sh_size;
    uint32_t sh_link;
    uint32_t sh_info;
    uint64_t sh_addralign;
    uint64_t sh_entsize;
} Elf64_Shdr;

typedef struct {
    uint32_t st_name;
    unsigned char st_info;
    unsigned char st_other;
    uint16_t st_shndx;
    uint64_t st_value;
    uint64_t st_size;
} Elf64_Sym;

EMSCRIPTEN_KEEPALIVE
uint8_t* compile_and_get_text(const char* source_path, int* out_size) {
    fprintf(stderr, "[TCC] Creating compiler state...\n");
    TCCState *s = tcc_new();
    if (!s) { fprintf(stderr, "[TCC] tcc_new failed\n"); return NULL; }
    tcc_set_output_type(s, TCC_OUTPUT_OBJ);
    tcc_add_include_path(s, "/");
    tcc_add_include_path(s, "/tinycc-headers");
    fprintf(stderr, "[TCC] Adding source file: %s\n", source_path);
    if (tcc_add_file(s, source_path) < 0) {
        fprintf(stderr, "[TCC] Failed to compile %s\n", source_path);
        tcc_delete(s);
        return NULL;
    }
    fprintf(stderr, "[TCC] Writing output object file...\n");
    if (tcc_output_file(s, "out.o") < 0) {
        fprintf(stderr, "[TCC] Failed to write out.o\n");
        tcc_delete(s);
        return NULL;
    }
    tcc_delete(s);

    FILE *f = fopen("out.o", "rb");
    if (!f) { fprintf(stderr, "[TCC] fopen(out.o) failed\n"); return NULL; }
    fseek(f, 0, SEEK_END);
    long file_size = ftell(f);
    rewind(f);
    uint8_t *elf = malloc(file_size);
    fread(elf, 1, file_size, f);
    fclose(f);

    Elf64_Ehdr *eh = (Elf64_Ehdr*)elf;
    Elf64_Shdr *sh = (Elf64_Shdr*)(elf + eh->e_shoff);
    const char *strtab = (const char*)(elf + sh[eh->e_shstrndx].sh_offset);

    for (int i = 0; i < eh->e_shnum; i++) {
        const char *name = strtab + sh[i].sh_name;
        if (strncmp(name, ".text", 5) == 0) {
            fprintf(stderr, "[TCC] ✅ Extracting section '%s'\n", name);
            int sz = sh[i].sh_size;
            uint8_t *out = malloc(sz);
            memcpy(out, elf + sh[i].sh_offset, sz);
            *out_size = sz;
            free(elf);
            return out;
        }
    }

    fprintf(stderr, "[TCC] No .text* section found\n");
    free(elf);
    return NULL;
}

EMSCRIPTEN_KEEPALIVE
char* extract_symbols(const char* obj_path) {
    FILE* f = fopen(obj_path, "rb");
    if (!f) {
        fprintf(stderr, "[SYM] Failed to open %s\n", obj_path);
        return NULL;
    }

    fseek(f, 0, SEEK_END);
    long sz = ftell(f);
    rewind(f);
    uint8_t* elf = malloc(sz);
    fread(elf, 1, sz, f);
    fclose(f);

    Elf64_Ehdr* eh = (Elf64_Ehdr*)elf;
    Elf64_Shdr* sh = (Elf64_Shdr*)(elf + eh->e_shoff);
    const char* sh_strtab = (const char*)(elf + sh[eh->e_shstrndx].sh_offset);

    Elf64_Shdr *symtab = NULL, *strtab = NULL;
    uint64_t text_vaddr = 0;

    for (int i = 0; i < eh->e_shnum; i++) {
        const char* name = sh_strtab + sh[i].sh_name;
        if (strcmp(name, ".symtab") == 0) symtab = &sh[i];
        else if (strcmp(name, ".strtab") == 0) strtab = &sh[i];
        else if (strncmp(name, ".text", 5) == 0) text_vaddr = sh[i].sh_addr;
    }

    if (!symtab || !strtab) {
        fprintf(stderr, "[SYM] Could not find .symtab or .strtab\n");
        free(elf);
        return NULL;
    }

    const char* strtab_data = (const char*)(elf + strtab->sh_offset);
    Elf64_Sym* symbols = (Elf64_Sym*)(elf + symtab->sh_offset);
    int symbol_count = symtab->sh_size / sizeof(Elf64_Sym);

    fprintf(stderr, "[SYM] Dumping all symbols (%d entries):\n", symbol_count);
    for (int i = 0; i < symbol_count; i++) {
        const char* name = strtab_data + symbols[i].st_name;
        unsigned char type = ELF64_ST_TYPE(symbols[i].st_info);
        unsigned char bind = symbols[i].st_info >> 4;
        fprintf(stderr, "  [%2d] name='%s' value=0x%llx type=%d bind=%d\n",
            i, name, (unsigned long long)symbols[i].st_value, type, bind);
    }

    char* out = malloc(4096);
    strcpy(out, "{");
    int wrote = 0;
    for (int i = 0; i < symbol_count; i++) {
        if (ELF64_ST_TYPE(symbols[i].st_info) == STT_FUNC) {
            const char* name = strtab_data + symbols[i].st_name;
            if (wrote++ > 0) strcat(out, ",");
            char buf[128];
            snprintf(buf, sizeof(buf), "\"%s\":%llu", name, (unsigned long long)(symbols[i].st_value + text_vaddr));
            strcat(out, buf);
        }
    }
    strcat(out, "}");
    fprintf(stderr, "[SYM] JSON output: %s\n", out);
    free(elf);
    return out;
}
