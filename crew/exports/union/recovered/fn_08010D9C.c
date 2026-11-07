/* fn_08010D9C: recovered by the Frankenstein crew, run doom_relay2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct E { short a0; short a2; short a4; short a6; unsigned short a8; };
struct P { char f0[72]; struct E *p; char f1[10]; short x; short y; };
struct M { char f0[0x74c]; struct E *arr; char f1[0x99c]; int v; };
extern struct M *data_030064C4;
struct E *fn_08010D9C(struct P *p)
{
    struct M *m = data_030064C4;
    int y = (p->x + m->v) % p->y;
    struct E *e = p->p;
    short k = e->a4;
    struct E *base = m->arr;
    while (y >= k) {
        y -= k;
        e = &base[e->a8];
        k = e->a4;
    }
    return e;
}
