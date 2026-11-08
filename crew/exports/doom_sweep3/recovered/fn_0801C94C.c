/* fn_0801C94C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08003564(void);
void fn_0801C94C(void)
{
    unsigned char *p = data_030064C4;
    if (p[0x94] != 2) {
        if (*(int *)(p + 0xdc) == 8) {
            fn_08003564();
            return;
        }
    }
    p[0x5a3c] = 1;
    *(int *)(p + 0x5a38) = 0;
    *(int *)(p + 0x5a48) = 0x8c;
}
