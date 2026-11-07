/* fn_0801D19C: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801C9EC(void);
void fn_0801CE28(void);
extern signed char *data_030064C4;
void fn_0801D19C(void) {
    signed char *p = data_030064C4;
    int v = p[0x5A3C];
    if (v == 0) {
        fn_0801CE28();
        return;
    }
    if (v != 1) {
        if (v + 1 != 0)
            return;
        p[0x5A98] = 1;
    }
    fn_0801C9EC();
}
