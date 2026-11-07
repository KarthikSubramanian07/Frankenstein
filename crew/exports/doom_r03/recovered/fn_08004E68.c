/* fn_08004E68: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void fn_08019BC4(void);
void fn_08004E68(void)
{
    unsigned short *p = (unsigned short *)67109384;
    unsigned short ime = *p;
    *p = 0;
    fn_08019BC4();
    *p = ime;
}
