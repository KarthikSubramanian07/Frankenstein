/* fn_080050DC: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned int data_030064C4;
void fn_08005424(const char *a, int b, int c);
void fn_080050DC(void)
{
    *(unsigned int *)(data_030064C4 + 0x5A34) = 0xA00078;
    fn_08005424("x", 120, 160);
}
