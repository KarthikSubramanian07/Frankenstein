/* fn_0800702C: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

void fn_08020990(int, int, int);
extern int data_030064C4;
void fn_0800702C(void)
{
    fn_08020990(data_030064C4 + 0x7DC, 0, 0x80);
}
