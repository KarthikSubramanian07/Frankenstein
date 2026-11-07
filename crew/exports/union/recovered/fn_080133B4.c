/* fn_080133B4: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

void fn_0801120C(int, int);
void fn_080128D4(int *, int);
void fn_080133B4(int *p)
{
    fn_0801120C(*p, 155);
    fn_080128D4(p, 0);
}
