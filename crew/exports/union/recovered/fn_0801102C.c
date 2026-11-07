/* fn_0801102C: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

extern unsigned char *data_030064C4;
int fn_08006B00(void);
void fn_08010F6C(void *p);
typedef struct {
 unsigned int _00;
 unsigned int _04;
 unsigned int _08;
 unsigned int _0C;
 unsigned int _10;
 unsigned int _14;
 unsigned int _18;
 unsigned int _1C;
 unsigned int _20;
 unsigned int _24;
 unsigned int _28;
 unsigned int _2C;
 unsigned int _30;
 unsigned int _34;
 unsigned int _38;
 unsigned int _3C;
 unsigned int _40;
 unsigned int _44;
 unsigned int _48;
 unsigned int _4C;
 unsigned int _50;
 unsigned int _54;
 short _58;
 unsigned char _5A;
} S;
void fn_0801102C(S *p) {
 if (p->_4C & 0x100000) {
  if (p->_5A) {
   if (data_030064C4[0x25A]) {
    if (!(p->_4C & 0x400000)) return;
   } else {
    if ((p->_3C | p->_40 | p->_44)) return;
    if (p->_14 != p->_30) return;
    p->_08 = 0;
    return;
   }
  } else {
   if (!(p->_4C & 0x400000)) return;
   if (!data_030064C4[0x25A]) return;
  }
 } else {
  if (!(p->_4C & 0x400000)) return;
  if (!data_030064C4[0x25A]) return;
 }
 if (++p->_58 <= 419) return;
 if ((*(unsigned int *)(data_030064C4 + 0x10EC) & 0x1F)) return;
 if (fn_08006B00() > 4) return;
 fn_08010F6C(p);
}
