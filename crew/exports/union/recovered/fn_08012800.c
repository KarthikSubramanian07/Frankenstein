/* fn_08012800: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_030064C4;
void fn_08020990(int, int, int);
void fn_08012800(void)
{
    fn_08020990(data_030064C4 + 0xD64, 0, 0x80);
}
