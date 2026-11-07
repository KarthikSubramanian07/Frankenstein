/* fn_08004AC4: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned int *data_030064C4;
void fn_080048F4(unsigned int *p);
void fn_0800478C(unsigned int *p);
void fn_08004AC4(void)
{
    fn_080048F4(data_030064C4 + 231);
    fn_0800478C(data_030064C4 + 216);
}
