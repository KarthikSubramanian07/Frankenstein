/* fn_080092AC: recovered by the Frankenstein crew, run doom_sweep3.
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
    unsigned int unk20;
    unsigned int _04[2];
    unsigned int res;
    unsigned int _05[6];
    unsigned int unk60;
    unsigned int unk64;
    unsigned int _06[2];
    unsigned int ctrl;
    B *next;
    unsigned int _07[3];
    unsigned int unk96;
};
extern unsigned int fn_0300275C(unsigned int, unsigned int, unsigned int, unsigned int);
extern unsigned int fn_08006B00(void);
extern A *fn_0801201C(A *, B *, unsigned int);
extern void fn_080185B0(void *, B *);

void fn_080092AC(A *p)
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
    p->unk20 += 0x100000;
    {
        A *r = fn_0801201C(p, q, 6);
        p->unk20 += 0xFFF00000u;
        r->x += r->unk60;
        r->y += r->unk64;
        fn_080185B0(&r->unk96, p->next);
    }
}
