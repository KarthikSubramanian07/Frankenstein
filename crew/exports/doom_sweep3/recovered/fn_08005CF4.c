/* fn_08005CF4: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char pad[0x5634]; int val; };
extern struct S *data_030064C4;
void fn_080039F8(void);
void fn_0801A95C(int);
void fn_08005CF4(int a)
{
    switch (a) {
    case 0:
        if (data_030064C4->val != 0)
            data_030064C4->val--;
        break;
    case 1:
        if (data_030064C4->val <= 14)
            data_030064C4->val++;
        break;
    }
    fn_080039F8();
    fn_0801A95C(data_030064C4->val);
}
