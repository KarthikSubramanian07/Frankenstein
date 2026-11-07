/* fn_08006B20: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned int *data_030064C4;
extern unsigned char data_0802638C[256];
unsigned int fn_08006B20(void) {
    unsigned int v = (data_030064C4[501] + 1) & 0xFF;
    data_030064C4[501] = v;
    return data_0802638C[v];
}
