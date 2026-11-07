/* fn_0800253C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void *data_030064C4;
extern void fn_0801AA4C(int, int);
struct Elem { short f0; short f1; short f2; short f3; short f4; };
struct Other { char pad[0x68]; int idx; };
struct S {
 unsigned char pad0[0x70];
 unsigned char f70;
 unsigned char pad1[0x27];
 int f98;
 unsigned char pad2[0xC];
 int fA8;
 int fAC;
 struct Elem *fB0;
 int fB4;
 int fB8;
 unsigned char pad3[8];
 short fC4;
 unsigned char pad4[0x686];
 struct Elem *f74C;
 struct Other *f750;
};
void fn_0800253C(void)
{
 struct S *s = (struct S *)data_030064C4;
 s->f70 = 255;
 s->fA8 = 0;
 struct Elem *p = s->f74C + s->f750->idx;
 s->fB0 = p;
 s->fAC = p->f2;
 s->f98 = 2;
 s->fB4 = 0;
 s->fB8 = 0;
 s->fC4 = 0;
 fn_0801AA4C(63, 1);
}
