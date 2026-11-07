/* fn_08006B20: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
extern unsigned char data_0802638C[256];
unsigned int fn_08006B20(void)
{
    unsigned int v = *(unsigned int *)(data_030064C4 + 0x7D4);
    v = (v + 1) & 0xFF;
    *(unsigned int *)(data_030064C4 + 0x7D4) = v;
    return data_0802638C[v];
}
