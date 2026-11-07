/* fn_0801C990: recovered by the Frankenstein crew, run doom_relay2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char pad[0x5A38]; int f38; unsigned char f3C; unsigned char pad2[0xB]; int f48; unsigned char pad3[0x4C]; unsigned char f98; };
extern struct S *data_030064C4;
void fn_0801C990(void) {
    struct S *p = data_030064C4;
    int v = p->f48 - 1;
    p->f48 = v;
    if (v == 0 || p->f38 != 0) {
        p->f3C = 0xFF;
        p->f38 = 0;
        p->f48 = 10;
    } else {
        p->f98 = (19 >= (v & 31));
    }
}
