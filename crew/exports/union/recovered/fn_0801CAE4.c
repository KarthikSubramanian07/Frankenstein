/* fn_0801CAE4: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_0801C9EC(void);
void fn_0801CAE4(void)
{
    data_030064C4[0x5A98] = 1;
    fn_0801C9EC();
}
