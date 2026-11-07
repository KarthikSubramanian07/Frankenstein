/* fn_08005D7C: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_08025A44;
extern int *data_030064C4;
void fn_08003B18(int, int, int);
void fn_08005D7C(int a)
{
    if (data_08025A44 != a)
        return;
    fn_08003B18(4, data_030064C4[482] + 1, 1);
}
