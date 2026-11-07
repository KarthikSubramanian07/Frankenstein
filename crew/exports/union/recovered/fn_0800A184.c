/* fn_0800A184: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801A2C8(int, int);
void fn_080131EC(int *, int);
void fn_0800A184(int *a, int b)
{
    fn_0801A2C8(*a, 6);
    fn_080131EC(a, b);
}
