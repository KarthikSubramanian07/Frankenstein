/* fn_08006B20: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern struct { unsigned char _00[0x7D4]; int v; } *data_030064C4;
extern unsigned char data_0802638C[256];
int fn_08006B20(void)
{
    int v = data_030064C4->v;
    v = (v + 1) & 0xFF;
    data_030064C4->v = v;
    return data_0802638C[v];
}
