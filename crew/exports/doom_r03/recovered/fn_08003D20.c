/* fn_08003D20: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned int data_030064BC;
extern unsigned char *data_030064C4;
void fn_08003D20(unsigned int a) {
    data_030064BC = a;
    data_030064C4[0xD4] = 5;
}
