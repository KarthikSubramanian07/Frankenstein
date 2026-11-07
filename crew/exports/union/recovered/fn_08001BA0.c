/* fn_08001BA0: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char pad0[116]; int v74; unsigned char pad1[9]; unsigned char v81; unsigned char pad2[82]; unsigned char vD4; };
extern struct S *data_030064C4;
void fn_08001BA0(void) {
    data_030064C4->vD4 = 0;
    data_030064C4->v74 = -1;
    data_030064C4->v81 = 1;
}
