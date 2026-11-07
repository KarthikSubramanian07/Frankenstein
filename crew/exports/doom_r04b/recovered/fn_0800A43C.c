/* fn_0800A43C: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08007D00(unsigned char *p);
void fn_0800A43C(unsigned char *p)
{
    p[0x5C]--;
    if (p[0x5C] != 0)
        return;
    fn_08007D00(p);
}
