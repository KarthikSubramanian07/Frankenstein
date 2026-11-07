/* fn_080039DC: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_080036FC(void);
extern unsigned char *data_030064C4;
void fn_080039DC(unsigned char a)
{
    data_030064C4[600] = a;
    fn_080036FC();
}
