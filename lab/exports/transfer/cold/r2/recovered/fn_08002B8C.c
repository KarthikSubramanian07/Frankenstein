/* fn_08002B8C: recovered by the Frankenstein crew, run transfer_cold_2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int *data_08013440[];
void fn_08002B8C(int a, int b, int c, int d, int e)
{
    int *p = data_08013440[a];
    p[0] = c;
    p[1] = b;
    p[2] = d | e | 0x80000000;
}
