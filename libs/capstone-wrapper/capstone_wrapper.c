// capstone_wrapper.c
#include <stdio.h>
#include <inttypes.h>
#include <capstone/capstone.h>

void disasm_x86(const uint8_t *code, size_t code_size) {
    csh handle;
    cs_insn *insn;
    size_t count;

    if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK)
        return;

    count = cs_disasm(handle, code, code_size, 0x1000, 0, &insn);

    if (count > 0) {
        for (size_t i = 0; i < count; i++) {
            printf("0x%"PRIx64":\t%s\t\t%s\n", insn[i].address,
                   insn[i].mnemonic, insn[i].op_str);
        }
        cs_free(insn, count);
    } else {
        printf("ERROR: Failed to disassemble code!\n");
    }

    cs_close(&handle);
}
