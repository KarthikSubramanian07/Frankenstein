/* fn_08019B94: salvaged by the Frankenstein crew from run doom_sweep1, attempt 1.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801E2F0(int arg);
struct S_030064C4 { char pad[0x4D4]; int val; };
extern struct S_030064C4 *data_030064C4;
void fn_08019B94(void)
{
    fn_0801E2F0(data_030064C4->val);
}
