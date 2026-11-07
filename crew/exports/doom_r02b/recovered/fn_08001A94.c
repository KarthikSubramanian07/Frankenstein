/* fn_08001A94: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801A9D4(int);
int fn_0801D480(int);
extern int *data_030064C4;
void fn_08001A94(int a)
{
    fn_0801A9D4(29);
    int *p = data_030064C4;
    p[30] = 0x41a;
    p[31] = fn_0801D480(a);
}
