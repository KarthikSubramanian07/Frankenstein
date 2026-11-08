/* fn_080039B8: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080037D8(void);
void fn_080039B8(unsigned char a)
{
    data_030064C4[0x258] = a;
    data_030064C4[0x25E] = 0;
    fn_080037D8();
}
