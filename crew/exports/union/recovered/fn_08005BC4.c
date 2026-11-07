/* fn_08005BC4: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080039DC(void);
void fn_08005BC4(int a)
{
    *(int *)(data_030064C4 + 0x780) = a;
    fn_080039DC();
    data_030064C4[0x792] = 0;
    *(short *)(data_030064C4 + 0x78C) = 0;
}
