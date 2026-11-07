/* fn_08005488: recovered by the Frankenstein crew, run doom_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08005488(int *p)
{
    p[3] = (int)0x80000000;
    p[0] = (int)0x80000000;
    p[2] = 0x7fffffff;
    p[1] = 0x7fffffff;
}
