/* fn_08013CA4: recovered by the Frankenstein crew, run doom_r12.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08019244(void);
void fn_0801D8A4(int a, int b);
void fn_0801D5E8(int a);
void fn_08013CA4(void)
{
    fn_08019244();
    fn_0801D8A4(2, 3);
    fn_0801D5E8(*(int *)(data_030064C4 + 0x878));
    *(int *)(data_030064C4 + 0x878) = 0;
    *(int *)(data_030064C4 + 0x880) = 0;
    *(int *)(data_030064C4 + 0x87c) = 0;
}
