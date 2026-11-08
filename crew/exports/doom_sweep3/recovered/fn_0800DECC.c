/* fn_0800DECC: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08006B00(void);
void fn_0800DE40(void);
int fn_08015120(void *a, int b);
void fn_0801851C(void *a);
void *fn_0801D67C(int a, int b, int c);
void fn_08020990(void *a, int b, int c);

struct A { char _0[32]; unsigned short unk32; unsigned char _34[4]; unsigned char unk38; };
struct B { char _00[8]; void *unk8; void *unk12; int unk16; int unk20; int unk24; int unk28; int unk32; };

void fn_0800DECC(struct A *p)
{
    struct B *q;
    int v;
    int t;
    p->unk32 &= ~31;
    q = fn_0801D67C(36, 3, 0);
    fn_08020990(q, 0, 36);
    fn_0801851C(q);
    q->unk8 = (void *)fn_0800DE40;
    q->unk12 = p;
    v = p->unk38;
    q->unk20 = v;
    t = fn_08015120(p, v);
    q->unk28 = 64;
    q->unk32 = 7;
    q->unk24 = t;
    t = fn_08006B00();
    q->unk16 = (q->unk28 & t) + 1;
}
