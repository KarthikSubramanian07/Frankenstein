/* fn_08005B9C: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_080039B8(void);
extern unsigned char *data_030064C4;
void fn_08005B9C(void)
{
    fn_080039B8();
    data_030064C4[0x792] = 0;
    *(unsigned short *)&data_030064C4[0x78C] = 0;
}
