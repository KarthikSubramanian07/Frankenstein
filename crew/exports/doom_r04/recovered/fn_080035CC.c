/* fn_080035CC: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S {
    char pad1[0xD4];
    unsigned char f_D4;
    unsigned char f_D5;
    char pad2[6];
    int f_DC;
    char pad3[0x120];
    int f_200;
    char pad4[0x5438];
    int f_563C;
};
extern struct S *data_030064C4;
void fn_08003064(int);
void fn_080035CC(int a)
{
    data_030064C4->f_563C = -1;
    data_030064C4->f_D5 = 0;
    data_030064C4->f_DC = data_030064C4->f_200 + 1;
    fn_08003064(a);
    data_030064C4->f_D4 = 0;
}
