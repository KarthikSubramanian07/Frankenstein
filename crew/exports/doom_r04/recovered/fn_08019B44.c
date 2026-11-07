/* fn_08019B44: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern struct { char pad[1240]; int v[8][4]; } *data_030064C4;
int fn_08019B44(unsigned int a) {
    if (a > 7)
        return 0;
    return data_030064C4->v[a][0] != 0;
}
