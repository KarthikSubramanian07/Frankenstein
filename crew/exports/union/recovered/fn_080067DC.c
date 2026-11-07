/* fn_080067DC: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

extern unsigned char *data_030064C4;
void fn_080067DC(void) {
    data_030064C4[0x792] = 0;
    *(unsigned short *)&data_030064C4[0x78C] = 0;
}
