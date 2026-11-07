/* fn_08005AD0: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801C130(int a, int b, int c, int d);
int fn_0801D480(const char *s);
void fn_08005AD0(void)
{
    fn_0801C130(96, 14, 0, fn_0801D480("1234567"));
    fn_0801C130(54, 38, 0, fn_0801D480("ABCDEFG"));
}
