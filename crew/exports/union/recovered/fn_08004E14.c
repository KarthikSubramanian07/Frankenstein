/* fn_08004E14: salvaged by the Frankenstein crew from run doom_sweep1, attempt 2.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019BB0(int);
void fn_08004E14(void)
{
    unsigned short *p = (unsigned short *)0x04000208;
    unsigned short ime = *p;
    *p = 0;
    fn_08019BB0(1);
    *p = ime;
}
