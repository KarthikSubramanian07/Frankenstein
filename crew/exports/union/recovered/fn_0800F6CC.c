/* fn_0800F6CC: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S {
    int f0;
    int f4;
    int f8;
    int f12;
    int f16;
    int f20;
    int f24;
    int f28;
    int f32;
    int f36;
    int f40;
    int f44;
    int f48;
    int f52;
    int f56;
};
struct B {
    char pad[0x8B0];
    int f8B0;
    int f8B4;
};
extern struct B *data_030064C4;
void fn_0800F3D4(struct S *a, int b, int c);

unsigned char fn_0800F6CC(struct S *p)
{
    int a = p->f20;
    int b = p->f48;
    fn_0800F3D4(p, p->f12, p->f16);
    int c = data_030064C4->f8B0;
    p->f48 = c;
    int d = data_030064C4->f8B4;
    int e = p->f56;
    p->f52 = d;
    if (b == a) {
        p->f20 = c;
    } else {
        if (e + p->f20 > d)
            p->f20 = d - e;
    }
    return d - c >= e;
}
