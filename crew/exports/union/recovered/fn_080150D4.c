/* fn_080150D4: recovered by the Frankenstein crew, run doom_par2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Item { int f0; int f4; int f8; int f12; int f16; int f20; int f24; short f28; short f30; };
struct Big { char _0[0xDFC]; int count; struct Item *items; };
extern struct Big *data_030064C4;
int fn_080150D4(struct Item *a, int b) {
    struct Big *base = data_030064C4;
    int i;
    i = 1 + b;
    int n = base->count;
    unsigned int tmp2 = n <= i;
    if (tmp2) return -1;
    short needle = a->f28;
    unsigned int tmp = n != i;
    if (tmp) do {
        if (base->items[i].f28 == needle)
            return (int)i;
        unsigned int tmp1 = 1 + (int)i;
        i = tmp1;
    } while (n != i);
    return (-1);
}
