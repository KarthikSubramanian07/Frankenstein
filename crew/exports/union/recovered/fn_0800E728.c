/* fn_0800E728: recovered by the Frankenstein crew, run doom_align_on.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Inner { unsigned char _0[24]; unsigned short f24; short f26; unsigned char _28[2]; unsigned short f30; };
struct P { int f0; int f4; struct Inner *f8; };
struct E { unsigned char _0[3]; unsigned char f3; };
struct Obj { int f0; int f4; int f8; int f12; int f16; };
struct Base { unsigned char _0[0x920]; struct Obj *f920; unsigned char _924[0x10]; int f934; unsigned char _938[0x4CC]; struct E *fE04; };
extern struct Base *data_030064C4;
void fn_08010030(struct Inner *a);
int fn_0800FE1C(int x, int y, struct Inner *a);
void fn_080170D0(void *o, struct Inner *a, int c);
void fn_0801A2C8(void *o, int v);
int fn_0800E728(struct P *p) {
    if ((data_030064C4->fE04[p->f8->f30].f3 & 0x40) || (p->f8->f26 == ((data_030064C4->fE04[p->f8->f30].f3 >> 7) << 8))) {
        fn_08010030(p->f8);
        if (data_030064C4->f934 > 0)
            return 1;
        fn_0801A2C8(data_030064C4->f920, 0x51);
        return 0;
    } else {
        int r = fn_0800FE1C(data_030064C4->f920->f12, data_030064C4->f920->f16, p->f8);
        fn_080170D0(data_030064C4->f920, p->f8, r == 1);
        return (p->f8->f24 >> 9) & 1;
    }
}
