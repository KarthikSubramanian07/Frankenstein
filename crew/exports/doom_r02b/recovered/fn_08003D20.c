/* fn_08003D20: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_030064BC;
extern unsigned char *data_030064C4;
void fn_08003D20(int x) {
    data_030064BC = x;
    data_030064C4[212] = 5;
}
