/* fn_08003B44: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08003B44(void)
{
    extern unsigned char *data_030064C4;
    *(unsigned short *)(data_030064C4 + 0x25E) = 0;
}
