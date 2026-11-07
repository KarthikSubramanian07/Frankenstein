/* fn_08005020: salvaged by the Frankenstein crew from run doom_sweep1, attempt 1.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08000464(void);
extern unsigned char *data_030064C4;
extern int data_030064CC;

int fn_08005020(void)
{
    int v = fn_08000464();
    *(int *)(data_030064C4 + 0x5A30) = v;
    data_030064CC = v;
    return 1;
}
