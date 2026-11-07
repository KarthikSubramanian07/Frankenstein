/* fn_0800A418: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

void fn_0801A2C8(unsigned char *, int);
void fn_08007D00(unsigned char *);
void fn_0800A418(unsigned char *a)
{
    fn_0801A2C8(a, 95);
    a[92]--;
    if (a[92] != 0)
        return;
    fn_08007D00(a);
}
