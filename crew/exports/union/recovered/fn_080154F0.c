/* fn_080154F0: recovered by the Frankenstein crew, run r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { char pad[32]; short v; };
int fn_080154F0(struct S *p) {
    if (p->v == 9)
        return 1;
    return (p->v >> 7) & 1;
}
