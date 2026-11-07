/* Edited for the demo from the crew's recovered fn_080054C8 (MATCH): one change, marked below. Does NOT match the original on purpose. */
/* fn_080054C8: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

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
        p->f108 = 200; /* demo edit (Lane A): was p->p758->v, the game's god-mode health (100) */
        p->f198 = (int)q + q->a;
    } else {
        p->f198 = (int)q + q->b;
    }
}
