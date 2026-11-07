/* fn_08005D7C: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_08025A44;
struct S_030064C4 { unsigned char _00[0x788]; int val; };
extern struct S_030064C4 *data_030064C4;
void fn_08003B18(int a, int b, int c);
void fn_08005D7C(int a)
{
    if (a != data_08025A44)
        return;
    fn_08003B18(4, data_030064C4->val + 1, 1);
}
