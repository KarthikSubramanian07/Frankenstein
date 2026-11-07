/* fn_0801C130: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_0801D568(int);
int fn_0801BFD4(int, int, int, int);
void fn_0801C130(int a, int b, int c, int d)
{
    fn_0801BFD4(a, b, c, fn_0801D568(d));
}
