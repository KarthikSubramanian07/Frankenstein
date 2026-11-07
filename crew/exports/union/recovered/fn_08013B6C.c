/* fn_08013B6C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08012820(unsigned char *a, unsigned int b);
void fn_0801A2C8(unsigned int a, unsigned int b);
struct Entry { unsigned int _00; unsigned short _04; unsigned char _06[18]; };
struct Obj {
    unsigned int v0;
    unsigned char _04[79];
    unsigned char v83;
    unsigned char v84;
    unsigned char _85[127];
    unsigned int v212;
    unsigned char _216[8];
    unsigned int v224;
    unsigned int v228;
};

void fn_08013B6C(struct Obj *p)
{
    unsigned int h;
    p->v212 = 0;
    p->v228 = 0;
    p->v84 = p->v83;
    if (p->v84 == 7)
        fn_0801A2C8(p->v0, 10);
    h = (*(struct Entry **)(data_030064C4 + 0x754))[p->v84]._04;
    p->v84 = 10;
    p->v224 = 0x820000;
    fn_08012820((unsigned char *)p, h);
}
