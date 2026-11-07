/* fn_08001A94: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void fn_0801A9D4(int);
extern int fn_0801D480(int);
extern int *data_030064C4;
void fn_08001A94(int a) {
    fn_0801A9D4(29);
    data_030064C4[30] = 1050;
    data_030064C4[31] = fn_0801D480(a);
}
