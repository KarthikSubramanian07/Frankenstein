/* fn_080002E4: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_080002E4(int x)
{
    int c = 0;
    while (x) {
        x &= x - 1;
        c++;
    }
    return c;
}
