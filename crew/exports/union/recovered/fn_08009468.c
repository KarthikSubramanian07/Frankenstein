/* fn_08009468: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

struct Sub { int u0,u4,u8,u12,u16,u20,u24,u28,u32,u36,u40,u44,u48,u52,u56,u60,u64,u68,u72,flags; };
struct Main { int u0,u4,u8,u12,u16,u20,u24,u28,u32,u36,u40,u44,u48,u52,u56,u60,u64,u68,u72,flags; struct Sub *next; };
int fn_0300275C(int a, int b, int c, int d);
void fn_0801A2C8(struct Main *p, int x);
int fn_08006B00(void);
void fn_08009468(struct Main *p)
{
 if (p->next != 0) {
  p->flags &= ~32;
  p->u32 = fn_0300275C(p->u12, p->u16, p->next->u12, p->next->u16);
  if ((p->next->flags << 13) < 0) {
   int a = fn_08006B00();
   int b = fn_08006B00();
   p->u32 += (a - b) << 21;
  }
  fn_0801A2C8(p, 56);
 }
}
