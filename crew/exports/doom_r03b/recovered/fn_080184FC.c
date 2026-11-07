/* fn_080184FC: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080184FC(void)
{
    unsigned char *base = data_030064C4;
    unsigned int x = 0x10F0;
    unsigned int y = 0x10F4;
    unsigned int v = (unsigned int)(base + x);
    *(unsigned int *)(base + y) = v;
    *(unsigned int *)(base + x) = v;
}
