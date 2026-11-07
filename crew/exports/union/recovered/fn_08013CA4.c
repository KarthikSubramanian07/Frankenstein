/* fn_08013CA4: recovered by the Frankenstein crew, run doom_align_on.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019244(void);
void fn_0801D8A4(int a, int b);
void fn_0801D5E8(int a);
struct S08013CA4 { char _00[0x878]; int v878; int v87c; int v880; };
extern struct S08013CA4 *data_030064C4;
void fn_08013CA4(void) {
    fn_08019244();
    fn_0801D8A4(2, 3);
    fn_0801D5E8(data_030064C4->v878);
    data_030064C4->v878 = 0;
    data_030064C4->v880 = 0;
    data_030064C4->v87c = 0;
}
