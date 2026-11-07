/* fn_0801C990: recovered by the Frankenstein crew, run doom_relay1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char _0[0x5A38]; int v38; unsigned char v3C; unsigned char _pd[11]; int v48; unsigned char _pd2[0x4C]; unsigned char v98; };
extern struct S *data_030064C4;
void fn_0801C990(void) {
    struct S *p = data_030064C4;
    int v = p->v48 - 1;
    p->v48 = v;
    if (v == 0 || p->v38 != 0) {
        p->v3C = 255;
        p->v38 = 0;
        p->v48 = 10;
    } else {
        p->v98 = (19 >= (v & 31));
    }
}
