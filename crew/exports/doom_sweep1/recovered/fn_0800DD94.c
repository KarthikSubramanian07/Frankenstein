/* fn_0800DD94: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S {
    int f0;
    int f4;
    int f8;
    unsigned char *p;
    int cnt;
    int v1;
    int v2;
    int r1;
    int r2;
};

void fn_0800DD94(struct S *a)
{
    a->cnt--;
    if (a->cnt == 0) {
        if (a->p[38] != a->v1) {
            a->p[38] = a->v1;
            a->cnt = a->r1;
        } else {
            a->p[38] = a->v2;
            a->cnt = a->r2;
        }
    }
}
