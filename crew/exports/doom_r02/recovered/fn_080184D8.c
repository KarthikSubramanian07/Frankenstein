/* fn_080184D8: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct S S;
struct S {
    S *next;
    S *prev;
    unsigned char unk8[68];
    int unk76;
    unsigned char unk80[10];
    unsigned char unk90;
};
void fn_0801D5E8(S *p);
void fn_080184D8(S *p)
{
    S *a = p->next;
    S *b = p->prev;
    b->next = a;
    a->prev = b;
    if (p->unk76 & 0x10000000)
        p->unk90 = 0x89;
    else
        fn_0801D5E8(p);
}
