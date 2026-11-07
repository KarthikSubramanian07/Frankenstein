/* fn_0800A484: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

void fn_0800D9BC(void *a, int b, int c, int d);
struct S_0800A484 { char pad[84]; short v; };
void fn_0800A484(struct S_0800A484 *p)
{
    fn_0800D9BC(p, 0, 0, p->v);
}
