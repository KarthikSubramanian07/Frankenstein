/* fn_080054C8: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct A { char pad[0x24]; int v; };
struct B { char pad[0x358]; int a; int b; };
struct Main { char pad0[0x108]; int f108; char pad1[0x78]; int f184; char pad2[0x10]; int f198; char pad3[0x5BC]; struct A *p758; struct B *p75C; };
extern struct Main *data_030064C4;
void fn_080054C8(void) {
    struct Main *p = data_030064C4;
    int v = p->f184 ^ 2;
    p->f184 = v;
    struct B *q = p->p75C;
    if (v & 2) {
        p->f108 = p->p758->v;
        p->f198 = (int)q + q->a;
    } else {
        p->f198 = (int)q + q->b;
    }
}
