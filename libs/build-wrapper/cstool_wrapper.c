#define TEXT_BASE 0x2000  // match your emulator

for (size_t i = 0; i < count; i++) {
    cs_insn *insn = &insns[i];
    printf("0x%04llx:\t%s\t\t%s\n", 
        (unsigned long long)(TEXT_BASE + insn->address), 
        insn->mnemonic, insn->op_str);
}
