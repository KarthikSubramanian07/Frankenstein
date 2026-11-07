/* fn_0801271C: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

extern void *data_030064C4;
struct Item {
 int f0;
 int f4;
 int f8;
 int f12;
 int f16;
 int f20;
 int f24;
 int f28;
 int f32;
 unsigned char f36;
 unsigned char f37;
 unsigned short pad;
 int f40;
};
struct Param {
 int f0;
 int f4;
 int f8;
 int f12;
 int f16;
 int f20;
 int f24;
 short f28;
};
int fn_0801271C(struct Param *a)
{
 struct Item **p = (struct Item **)((char *)data_030064C4 + 0xD64);
 struct Item **end = (struct Item **)((char *)data_030064C4 + 0xDE4);
 struct Item *it;
 int zero = 0;
 do {
  it = *p;
  if (it != 0 && it->f36 != 3 && it->f40 == a->f28) {
   it->f37 = it->f36;
   it->f36 = 3;
   it->f8 = zero;
  }
  p++;
 } while (p != end);
 return 1;
}
