/* fn_08013CA4: recovered by the Frankenstein crew, run doom_align_off.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08019244(void);
void fn_0801D8A4(int, int);
void fn_0801D5E8(int);
struct S { unsigned char _0[0x878]; unsigned int a; unsigned int b; unsigned int c; };
extern struct S *data_030064C4;
void fn_08013CA4(void)
{
    fn_08019244();
    fn_0801D8A4(2, 3);
    fn_0801D5E8(data_030064C4->a);
    data_030064C4->a = 0;
    data_030064C4->c = 0;
    data_030064C4->b = 0;
}
