/* fn_0801C8D4: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { char _0[0x5A8C]; int _5A8C; int _5A90; int _5A94; };
extern struct S *data_030064C4;
void fn_0801C8D4(void) {
    data_030064C4->_5A8C = -1;
    data_030064C4->_5A94 = -1;
    data_030064C4->_5A90 = -1;
}
