/* fn_08009A28: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct B B;
struct B {
    unsigned int _00[3];
    unsigned int a;
    unsigned int b;
    unsigned int _01[14];
    unsigned int flag;
};
typedef struct A A;
struct A {
    unsigned int _00[3];
    unsigned int x;
    unsigned int y;
    unsigned int _01[3];
    unsigned int res;
    unsigned int _02[10];
    unsigned int ctrl;
    B *next;
};
extern unsigned int fn_0300275C(unsigned int, unsigned int, unsigned int, unsigned int);
extern unsigned int fn_08006B00(void);
extern void fn_0801A2C8(A *, unsigned int);

void fn_08009A28(A *p)
{
    B *q = p->next;
    if (q != 0) {
        p->ctrl &= ~32u;
        p->res = fn_0300275C(p->x, p->y, q->a, q->b);
        q = p->next;
        if ((q->flag & 0x40000) != 0) {
            unsigned int t1 = fn_08006B00();
            unsigned int t2 = fn_08006B00();
            p->res += (t1 - t2) << 21;
        }
    }
    fn_0801A2C8(p, 99);
}
