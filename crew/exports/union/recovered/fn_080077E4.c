/* fn_080077E4: recovered by the Frankenstein crew, run doom_r14.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0800704C(void);
void *fn_0801D67C(int a, int b, int c);
void fn_08020990(void *p, int v, int n);
void fn_0801851C(void *p);

struct Sub {
    int unk0;
    int unk4;
    void (*unk8)(void);
    unsigned char unk12;
    char _13[3];
    void *unk16;
    int unk20;
    int unk24;
    int unk28;
    int unk32;
    int unk36;
    int unk40;
    int unk44;
};

struct Main {
    char _0[20];
    struct Sub *unk20;
    char _24[8];
    short unk32;
};

void fn_080077E4(struct Main *p)
{
    struct Sub *q = fn_0801D67C(48, 3, 0);
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
