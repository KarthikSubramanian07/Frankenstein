/* fn_08004798: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { int v0; int v4; int v8; int v12; int v16; unsigned char v20; unsigned char _pad21[3]; int _pad24[7]; int v52; int v56; int v60; int v64; int v68; unsigned char v72; };

void fn_08004798(struct S *p, int a, int b, int c, int d, int e, int f)
{
    p->v60 = c;
    p->v68 = f;
    p->v72 = 1;
    p->v64 = 0;
    if (c > 0) {
        p->v0 = a;
        p->v4 = b;
        p->v8 = d;
        p->v12 = e;
        p->v52 = 0;
        p->v16 = 0;
        p->v20 = 0;
        p->v56 = 1;
    }
}
