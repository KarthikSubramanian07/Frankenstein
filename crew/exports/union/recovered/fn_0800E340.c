/* fn_0800E340: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
int fn_0800FE1C(int a, int b, void *c);
struct Box { int v0; int v1; int v2; int v3; };
struct Obj { char _0[12]; unsigned short s12; unsigned short s14; unsigned short s16; unsigned short s18; char _20[4]; unsigned short s24; };
int fn_0800E340(struct Obj *p)
{
    if ((p->s24 & 7) != 4) {
        struct Box *b = *(struct Box **)(data_030064C4 + 0x8a8);
        if (b->v2 <= ((int)p->s18 << 16)) {
            if (b->v3 >= ((int)p->s16 << 16)) {
                if (b->v0 >= ((int)p->s14 << 16)) {
                    if (b->v1 <= ((int)p->s12 << 16)) {
                        int a0 = *(int *)(data_030064C4 + 0x898);
                        int a1 = *(int *)(data_030064C4 + 0x89c);
                        int v1 = fn_0800FE1C(a0, a1, p);
                        int c0 = *(int *)(data_030064C4 + 0x8a0);
                        int c1 = *(int *)(data_030064C4 + 0x8a4);
                        int v2 = fn_0800FE1C(c0, c1, p);
                        return v1 == v2;
                    }
                }
            }
        }
    }
    return 1;
}
