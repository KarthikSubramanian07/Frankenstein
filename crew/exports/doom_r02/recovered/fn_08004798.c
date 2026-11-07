/* fn_08004798: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08004798(int *a0, int a1, int a2, int a3, int a4, int a5, int a6)
{
    a0[15] = a3;
    a0[17] = a6;
    ((unsigned char *)a0)[72] = 1;
    a0[16] = 0;
    if (a3 > 0) {
        a0[0] = a1;
        a0[1] = a2;
        a0[2] = a4;
        a0[3] = a5;
        a0[13] = 0;
        a0[4] = 0;
        ((unsigned char *)a0)[20] = 0;
        a0[14] = 1;
    }
}
