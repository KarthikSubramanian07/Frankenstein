/* fn_080035CC: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S080035CC { unsigned char pad0[0xD4]; unsigned char v_d4; unsigned char v_d5; unsigned char pad1[6]; int v_dc; unsigned char pad2[0x120]; int v_200; unsigned char pad3[0x5438]; int v_563c; };
extern struct S080035CC *data_030064C4;
void fn_08003064(void);
void fn_080035CC(void) {
    data_030064C4->v_563c = -1;
    data_030064C4->v_d5 = 0;
    data_030064C4->v_dc = data_030064C4->v_200 + 1;
    fn_08003064();
    data_030064C4->v_d4 = 0;
}
