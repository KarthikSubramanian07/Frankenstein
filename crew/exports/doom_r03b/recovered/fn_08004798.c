/* fn_08004798: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S {
    int v0;
    int v1;
    int v2;
    int v3;
    int v4;
    unsigned char b20;
    unsigned char pad[31];
    int v13;
    int v14;
    int v15;
    int v16;
    int v17;
    unsigned char b72;
};

void fn_08004798(struct S *p, int a1, int a2, int a3, int a4, int a5, int a6)
{
    p->v15 = a3;
    p->v17 = a6;
    p->b72 = 1;
    p->v16 = 0;
    if (a3 > 0) {
        p->v0 = a1;
        p->v1 = a2;
        p->v2 = a4;
        p->v3 = a5;
        p->v13 = 0;
        p->v4 = 0;
        p->b20 = 0;
        p->v14 = 1;
    }
}
