/* fn_0800A30C: recovered by the Frankenstein crew, run doom_r11.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08006B00(void);
struct B *fn_08010DEC(int a, int b, int c, int d);
void fn_0801120C(struct B *p, int v);

struct A { char _0[12]; int unk12; int unk16; };
struct B { char _00[68]; int unk68; char _72[14]; short unk86; };

void fn_0800A30C(struct A *p)
{
    int t1 = fn_08006B00();
    int v12 = p->unk12;
    int t2 = fn_08006B00();
    int v = v12 + ((t1 - t2) << 11);
    int v16 = p->unk16;
    int t3 = fn_08006B00();
    struct B *q = fn_08010DEC(v, v16, (t3 << 17) + 128, 33);
    int t4 = fn_08006B00();
    q->unk68 = t4 << 9;
    fn_0801120C(q, 799);
    int t5 = fn_08006B00();
    short tmp = q->unk86 - (t5 & 7);
    if (tmp <= 0)
        tmp = 1;
    q->unk86 = tmp;
}
