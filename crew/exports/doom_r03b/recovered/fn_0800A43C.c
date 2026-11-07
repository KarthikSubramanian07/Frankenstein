/* fn_0800A43C: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void fn_08007D00(unsigned char *);
void fn_0800A43C(unsigned char *p)
{
    p[92]--;
    if (p[92] != 0)
        return;
    fn_08007D00(p);
}
