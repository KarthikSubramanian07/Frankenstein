/* fn_08009850: recovered by the Frankenstein crew, run doom_r14.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct Q Q;
struct Q {
    unsigned int _00[3];
    int v12;
    int v16;
    int v20;
    unsigned int _01[2];
    unsigned int v32;
};
typedef struct P P;
struct P {
    int _00[3];
    int w12;
    int w16;
    int w20;
    int _01[14];
    int v80;
    int _02[3];
    Q *v96;
};
extern int data_081397CC[];
int fn_0801428C(int, Q *);
void fn_080100E4(P *);
void fn_0801010C(P *);
int fn_03002660(int, int);
void fn_08009850(P *p)
{
    Q *q = p->v96;
    if (q == 0)
        return;
    if (fn_0801428C(p->v80, q) == 0)
        return;
    unsigned int k = q->v32 >> 19;
    fn_080100E4(p);
    {
        int *tbl = data_081397CC;
        int s = q->v12;
        p->w12 = fn_03002660(192 << 13, tbl[(128 << 4) + k]) + s;
        s = q->v16;
        p->w16 = fn_03002660(192 << 13, data_081397CC[k]) + s;
    }
    p->w20 = q->v20;
    fn_0801010C(p);
}
