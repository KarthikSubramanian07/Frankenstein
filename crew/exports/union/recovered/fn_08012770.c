/* fn_08012770: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

extern unsigned int data_030064C4;
void fn_08012770(unsigned int a) {
    unsigned int base = data_030064C4;
    unsigned int *p = (unsigned int *)(base + 0xD64);
    int i = 0;
    while (1) {
        if (p[i] == 0)
            break;
        i++;
        if (i == 32)
            return;
    }
    unsigned int *q = (unsigned int *)(base + ((i + 214 * 4) * 4));
    q[1] = a;
}
