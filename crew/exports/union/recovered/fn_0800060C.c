/* fn_0800060C: recovered by the Frankenstein crew, run doom_par0.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char f0; unsigned char _p1[3]; int f4; int f8; int f12; int f16; int f20; int f24; int f28; int f32; int f36; int f40; int f44; int f48; int f52; int f56; int f60; int f64; int f68; };
extern struct S *data_030064C4;
void fn_0800060C(void) {
    struct S *p = data_030064C4;
    if (p->f4 != 0 || p->f8 != 0) {
        p->f0 &= ~8;
        p = data_030064C4;
        p->f68 = 0x7fffffff;
    }
    p->f12 += p->f4;
    p->f16 += p->f8;
    if (p->f12 + p->f28 / 2 > p->f44) {
        p->f12 = p->f44 - p->f28 / 2;
    } else if (p->f12 + p->f28 / 2 < p->f36) {
        p->f12 = p->f36 - p->f28 / 2;
    }
    if (p->f16 + p->f32 / 2 > p->f48) {
        p->f16 = p->f48 - p->f32 / 2;
    } else if (p->f16 + p->f32 / 2 < p->f40) {
        p->f16 = p->f40 - p->f32 / 2;
    }
    p->f20 = p->f28 + p->f12;
    p->f24 = p->f32 + p->f16;
}
