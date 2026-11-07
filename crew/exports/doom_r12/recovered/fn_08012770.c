/* fn_08012770: recovered by the Frankenstein crew, run doom_r12.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { char pad[0xD64]; int arr[32]; };
extern struct S *data_030064C4;
void fn_08012770(int a)
{
    int i;
    for (i = 0; i < 32; i++) {
        if (data_030064C4->arr[i] == 0) {
            data_030064C4->arr[i] = a;
            break;
        }
    }
}
