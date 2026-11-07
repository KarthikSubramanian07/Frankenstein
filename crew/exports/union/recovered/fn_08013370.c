/* fn_08013370: recovered by the Frankenstein crew, run doom_r11.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08012820(unsigned char *a, unsigned int b);
struct Entry { char pad0[12]; unsigned short field; char pad1[10]; };
void fn_08013370(unsigned char *a, int *b)
{
    int v = b[3] - 393216;
    if (v > 0x200000) {
        b[3] = v;
        return;
    }
    b[3] = 0x200000;
    fn_08012820(a, (*(struct Entry **)(data_030064C4 + 0x754))[a[83]].field);
}
