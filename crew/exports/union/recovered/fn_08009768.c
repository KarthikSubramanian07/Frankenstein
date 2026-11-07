/* fn_08009768: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct Q Q;
struct Q {
    int _00[3];
    int x;
    int y;
    int z;
    int _01[2];
    unsigned int w;
};
typedef struct P P;
struct P {
    int _00[3];
    int a;
    int b;
    int c;
    int _01[14];
    int d;
    int _02[3];
    Q *q;
};
void fn_0801A2C8(P *, int);
int fn_0801428C(int, Q *);
void fn_080100E4(P *);
void fn_0801010C(P *);
int fn_03002660(int, int);
extern int data_081397CC[];

void fn_08009768(P *p)
{
    int sx;
    int sy;
    unsigned int idx;
    int *tbl;
    Q *q;
    fn_0801A2C8(p, 92);
    q = p->q;
    if (q == 0)
        return;
    if (fn_0801428C(p->d, q) == 0)
        return;
    idx = q->w >> 19;
    fn_080100E4(p);
    tbl = data_081397CC;
    sx = q->x;
    p->a = fn_03002660(0x180000, tbl[idx + 2048]) + sx;
    sy = q->y;
    p->b = fn_03002660(0x180000, data_081397CC[idx]) + sy;
    p->c = q->z;
    fn_0801010C(p);
}
