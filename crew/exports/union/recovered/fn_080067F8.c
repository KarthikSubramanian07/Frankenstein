/* fn_080067F8: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

struct S { char _0[0x784]; int _784; char _788[4]; short _78c; };
extern struct S *data_030064C4;
void fn_080067F8(int a) {
    data_030064C4->_784 = a;
    data_030064C4->_78c = 0;
}
