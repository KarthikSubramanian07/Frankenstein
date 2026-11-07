/* fn_08004798: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S {
    int a0;
    int a1;
    int a2;
    int a3;
    int a4;
    unsigned char a5;
    unsigned char pad[31];
    int a6;
    int a7;
    int a8;
    int a9;
    int a10;
    unsigned char a11;
};
void fn_08004798(struct S *p, int a, int b, int c, int d, int e, int f)
{
    p->a8 = c;
    p->a10 = f;
    p->a11 = 1;
    p->a9 = 0;
    if (c > 0) {
        p->a0 = a;
        p->a1 = b;
        p->a2 = d;
        p->a3 = e;
        p->a6 = 0;
        p->a4 = 0;
        p->a5 = 0;
        p->a7 = 1;
    }
}
