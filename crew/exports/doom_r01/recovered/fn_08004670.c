/* fn_08004670: recovered by the Frankenstein crew, run doom_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S_08004670 { int unk0[4]; int unk16; unsigned char unk20; unsigned char pad21[31]; int unk34; int unk38; };
void fn_08004670(struct S_08004670 *a) {
    a->unk34 = 0;
    a->unk16 = 0;
    a->unk20 = 0;
    a->unk38 = 1;
}
