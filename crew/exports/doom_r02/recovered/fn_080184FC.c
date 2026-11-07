/* fn_080184FC: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080184FC(void)
{
    unsigned char *p = data_030064C4;
    unsigned char *q = p + 0x10F0;
    *(unsigned char **)(p + 0x10F4) = q;
    *(unsigned char **)(p + 0x10F0) = q;
}
