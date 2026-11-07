/* fn_08019B44: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern struct { int filler[310]; int vals[8][4]; } *data_030064C4;
int fn_08019B44(unsigned int a)
{
    if (a > 7)
        return 0;
    return data_030064C4->vals[a][0] != 0;
}
