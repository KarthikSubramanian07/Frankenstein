/* fn_0801D1D4: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Base {
    unsigned char pad0[0x94];
    unsigned char f94;
    unsigned char pad1[0x5a38 - 0x94 - 1];
    int f5a38;
    int f5a3c;
    void *f5a40;
    void *f5a44;
    int f5a48;
    int f5a4c;
};
extern struct Base *data_030064C4;

struct Arg {
    int f0;
    int f4;
    int f8;
    int f12;
    int f16;
    int f20;
    unsigned char pad[12];
    unsigned char f36;
};

void fn_0801D1D4(struct Arg *a)
{
    struct Base *b = data_030064C4;
    b->f5a40 = a;
    b->f5a38 = 0;
    b->f5a4c = 0;
    b->f5a48 = 0;
    b->f5a44 = &a->f36;
    if (a->f16 == 0)
        a->f16 = 1;
    if (a->f20 == 0)
        a->f20 = 1;
    if (b->f94 != 3 && a->f0 > 2)
        a->f0 -= 3;
}
