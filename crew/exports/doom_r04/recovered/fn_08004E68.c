/* fn_08004E68: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019BC4(void);
void fn_08004E68(void)
{
    unsigned short *ime_reg = (unsigned short *)((64 << 20) + 520);
    unsigned short ime = *ime_reg;
    *ime_reg = 0;
    fn_08019BC4();
    *ime_reg = ime;
}
