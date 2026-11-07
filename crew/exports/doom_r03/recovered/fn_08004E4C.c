/* fn_08004E4C: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019B94(void);
void fn_08004E4C(void)
{
    unsigned int addr = 0x04000000 + 0x208;
    unsigned short *p = (unsigned short *)addr;
    unsigned short ime = *p;
    *p = 0;
    fn_08019B94();
    *p = ime;
}
