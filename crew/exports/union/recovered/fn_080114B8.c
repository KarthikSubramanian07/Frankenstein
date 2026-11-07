/* fn_080114B8: salvaged by the Frankenstein crew from run doom_sweep1, attempt 1.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Sub { unsigned char _0[8]; unsigned short unk8; };
struct Main { unsigned char _0[0x48]; struct Sub *sub; unsigned char _1[10]; short unk56; };
void fn_0801120C(void *a, unsigned short b);
void fn_080114B8(struct Main *p) {
    if (p->unk56 == -1) return;
    if (--p->unk56 == 0)
        fn_0801120C(p, p->sub->unk8);
}
