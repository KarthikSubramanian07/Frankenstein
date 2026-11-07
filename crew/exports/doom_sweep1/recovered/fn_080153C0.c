/* fn_080153C0: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_080153C0(int a, int *b)
{
    int result;

    if (a == 1) {
        result = b[5] != 0;
    } else if (a == 2) {
        result = 0;
    } else {
        result = 1;
        if (a == 0)
            result = b[4] != 0;
    }
    return result;
}
