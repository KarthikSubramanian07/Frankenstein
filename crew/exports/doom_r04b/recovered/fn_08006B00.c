/* fn_08006B00: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int *data_030064C4;
extern unsigned char data_0802638C[256];
int fn_08006B00(void)
{
    int n = data_030064C4[502] + 1;
    n &= 0xFF;
    data_030064C4[502] = n;
    return data_0802638C[n];
}
