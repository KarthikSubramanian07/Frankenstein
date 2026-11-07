/* fn_0800E58C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
extern int fn_0800FE7C(int *a, void *b);
struct A { unsigned char p0[12]; int f12; int f16; unsigned char p20[71]; unsigned char b91; };
struct P { unsigned char p0[12]; unsigned short s12; unsigned short s14; unsigned short s16; unsigned short s18; };
int fn_0800E58C(struct P *p)
{
    struct A *a = *(struct A **)(data_030064C4 + 0x88c);
    int t = ((int)a->b91 << 16);
    int x = a->f12;
    int y;
    int stk[4];
    stk[3] = t + x;
    if (stk[3] > ((int)p->s16 << 16)) {
        stk[2] = x - t;
        if (stk[2] < ((int)p->s18 << 16)) {
            y = a->f16;
            stk[0] = t + y;
            if (stk[0] > ((int)p->s14 << 16)) {
                stk[1] = y - t;
                if (stk[1] < ((int)p->s12 << 16)) {
                    return fn_0800FE7C(stk, p) != -1;
                }
            }
        }
    }
    return 1;
}
