/* fn_08004E68: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019BC4(void);
void fn_08004E68(void)
{
    unsigned short s = *(unsigned short *)(67108864 + 520);
    *(unsigned short *)(67108864 + 520) = 0;
    fn_08019BC4();
    *(unsigned short *)(67108864 + 520) = s;
}
