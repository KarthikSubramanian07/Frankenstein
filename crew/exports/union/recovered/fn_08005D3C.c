/* fn_08005D3C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned int *data_030064C4;
void fn_0801C23C(unsigned int);
void fn_0801C230(unsigned int);
void fn_080039F8(void);
void fn_08005D3C(int a)
{
    unsigned int v = data_030064C4[33];
    switch (a) {
    case 0:
        if (v != 0) {
            v--;
            data_030064C4[33] = v;
        }
        break;
    case 1:
        if (v <= 3) {
            v++;
            data_030064C4[33] = v;
        }
        break;
    default:
        break;
    }
    fn_0801C23C(v);
    fn_0801C230(0);
    fn_080039F8();
}
