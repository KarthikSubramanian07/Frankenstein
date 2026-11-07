/* fn_080067F8: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { char _0[0x784]; int _784; char _788[4]; short _78c; };
extern struct S *data_030064C4;
void fn_080067F8(int a) {
    data_030064C4->_784 = a;
    data_030064C4->_78c = 0;
}
