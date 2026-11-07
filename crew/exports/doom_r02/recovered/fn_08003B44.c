/* fn_08003B44: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08003B44(void)
{
    *(unsigned short *)(data_030064C4 + 0x25E) = 0;
}
