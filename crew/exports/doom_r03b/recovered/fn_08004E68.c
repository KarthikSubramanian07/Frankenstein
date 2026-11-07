/* fn_08004E68: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019BC4(void);
void fn_08004E68(void)
{
    unsigned int addr = (64 << 20) + 520;
    unsigned short ime = *(unsigned short *)addr;
    *(unsigned short *)addr = 0;
    fn_08019BC4();
    *(unsigned short *)addr = ime;
}
