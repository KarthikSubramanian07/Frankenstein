/* fn_08004680: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct { int unk0; int unk4; int unk8; int unk12; int unk16; unsigned char unk20; unsigned char _pad[31]; int unk34; int unk38; } S;
void fn_08004680(S *a, int b, int c, int d, int e) {
    a->unk8 = d;
    a->unk12 = e;
    a->unk34 = 0;
    a->unk16 = 0;
    a->unk20 = 0;
    a->unk0 = b;
    a->unk4 = c;
    a->unk38 = 1;
}
