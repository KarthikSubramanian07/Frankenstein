/* fn_0801D7A4: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

char *fn_080207F4(int);
int fn_0801D67C(char *, int, int);
void fn_08020980(int, int);
int fn_0801D7A4(int a)
{
    char *p = fn_080207F4(a);
    int r;
    if (p == 0)
        return 0;
    r = fn_0801D67C(p + 1, 1, 0);
    fn_08020980(r, a);
    return r;
}
