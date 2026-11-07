/* fn_08009468: recovered by the Frankenstein crew, run doom_align_on.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct S { int _00,_04,_08,_0C,_10,_14,_18,_1C,_20,_24,_28,_2C,_30,_34,_38,_3C,_40,_44,_48; int _4C; struct S *_50; } S;
int fn_0300275C(int,int,int,int);
void fn_0801A2C8(void *, int);
int fn_08006B00(void);
void fn_08009468(S *s) {
    if (s->_50 != 0) {
        s->_4C &= ~32;
        s->_20 = fn_0300275C(s->_0C, s->_10, s->_50->_0C, s->_50->_10);
        if (s->_50->_4C & 0x40000) {
            int a = fn_08006B00();
            int b = fn_08006B00();
            s->_20 += (a - b) << 21;
        }
        fn_0801A2C8(s, 56);
    }
}
