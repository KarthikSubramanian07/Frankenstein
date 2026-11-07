/* fn_03002660: recovered by the Frankenstein crew, run doom_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_03002660(int a, int b)
{
    return (int)(((long long)a * (long long)b) >> 16);
}
