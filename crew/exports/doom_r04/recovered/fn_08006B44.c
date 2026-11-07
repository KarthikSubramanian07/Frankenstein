/* fn_08006B44: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned int *data_030064C4;
void fn_08006B44(void) {
    *(unsigned int *)((unsigned char *)data_030064C4 + 2008) = 0;
    *(unsigned int *)((unsigned char *)data_030064C4 + 2004) = 0;
}
