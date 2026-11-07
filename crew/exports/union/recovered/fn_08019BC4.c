/* fn_08019BC4: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801E7B8(int, int);
extern int *data_030064C4;
void fn_08019BC4(int a)
{
    int v = (a * 95) / 15;
    fn_0801E7B8(*(int *)((char *)data_030064C4 + 0x4D4), v);
}
