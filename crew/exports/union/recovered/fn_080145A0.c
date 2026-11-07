/* fn_080145A0: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
struct T { unsigned char pad[10]; unsigned short v; };
struct O { unsigned char pad[20]; unsigned short a; unsigned short b; };
unsigned char *fn_080145A0(struct O *p, unsigned char *q) {
    unsigned char *base = *(unsigned char **)(data_030064C4 + 0xDF0);
    struct T *t = *(struct T **)(data_030064C4 + 0xE0C);
    unsigned char *first = base + t[p->a].v * 40;
    if (first == q) {
        unsigned char *second;
        if (p->b == 0xFFFF)
            second = 0;
        else
            second = base + t[p->b].v * 40;
        if (second == q)
            return 0;
        return second;
    }
    return first;
}
