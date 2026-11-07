/* fn_08005770: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

extern unsigned int data_030064C4;
void fn_0800D0E0(unsigned int, int);
void fn_08005770(void)
{
    fn_0800D0E0(data_030064C4 + 224, 5);
}
