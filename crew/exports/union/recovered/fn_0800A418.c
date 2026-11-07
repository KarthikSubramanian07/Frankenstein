/* fn_0800A418: salvaged by the Frankenstein crew from run doom_sweep1, attempt 2.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801A2C8(unsigned char *, int);
void fn_08007D00(unsigned char *);
void fn_0800A418(unsigned char *a)
{
    fn_0801A2C8(a, 95);
    a[92]--;
    if (a[92] != 0)
        return;
    fn_08007D00(a);
}
