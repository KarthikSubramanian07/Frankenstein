/* fn_08004798: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct {
    int unk0;
    int unk4;
    int unk8;
    int unkC;
    int unk10;
    unsigned char unk14;
    unsigned char _pad[31];
    int unk34;
    int unk38;
    int unk3C;
    int unk40;
    int unk44;
    unsigned char unk48;
} S;

void fn_08004798(S *p, int a1, int a2, int a3, int a4, int a5, int a6)
{
    p->unk3C = a3;
    p->unk44 = a6;
    p->unk48 = 1;
    p->unk40 = 0;
    if (a3 > 0) {
        p->unk0 = a1;
        p->unk4 = a2;
        p->unk8 = a4;
        p->unkC = a5;
        p->unk34 = 0;
        p->unk10 = 0;
        p->unk14 = 0;
        p->unk38 = 1;
    }
}
