/* fn_08009468: recovered by the Frankenstein crew, run doom_r13.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned int w0; unsigned int w4; unsigned int w8; unsigned int w12; unsigned int w16; unsigned int w20; unsigned int w24; unsigned int w28; unsigned int w32; unsigned int w36; unsigned int w40; unsigned int w44; unsigned int w48; unsigned int w52; unsigned int w56; unsigned int w60; unsigned int w64; unsigned int w68; unsigned int w72; unsigned int w76; struct S *w80; };
extern int fn_0300275C(int, int, int, int);
extern void fn_0801A2C8(void *, int);
extern int fn_08006B00(void);
void fn_08009468(struct S *p)
{
    if (p->w80 != 0) {
        p->w76 &= ~32u;
        p->w32 = fn_0300275C(p->w12, p->w16, p->w80->w12, p->w80->w16);
        if (p->w80->w76 & 0x40000) {
            int a = fn_08006B00();
            int b = fn_08006B00();
            p->w32 += (a - b) << 21;
        }
        fn_0801A2C8(p, 56);
    }
}
