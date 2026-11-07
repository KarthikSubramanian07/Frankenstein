/* fn_08013CA4: recovered by the Frankenstein crew, run doom_r13.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019244(void);
void fn_0801D8A4(int a, int b);
void fn_0801D5E8(int a);
struct S { unsigned char _0[0x878]; int v0; int v1; int v2; };
extern struct S *data_030064C4;
void fn_08013CA4(void) {
    fn_08019244();
    fn_0801D8A4(2, 3);
    fn_0801D5E8(data_030064C4->v0);
    data_030064C4->v0 = 0;
    data_030064C4->v2 = 0;
    data_030064C4->v1 = 0;
}
