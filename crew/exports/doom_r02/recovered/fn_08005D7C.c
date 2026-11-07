/* fn_08005D7C: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08003B18(int, int, int);
extern int data_08025A44;
extern int *data_030064C4;
void fn_08005D7C(int a) {
    if (data_08025A44 != a)
        return;
    fn_08003B18(4, *(int *)((char *)data_030064C4 + 0x788) + 1, 1);
}
