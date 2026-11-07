/* fn_08004798: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct { int v0; int v4; int v8; int v12; int v16; unsigned char v20; unsigned char _p21[31]; int v52; int v56; int v60; int v64; int v68; unsigned char v72; } S;
void fn_08004798(S *p, int a1, int a2, int a3, int a4, int a5, int a6)
{
    p->v60 = a3;
    p->v68 = a6;
    p->v72 = 1;
    p->v64 = 0;
    if (a3 > 0) {
        p->v0 = a1;
        p->v4 = a2;
        p->v8 = a4;
        p->v12 = a5;
        p->v52 = 0;
        p->v16 = 0;
        p->v20 = 0;
        p->v56 = 1;
    }
}
