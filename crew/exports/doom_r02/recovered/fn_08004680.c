/* fn_08004680: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S {
    int v0;
    int v1;
    int v2;
    int v3;
    int v4;
    unsigned char v5;
    unsigned char _pad[31];
    int v6;
    int v7;
};
void fn_08004680(struct S *p, int a1, int a2, int a3, int a4)
{
    p->v2 = a3;
    p->v3 = a4;
    p->v6 = 0;
    p->v4 = 0;
    p->v5 = 0;
    p->v0 = a1;
    p->v1 = a2;
    p->v7 = 1;
}
