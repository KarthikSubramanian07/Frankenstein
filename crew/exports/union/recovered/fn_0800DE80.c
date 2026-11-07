/* fn_0800DE80: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct A { unsigned char _00[32]; unsigned short unk32; unsigned char _34[4]; unsigned char unk38; };
struct B { int _00; int _04; void (*unk08)(void); struct A *unk12; int unk16; int unk20; void *unk24; };
struct B *fn_0801D67C(int, int, int);
void fn_08020990(struct B *, int, int);
void fn_0801851C(struct B *);
void *fn_08015120(struct A *, unsigned int);
void fn_0800DE04(void);

void fn_0800DE80(struct A *p)
{
    unsigned int v;
    struct B *q;
    p->unk32 &= ~31u;
    q = fn_0801D67C(28, 3, 0);
    fn_08020990(q, 0, 28);
    fn_0801851C(q);
    q->unk08 = fn_0800DE04;
    q->unk12 = p;
    v = p->unk38;
    q->unk20 = v;
    q->unk24 = (char *)fn_08015120(p, v) + 16;
    q->unk16 = 4;
}
