/* fn_08001A74: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801A9D4(int);
int fn_0801D480(int);
struct S { int v[31]; int x; };
extern struct S *data_030064C4;
void fn_08001A74(int a)
{
    fn_0801A9D4(66);
    data_030064C4->x = fn_0801D480(a);
}
