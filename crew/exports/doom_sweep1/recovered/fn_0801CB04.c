/* fn_0801CB04: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char _00[0x5A38]; int _5A38; unsigned char _5A3C; unsigned char _pad1[0x13]; int _5A50; int _5A54; int _5A58; int _5A5C; unsigned char _pad2[0x28]; int _5A88; int _5A8C; int _5A90; int _5A94; };
extern struct S *data_030064C4;
void fn_0801CB04(void) {
    struct S *p = data_030064C4;
    p->_5A3C = 0;
    p->_5A38 = 0;
    p->_5A88 = 1;
    p->_5A8C = -1;
    p->_5A94 = -1;
    p->_5A90 = -1;
    p->_5A54 = -1;
    p->_5A58 = -1;
    p->_5A50 = -1;
    p->_5A5C = 35;
}
