/* fn_0801C924: salvaged by the Frankenstein crew from run doom_sweep1, attempt 1.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08003564(void);
void fn_0801C924(void)
{
    int *p = (int *)(data_030064C4 + 0x5A48);
    int v = *p - 1;
    *p = v;
    if (v == 0)
        fn_08003564();
}
