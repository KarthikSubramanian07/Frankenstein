/* fn_08003564: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08002264(void);
void fn_08003564(void)
{
    unsigned char *p = data_030064C4;
    unsigned int v;
    int bit;
    int t;
    p[0xD4] = 8;
    t = p[0x259];
    if (t != 0)
        p[0x1D4] = 1;
    v = *(unsigned int *)(p + 0xDC);
    if (p[0x94] != 2) {
        if (v != 8)
            return;
        p[0xD4] = 7;
        return;
    }
    if (v > 31)
        return;
    bit = 1 << v;
    if ((bit & 0x40100840) == 0) {
        if ((bit & 0x80008000) == 0)
            return;
        if (t == 0)
            return;
    }
    fn_08002264();
}
