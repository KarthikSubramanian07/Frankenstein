/* fn_080002F8: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_080002F8(int a, int b)
{
    int d = a - b;
    if (d < 0)
        d = -d;
    return d;
}
