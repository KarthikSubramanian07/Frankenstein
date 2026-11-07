/* fn_080100E4: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

struct Obj {
    int unk0[6];
    struct Obj *next1;
    struct Obj **prev1;
    int unk32;
    struct Obj *next2;
    struct Obj **prev2;
    int unk44[8];
    int flags;
};

void fn_080100E4(struct Obj *p)
{
    int f = p->flags;
    if ((f & 8) == 0) {
        *p->prev1 = p->next1;
        if (p->next1 != 0)
            p->next1->prev1 = p->prev1;
    }
    if ((f & 16) == 0 && p->prev2 != 0) {
        *p->prev2 = p->next2;
        if (p->next2 != 0)
            p->next2->prev2 = p->prev2;
    }
}
