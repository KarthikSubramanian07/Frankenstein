/* fn_080184FC: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct { unsigned char _00[0x10F0]; unsigned int unk10F0; unsigned int unk10F4; } Struct184FC;
extern Struct184FC *data_030064C4;
void fn_080184FC(void) {
    Struct184FC *p = data_030064C4;
    unsigned int v = (unsigned int)&p->unk10F0;
    p->unk10F4 = v;
    p->unk10F0 = v;
}
