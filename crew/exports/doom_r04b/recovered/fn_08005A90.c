/* fn_08005A90: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_0801D480(const char *a);
void fn_0801C130(int a, int b, int c, int d);
void fn_08005A90(void)
{
    int x = fn_0801D480("test");
    fn_0801C130(94, 2, 0, x);
}
