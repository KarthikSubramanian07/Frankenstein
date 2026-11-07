/* fn_08019060: recovered by the Frankenstein crew, run doom_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_03006594;
struct S { int f0; int f1; int f2; int f3; int f4; int f5; int f6; };
void fn_08019060(struct S *a)
{
    a->f2 = 0;
    a->f1 = 0;
    a->f0 = 0;
    a->f4 = 0;
    a->f3 = 0;
    a->f5 = 0;
    a->f6 = data_03006594;
}
