/* fn_08001B10: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S_030064C4 { int unk0[30]; int field_78; unsigned char pad[5]; unsigned char flag_81; };
extern struct S_030064C4 *data_030064C4;
void fn_08001B10(void) {
    struct S_030064C4 *p = data_030064C4;
    p->field_78--;
    if (p->field_78 < 0)
        p->flag_81 = 1;
}
