/* fn_08009E8C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct B { int f0,f4,f8,f12,f16,f20,f24,f28,f32,f36,f40,f44,f48,f52,f56,f60,f64,f68,f72,f76; };
struct A { int f0,f4,f8,f12,f16,f20,f24,f28,f32,f36,f40,f44,f48,f52,f56,f60,f64,f68,f72,f76; struct B *f80; };
extern unsigned int fn_0300275C(unsigned int, unsigned int, unsigned int, unsigned int);
int fn_08006B00(void);
void fn_08009DA4(struct A *, int);
void fn_08009E8C(struct A *a)
{
    struct B *b = a->f80;
    if (b == 0)
        return;
    a->f76 &= ~32u;
    unsigned int v = fn_0300275C(a->f12, a->f16, b->f12, b->f16);
    a->f32 = v;
    if (a->f80->f76 & 0x40000) {
        int t1 = fn_08006B00();
        int t2 = fn_08006B00();
        int nv = a->f32 + ((t1 - t2) << 21);
        a->f32 = nv;
        v = nv;
    }
    fn_08009DA4(a, v);
}
