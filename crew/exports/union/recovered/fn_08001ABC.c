/* fn_08001ABC: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern signed char *data_030064C4;
int fn_08006288(int);
int fn_08005828(int);
int fn_0801B724(int);
int fn_08001164(int);
void fn_08003184(int);
void fn_08001ABC(int a)
{
    if (*(int *)(data_030064C4 + 476) <= 2)
        return;
    if (fn_08006288(a) != 0)
        return;
    if (data_030064C4[213] == 0) {
        if (fn_08005828(a) != 0)
            return;
        if (fn_0801B724(a) != 0)
            return;
        if (fn_08001164(a) != 0)
            return;
    }
    fn_08003184(a);
}
