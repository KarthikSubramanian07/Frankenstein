/* fn_08001A94: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S_030064C4 { char _00[120]; int unk78; int unk7c; };
extern struct S_030064C4 *data_030064C4;
void fn_0801A9D4(int);
int fn_0801D480(int);
void fn_08001A94(int arg)
{
    fn_0801A9D4(29);
    data_030064C4->unk78 = 0x41A;
    data_030064C4->unk7c = fn_0801D480(arg);
}
