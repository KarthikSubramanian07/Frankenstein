/* fn_080035CC: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08003064(unsigned int);
extern unsigned char *data_030064C4;
void fn_080035CC(unsigned int a) {
    *(int *)(data_030064C4 + 0x563C) = -1;
    data_030064C4[0xD5] = 0;
    *(int *)(data_030064C4 + 0xDC) = *(int *)(data_030064C4 + 0x200) + 1;
    fn_08003064(a);
    data_030064C4[0xD4] = 0;
}
