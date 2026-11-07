/* fn_08004E68: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019BC4(void);
void fn_08004E68(void)
{
    unsigned int addr = 67108864 + 520;
    unsigned short *p = (unsigned short *)addr;
    unsigned short v = *p;
    *p = 0;
    fn_08019BC4();
    *p = v;
}
