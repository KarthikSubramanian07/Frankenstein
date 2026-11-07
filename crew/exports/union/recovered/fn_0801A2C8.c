/* fn_0801A2C8: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08019E08(int, int, int);
void fn_0801A2C8(int a, int b)
{
    fn_08019E08(a, b, *(int *)(data_030064C4 + 0x5630));
}
