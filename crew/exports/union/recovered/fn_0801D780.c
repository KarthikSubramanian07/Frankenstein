/* fn_0801D780: salvaged by the Frankenstein crew from run doom_sweep1, attempt 1.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_0801D67C(int, int, int);
void fn_08020990(int, int, int);
int fn_0801D780(int a, int b, int c, int d)
{
    int m = b * a;
    int t = fn_0801D67C(m, c, d);
    fn_08020990(t, 0, m);
    return t;
}
