/* fn_08019048: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08018AAC(char *);
int fn_08019048(char *p)
{
    if (*p == '-')
        return 0;
    return fn_08018AAC(p);
}
