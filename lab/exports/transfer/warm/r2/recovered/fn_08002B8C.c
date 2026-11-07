/* fn_08002B8C: recovered by the Frankenstein crew, run transfer_warm_2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int *data_08013440[];
void fn_08002B8C(int a0, int a1, int a2, int a3, int a4)
{
    int *p = data_08013440[a0];
    p[0] = a2;
    p[1] = a1;
    p[2] = a3 | a4 | (int)0x80000000;
}
