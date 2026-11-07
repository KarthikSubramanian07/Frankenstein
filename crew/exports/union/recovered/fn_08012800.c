/* fn_08012800: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

extern int data_030064C4;
void fn_08020990(int, int, int);
void fn_08012800(void)
{
    fn_08020990(data_030064C4 + 0xD64, 0, 0x80);
}
