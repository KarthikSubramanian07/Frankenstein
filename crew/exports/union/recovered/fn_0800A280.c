/* fn_0800A280: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08006B00(void);
struct B;
struct A { char _0[12]; int unk12; int unk16; };
struct B { char _00[68]; int unk68; char _72[14]; short unk86; };
struct B *fn_08010DEC(int a, int b, int c, int d);
void fn_0801120C(struct B *p, int v);
void fn_0801A2C8(int a, int b);

void fn_0800A280(struct A *p)
{
    int v = p->unk12 + 0xFF3C0000;
    do {
        int y = p->unk16 + 0xFEC00000;
        int t = fn_08006B00();
        struct B *q = fn_08010DEC(v, y, (t << 17) + 128, 33);
        int u = fn_08006B00();
        q->unk68 = u << 9;
        fn_0801120C(q, 799);
        int w = fn_08006B00();
        short tmp = q->unk86 - (w & 7);
        if (tmp <= 0)
            tmp = 1;
        q->unk86 = tmp;
        v += 0x80000;
    } while (p->unk12 + 0x013FFFFF >= v);
    fn_0801A2C8(0, 98);
}
