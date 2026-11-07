/* fn_080077E4: recovered by the Frankenstein crew, run doom_align_on.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct MyObj MyObj;
typedef struct Parent Parent;
struct MyObj {
    int unk0;
    int unk4;
    void (*func)(void);
    unsigned char b12;
    unsigned char _p13[3];
    Parent *parent;
    int unk20;
    int unk24;
    int unk28;
    int unk32;
    int unk36;
    int unk40;
    int unk44;
};
struct Parent {
    int f0;
    int f4;
    int f8;
    int f12;
    int f16;
    MyObj *obj;
    int f24;
    int f28;
    short s32;
};
extern void *fn_0801D67C(int a, int b, int c);
extern void *fn_08020990(void *d, int v, int n);
extern void fn_0801851C(void *p);
extern void fn_0800704C(void);

void fn_080077E4(Parent *p)
{
    MyObj *o = fn_0801D67C(48, 3, 0);
    fn_08020990(o, 0, 48);
    fn_0801851C(o);
    p->obj = o;
    p->s32 = 0;
    o->func = fn_0800704C;
    o->b12 = 0;
    o->unk24 = 0x20000;
    o->parent = p;
    o->unk28 = 0;
    o->unk36 = 0x41A;
    o->unk40 = 0;
    o->unk44 = 0;
}
