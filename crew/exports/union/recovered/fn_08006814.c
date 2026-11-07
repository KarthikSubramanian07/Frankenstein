/* fn_08006814: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

struct S { char pad[0x78e]; short a; short b; };
extern struct S *data_030064C4;
void fn_08006814(void)
{
    struct S *p = data_030064C4;
    short t = p->a - 1;
    p->a = t;
    if (t > 0)
        return;
    p->b ^= 1;
    p->a = 8;
}
