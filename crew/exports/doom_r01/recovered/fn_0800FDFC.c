/* fn_0800FDFC: recovered by the Frankenstein crew, run doom_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_0800FDFC(int a, int b)
{
    if (a < 0)
        a = -a;
    if (b < 0)
        b = -b;
    int s = a + b;
    if (b <= a)
        return s - (b >> 1);
    else
        return s - (a >> 1);
}
