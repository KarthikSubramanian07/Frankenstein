/* fn_080077E4: recovered by the Frankenstein crew, run doom_r13.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void *fn_0801D67C(int, int, int);
extern void fn_08020990(void *, int, int);
extern void fn_0801851C(void *);
extern void fn_0800704C(void);

struct Child {
    int unk0;
    int unk4;
    void (*func)(void);
    unsigned char b12;
    unsigned char _pad13[3];
    void *parent;
    int unk20;
    int unk24;
    int unk28;
    int unk32;
    int unk36;
    int unk40;
    int unk44;
};

struct Parent {
    int unk[5];
    struct Child *p;
    int unk2[2];
    short s;
};

void fn_080077E4(struct Parent *p)
{
    struct Child *c = fn_0801D67C(48, 3, 0);
    fn_08020990(c, 0, 48);
    fn_0801851C(c);
    p->p = c;
    p->s = 0;
    c->func = fn_0800704C;
    c->b12 = 0;
    c->unk24 = 131072;
    c->parent = p;
    c->unk28 = 0;
    c->unk36 = 1050;
    c->unk40 = 0;
    c->unk44 = 0;
}
