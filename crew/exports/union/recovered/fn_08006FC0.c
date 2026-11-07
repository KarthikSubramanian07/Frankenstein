/* fn_08006FC0: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Big { int unk; int arr[534]; };
extern struct Big *data_030064C4;
void fn_08006FC0(int a)
{
    struct Big *b = data_030064C4;
    int *p = &b->arr[502];
    int i = 0;
    while (*p != 0) {
        i++;
        p++;
        if (i == 32)
            return;
    }
    b->arr[i + 502] = a;
}
