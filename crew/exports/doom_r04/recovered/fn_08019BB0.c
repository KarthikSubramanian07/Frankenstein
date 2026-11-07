/* fn_08019BB0: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019BB0(int a)
{
    extern unsigned char *data_030064C4;
    data_030064C4[0x558] = (a != 0);
}
