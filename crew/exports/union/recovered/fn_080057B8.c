/* fn_080057B8: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

void fn_0800D0E0(int, int);
extern int data_030064C4;
void fn_080057B8(void)
{
    fn_0800D0E0(data_030064C4 + 224, 1);
}
