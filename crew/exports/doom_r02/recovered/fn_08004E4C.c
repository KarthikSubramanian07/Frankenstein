/* fn_08004E4C: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void fn_08019B94(void);
void fn_08004E4C(void)
{
    unsigned short x = *(unsigned short *)67109384;
    *(unsigned short *)67109384 = 0;
    fn_08019B94();
    *(unsigned short *)67109384 = x;
}
