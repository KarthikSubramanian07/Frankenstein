/* fn_08004680: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S_08004680 { int unk0; int unk4; int unk8; int unk12; int unk16; unsigned char unk20; unsigned char pad21[31]; int unk52; int unk56; };
void fn_08004680(struct S_08004680 *a, int b, int c, int d, int e) {
    a->unk8 = d;
    a->unk12 = e;
    a->unk52 = 0;
    a->unk16 = 0;
    a->unk20 = 0;
    a->unk0 = b;
    a->unk4 = c;
    a->unk56 = 1;
}
