/* fn_080057D0: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

void fn_0800D0E0(void *a, int b);
extern char *data_030064C4;
void fn_080057D0(void)
{
    fn_0800D0E0(data_030064C4 + 224, 0);
}
