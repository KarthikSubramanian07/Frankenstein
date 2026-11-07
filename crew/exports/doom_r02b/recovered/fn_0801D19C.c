/* fn_0801D19C: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern signed char *data_030064C4;
void fn_0801C9EC(void);
void fn_0801CE28(void);
void fn_0801D19C(void)
{
    int v = data_030064C4[0x5A3C];
    if (v != 0) {
        if (v != 1) {
            if (v != -1)
                return;
            data_030064C4[0x5A98] = 1;
        }
        fn_0801C9EC();
    } else {
        fn_0801CE28();
    }
}
