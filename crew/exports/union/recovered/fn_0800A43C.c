/* fn_0800A43C: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08007D00(unsigned char *a);
void fn_0800A43C(unsigned char *a)
{
    unsigned char v = a[92] - 1;
    a[92] = v;
    if (v) return;
    fn_08007D00(a);
}
