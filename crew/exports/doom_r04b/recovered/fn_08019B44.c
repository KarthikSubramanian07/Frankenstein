/* fn_08019B44: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
int fn_08019B44(unsigned int a)
{
    if (a > 7)
        return 0;
    return *(unsigned int *)(data_030064C4 + a * 16 + 1240) != 0;
}
