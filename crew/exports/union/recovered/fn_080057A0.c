/* fn_080057A0: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

void fn_0800D0E0(void *a, int b);
extern int data_030064C4;
void fn_080057A0(void)
{
    fn_0800D0E0((void *)(data_030064C4 + 0xE0), 2);
}
