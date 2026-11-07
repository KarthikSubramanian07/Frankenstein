/* fn_08001A5C: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int *data_030064C4;
int fn_0801D480(void);
void fn_08001A5C(void)
{
    int *p = data_030064C4;
    p[31] = fn_0801D480();
}
