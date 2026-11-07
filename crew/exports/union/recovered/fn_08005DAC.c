/* fn_08005DAC: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_08025A44;
extern unsigned char *data_030064C4;
void fn_08001BA0(void);
void fn_08004024(void);
void fn_08005DAC(int a)
{
    if (data_08025A44 != a)
        return;
    if (data_030064C4[0x25f] != 0)
        fn_08004024();
    data_030064C4[0x792] = 0;
    *(unsigned short *)(data_030064C4 + 0x78c) = 0;
    fn_08001BA0();
}
