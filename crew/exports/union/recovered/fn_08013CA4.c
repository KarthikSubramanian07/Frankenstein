/* fn_08013CA4: recovered by the Frankenstein crew, run doom_r14.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { char pad[0x878]; int f878; int f87c; int f880; };
extern struct S *data_030064C4;
extern void fn_08019244(void);
extern void fn_0801D8A4(int a, int b);
extern void fn_0801D5E8(int a);
void fn_08013CA4(void)
{
    fn_08019244();
    fn_0801D8A4(2, 3);
    fn_0801D5E8(data_030064C4->f878);
    data_030064C4->f878 = 0;
    data_030064C4->f880 = 0;
    data_030064C4->f87c = 0;
}
