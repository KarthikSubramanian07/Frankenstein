/* fn_08004680: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct {
    int unk0;
    int unk4;
    int unk8;
    int unk12;
    int unk16;
    unsigned char unk20;
    unsigned char _pad21[31];
    int unk52;
    int unk56;
} S;
void fn_08004680(S *p, int a, int b, int c, int d) {
    p->unk8 = c;
    p->unk12 = d;
    p->unk52 = 0;
    p->unk16 = 0;
    p->unk20 = 0;
    p->unk0 = a;
    p->unk4 = b;
    p->unk56 = 1;
}
