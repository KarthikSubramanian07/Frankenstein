/* fn_08009ED8: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S {
    unsigned int unk0[8];
    unsigned int unk8;
    unsigned int unk9[10];
    unsigned int unk19;
};
void fn_08009DA4(struct S *p, unsigned int v);
void fn_08009ED8(struct S *p)
{
    p->unk19 &= ~2u;
    fn_08009DA4(p, p->unk8 + 0x40000000u);
    fn_08009DA4(p, p->unk8 + 0x80000000u);
    fn_08009DA4(p, p->unk8 + 0xC0000000u);
}
