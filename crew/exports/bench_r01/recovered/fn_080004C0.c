/* fn_080004C0: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_080004C0(int a, int b) {
    int h = b / 2;
    if ((a ^ b) < 0)
        return (a - h) / b;
    else
        return (a + h) / b;
}
