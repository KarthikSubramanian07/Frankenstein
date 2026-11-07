/* fn_08018588: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_030064C4;
int fn_08018588(int *a)
{
    int base = data_030064C4 + 0x10F0;
    if (a == 0)
        a = (int *)base;
    int v = a[1];
    if (v == base)
        return 0;
    return v;
}
