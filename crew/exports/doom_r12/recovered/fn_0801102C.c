/* fn_0801102C: recovered by the Frankenstein crew, run doom_r12.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
int fn_08006B00(void);
void fn_08010F6C(void *);
struct S {
    char pad0[8];
    int v08;
    char pad0C[8];
    int v14;
    char pad18[24];
    int v30;
    char pad34[8];
    int v3C;
    int v40;
    int v44;
    char pad48[4];
    int v4C;
    char pad50[8];
    short v58;
    unsigned char v5A;
};
void fn_0801102C(struct S *p)
{
    int flags = p->v4C;
    if (flags & 0x100000) {
        if (p->v5A == 0)
            goto check22;
        if (data_030064C4[0x25A] == 0) {
            if ((p->v3C | p->v40 | p->v44) != 0)
                return;
            if (p->v14 != p->v30)
                return;
            p->v08 = 0;
            return;
        } else {
            if (flags & 0x400000)
                goto inc;
            return;
        }
    } else {
    check22:
        if (!(flags & 0x400000))
            return;
        if (data_030064C4[0x25A] == 0)
            return;
    inc:
        if (++p->v58 <= 419)
            return;
        if ((*(int *)(data_030064C4 + 0x10EC) << 27) != 0)
            return;
        if (fn_08006B00() > 4)
            return;
        fn_08010F6C(p);
    }
}
