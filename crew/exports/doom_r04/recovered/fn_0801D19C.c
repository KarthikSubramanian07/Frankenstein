/* fn_0801D19C: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801C9EC(void);
void fn_0801CE28(void);
extern signed char *data_030064C4;
void fn_0801D19C(void)
{
    signed char *p = data_030064C4;
    int v = p[0x5A3C];
    switch (v) {
    case 0:
        fn_0801CE28();
        break;
    case 1:
        fn_0801C9EC();
        break;
    case -1:
        p[0x5A98] = 1;
        fn_0801C9EC();
        break;
    }
}
