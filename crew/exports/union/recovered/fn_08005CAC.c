/* fn_08005CAC: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080039F8(int);
void fn_0801A99C(int);
void fn_08005CAC(int a)
{
    switch (a) {
    case 1:
        if (*(int *)(data_030064C4 + 0x5630) <= 14)
            (*(int *)(data_030064C4 + 0x5630))++;
        break;
    case 0:
        if (*(int *)(data_030064C4 + 0x5630) != 0)
            (*(int *)(data_030064C4 + 0x5630))--;
        break;
    default:
        break;
    }
    fn_080039F8(a);
    fn_0801A99C(*(int *)(data_030064C4 + 0x5630));
}
