/* fn_08004E4C: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019B94(void);
enum { IME_ADDR = 67108864 + 520 };
void fn_08004E4C(void)
{
    unsigned short *p = (unsigned short *)IME_ADDR;
    unsigned short v = *p;
    *p = 0;
    fn_08019B94();
    *p = v;
}
