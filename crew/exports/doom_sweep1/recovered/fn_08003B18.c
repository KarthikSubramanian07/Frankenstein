/* fn_08003B18: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char pad0[0xD4]; unsigned char fD4; unsigned char pad1[0x178]; unsigned char f24D; unsigned char pad2[2]; int f250; int f254; };
extern struct S *data_030064C4;
void fn_08003B18(unsigned char a, int b, int c) {
    struct S *p = data_030064C4;
    p->f24D = a;
    p->f250 = b;
    p->f254 = c;
    p->fD4 = 2;
}
