/* fn_080098C0: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct B B;
struct B {
    unsigned int _00[3];
    unsigned int a;
    unsigned int b;
    unsigned int c;
    unsigned int _01[13];
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
    unsigned int _03[3];
    unsigned int dst;
};
typedef struct C C;
struct C {
    unsigned int _00[20];
    unsigned int src80;
    unsigned int _01[3];
    unsigned int dst96;
};

extern unsigned int fn_08006B00(void);
extern unsigned int fn_0300275C(unsigned int, unsigned int, unsigned int, unsigned int);
extern C *fn_08010DEC(unsigned int, unsigned int, unsigned int, unsigned int);
extern void fn_080185B0(void *, void *);
extern void fn_08009850(void *, unsigned int);

void fn_080098C0(A *p)
{
    B *q = p->next;
    if (q == 0)
        return;
    p->ctrl &= ~32u;
    p->res = fn_0300275C(p->x, p->y, q->a, q->b);
    q = p->next;
    if (q->flag & 0x40000) {
        unsigned int t1 = fn_08006B00();
        unsigned int t2 = fn_08006B00();
        p->res += (t1 - t2) << 21;
        q = p->next;
    }
    {
        C *r = fn_08010DEC(q->a, q->b, q->c, 4);
        fn_080185B0(&p->dst, r);
        fn_080185B0(&r->src80, p);
        fn_080185B0(&r->dst96, p->next);
        fn_08009850(r, 0);
    }
}
