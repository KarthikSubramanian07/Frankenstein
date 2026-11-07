/* fn_0801D19C: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_0801C9EC(void);
void fn_0801CE28(void);
void fn_0801D19C(void)
{
    unsigned char *base = data_030064C4;
    int v = *(signed char *)(base + 0x5A3C);
    if (v == 0) {
        fn_0801CE28();
    } else {
        if (v != 1) {
            if (v != -1)
                return;
            base[0x5A98] = 1;
        }
        fn_0801C9EC();
    }
}
