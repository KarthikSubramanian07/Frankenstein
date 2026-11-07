/* fn_08000EC8: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
extern unsigned char data_08025678[16];
void fn_0801B724(void *p);
void fn_08000EC8(void)
{
    *data_030064C4 = 0;
    fn_0801B724(data_08025678);
    data_030064C4[0x5C] = 1;
}
