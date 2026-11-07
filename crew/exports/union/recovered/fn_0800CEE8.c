/* fn_0800CEE8: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Inner { unsigned char pad[68]; int vals[5]; };
struct Save { unsigned char pad0[214]; unsigned char unkD6; unsigned char pad1[1665]; struct Inner *unk758; };
extern struct Save *data_030064C4;
struct P { unsigned char pad0[83]; unsigned char unk53; unsigned char unk54; unsigned char pad1[11]; int unk60; int unk64; int unk68; int unk6C; unsigned char pad2[12]; int arr[9]; };
int fn_0800CEE8(struct P *p, unsigned int idx, int arg)
{
 int cur;
 int max;
 int v;
 struct Save *save;
 unsigned int add;
 int total;
 if (idx == 5)
  return 0;
 cur = p->arr[idx];
 max = p->arr[idx + 4];
 if (cur == max)
  return 0;
 save = data_030064C4;
 v = save->unk758->vals[idx];
 if (arg != 0)
  add = v * arg;
 else
  add = v / 2;
 if ((save->unkD6 & ~4) == 0)
  add = add * 2;
 int tmp = cur + add;
 total = tmp;
 if (total > max)
  total = max;
 p->arr[idx] = total;
 if (cur != 0)
  return 1;
 switch (idx) {
 case 0:
  if (p->unk53 == 0) {
   if (p->unk64 != 0)
    p->unk54 = 3;
   else
    p->unk54 = 1;
  }
  break;
 case 1:
  if (p->unk53 <= 1) {
   if (0 != p->unk60)
    p->unk54 = 2;
  }
  break;
 case 2:
  if (p->unk53 <= 1) {
   if (p->unk6C != 0)
    p->unk54 = 5;
  }
  break;
 case 3:
  if (p->unk53 == 0) {
   if (p->unk68 != 0)
    p->unk54 = 4;
  }
  break;
 }
 return 1;
}
