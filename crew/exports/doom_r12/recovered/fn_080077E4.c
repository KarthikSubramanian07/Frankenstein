/* fn_080077E4: recovered by the Frankenstein crew, run doom_r12.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void *fn_0801D67C(int, int, int);
void fn_08020990(void *, int, int);
void fn_0801851C(void *);
void fn_0800704C(void);

struct P { char _0[20]; void *unk20; char _24[8]; short unk32; };
struct Q { char _0[8]; void *unk8; unsigned char unk12; char _13[3]; void *unk16; char _20[4]; int unk24; int unk28; char _32[4]; int unk36; int unk40; int unk44; };

void fn_080077E4(struct P *p)
{
    struct Q *q = fn_0801D67C(48, 3, 0);
    fn_08020990(q, 0, 48);
    fn_0801851C(q);
    p->unk20 = q;
    p->unk32 = 0;
    q->unk8 = fn_0800704C;
    q->unk12 = 0;
    q->unk24 = 0x20000;
    q->unk16 = p;
    q->unk28 = 0;
    q->unk36 = 0x41A;
    q->unk40 = 0;
    q->unk44 = 0;
}
