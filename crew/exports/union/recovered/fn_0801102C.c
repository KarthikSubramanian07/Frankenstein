/* fn_0801102C: recovered by the Frankenstein crew, run doom_align_on.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct { unsigned int f00; unsigned int f04; unsigned int f08; unsigned int f0C; unsigned int f10; unsigned int f14; unsigned int f18; unsigned int f1C; unsigned int f20; unsigned int f24; unsigned int f28; unsigned int f2C; unsigned int f30; unsigned int f34; unsigned int f38; unsigned int f3C; unsigned int f40; unsigned int f44; unsigned int f48; int f4C; unsigned int f50; unsigned int f54; short f58; unsigned char f5A; unsigned char f5B; } Obj;
extern unsigned char *data_030064C4;
int fn_08006B00(void);
void fn_08010F6C(Obj *);
void fn_0801102C(Obj *p)
{
    int v = p->f4C;
    if ((v & 0x100000) != 0) {
        if (p->f5A != 0) {
            if (data_030064C4[0x25A] != 0) {
                if ((v & 0x400000) == 0)
                    return;
            } else {
                int t = p->f3C | p->f40 | p->f44;
                if (t != 0)
                    return;
                if (p->f14 != p->f30)
                    return;
                p->f08 = t;
                return;
            }
        } else {
            if ((v & 0x400000) == 0)
                return;
            if (data_030064C4[0x25A] == 0)
                return;
        }
    } else {
        if ((v & 0x400000) == 0)
            return;
        if (data_030064C4[0x25A] == 0)
            return;
    }
    p->f58++;
    if (p->f58 > 419) {
        if (((*(unsigned int *)(data_030064C4 + 0x10EC) << 27) != 0))
            return;
        if (fn_08006B00() <= 4)
            fn_08010F6C(p);
    }
}
