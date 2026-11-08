/* fn_08011EDC: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08006B00(void);
struct B *fn_08010DEC(int, int, int, int);
void fn_0801120C(struct B *, int);

struct B { char _00[68]; int unk68; char _72[14]; short unk86; };

void fn_08011EDC(int a, int b, int c, int d)
{
    int e = fn_08006B00();
    int f = fn_08006B00();
    int g = ((e - f) << 10) + c;
    struct B *p = fn_08010DEC(a, b, g, 38);
    p->unk68 = 0x20000;
    {
        short v = fn_08006B00() & 3;
        v = p->unk86 - v;
        if (v <= 0)
            v = 1;
        p->unk86 = v;
    }
    if ((unsigned)(d - 9) <= 3U)
        fn_0801120C(p, 91);
    else if (d <= 8)
        fn_0801120C(p, 92);
}
