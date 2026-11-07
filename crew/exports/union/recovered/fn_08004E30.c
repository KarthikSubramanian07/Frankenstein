/* fn_08004E30: salvaged by the Frankenstein crew from run doom_sweep1, attempt 1.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019BB0(int);
void fn_08004E30(void)
{
    unsigned short ime = *(volatile unsigned short *)0x04000208;
    *(volatile unsigned short *)0x04000208 = 0;
    fn_08019BB0(0);
    *(volatile unsigned short *)0x04000208 = ime;
}
