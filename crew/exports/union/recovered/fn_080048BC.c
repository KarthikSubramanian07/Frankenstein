/* fn_080048BC: recovered by the Frankenstein crew, run doom_par0.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Item080048BC { unsigned char x[60]; };
struct Flag080048BC { unsigned char f0; };
struct Cont080048BC { struct Item080048BC items[1]; int count; int cur; struct Flag080048BC *flag; };
void fn_080046C8(void *p);
void fn_080048BC(struct Cont080048BC *p) {
    if (p->flag->f0 == 0) return;
    if (p->count <= 0) return;
    for (int i = 0; i < p->count; i++) {
        int j = p->cur - i;
        if (j < 0) j += p->count;
        fn_080046C8(&p->items[j]);
    }
}
