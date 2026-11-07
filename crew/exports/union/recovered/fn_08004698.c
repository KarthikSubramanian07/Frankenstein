/* fn_08004698: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { char pad0[16]; int f16; char buf[32]; int len; int state; };
int fn_08004698(struct S *p, int c)
{
    int n;
    int len;
    if (p->f16 == 31)
        return 0;
    if (c == 10)
        n = 0;
    else
        n = p->f16 + 1;
    len = p->len;
    p->f16 = n;
    p->len = len + 1;
    p->buf[len] = (char)c;
    p->buf[len + 1] = 0;
    p->state = 4;
    return 1;
}
