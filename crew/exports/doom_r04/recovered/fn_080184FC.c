/* fn_080184FC: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern struct S { char pad[0x10F0]; int a; int b; } *data_030064C4;
void fn_080184FC(void) {
    int v = (int)data_030064C4 + 0x10F0;
    data_030064C4->b = v;
    data_030064C4->a = v;
}
