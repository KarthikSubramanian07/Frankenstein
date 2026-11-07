/* fn_080035CC: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S {
    unsigned char pad0[0xD4];
    unsigned char f_D4;
    unsigned char f_D5;
    unsigned char pad1[6];
    int f_DC;
    unsigned char pad2[0x200 - 0xE0];
    int f_200;
    unsigned char pad3[0x563C - 0x204];
    int f_563C;
};
extern struct S * data_030064C4;
void fn_08003064(void);
void fn_080035CC(void)
{
    data_030064C4->f_563C = -1;
    data_030064C4->f_D5 = 0;
    data_030064C4->f_DC = data_030064C4->f_200 + 1;
    fn_08003064();
    data_030064C4->f_D4 = 0;
}
