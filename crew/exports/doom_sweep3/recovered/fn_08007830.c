/* fn_08007830: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801851C(int);
int fn_08014BD4(int);
int fn_0801D67C(int, int, int);
int fn_08020990(int, int, int);
void fn_0800704C(void);

struct A { char _0[20]; int unk20; char _24[8]; short unk32; };
struct B { char _0[8]; int unk8; unsigned char unk12; char _13[3]; int unk16; int unk20; int unk24; int unk28; int unk32; int unk36; int unk40; int unk44; };

void fn_08007830(struct A *p)
{
    struct B *q = (struct B *)fn_0801D67C(48, 3, 0);
    fn_08020990((int)q, 0, 48);
    fn_0801851C((int)q);
    p->unk20 = (int)q;
    p->unk32 = 0;
    q->unk8 = (int)fn_0800704C;
    q->unk28 = 2;
    q->unk12 = 4;
    q->unk16 = (int)p;
    q->unk24 = 0x20000;
    int v = fn_08014BD4((int)p) - 0x40000;
    q->unk20 = v;
    q->unk32 = 150;
    q->unk40 = 0;
    q->unk44 = 0;
    q->unk36 = 0x2904;
}
