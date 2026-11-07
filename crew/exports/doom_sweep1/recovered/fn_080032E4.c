/* fn_080032E4: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char pad0[0x94]; unsigned char f94; unsigned char pad1[0x3F]; unsigned char fD4; unsigned char pad2[0x184]; unsigned char f259; unsigned char pad3[6]; unsigned char f260; };
extern struct S *data_030064C4;
void fn_080032E4(void) {
    struct S *p = data_030064C4;
    if (p->f94 == 2)
        p->f259 = p->f260;
    else
        p->f259 = 1;
    p->fD4 = 6;
}
