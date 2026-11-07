/* fn_08019014: salvaged by the Frankenstein crew from run doom_sweep3, attempt 5.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int *data_030064C4;
int fn_0801D434(int);
void fn_080005A8(const char *, int);
static const char rodata_pad[284] = "x";
int fn_08019014(int a)
{
    int v = fn_0801D434(a);
    if (v == -1) {
        fn_080005A8(rodata_pad + 284, a);
    }
    return v - data_030064C4[1088];
}
