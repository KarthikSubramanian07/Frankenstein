/* fn_0800DF94: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void *fn_0801D67C(int a, int b, int c);
void fn_08020990(void *p, int a, int b);
void fn_0801851C(void *p);
int fn_08015120(void *p, int v);
void fn_0800DDC4(void);

struct A {
    char _0[32];
    unsigned short unk32;
    char _34[4];
    unsigned char unk38;
};

struct B {
    char _0[8];
    void (*unk8)(void);
    struct A *unk12;
    int unk16;
    int unk20;
    int unk24;
};

void fn_0800DF94(struct A *p)
{
    struct B *q = fn_0801D67C(28, 3, 0);
    fn_08020990(q, 0, 28);
    fn_0801851C(q);
    q->unk12 = p;
    q->unk16 = fn_08015120(p, p->unk38);
    q->unk20 = p->unk38;
    q->unk8 = fn_0800DDC4;
    q->unk24 = -1;
    p->unk32 &= ~31;
}
