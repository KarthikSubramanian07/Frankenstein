/* fn_08019B64: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char pad0[0x4D4]; int f4D4; unsigned char pad1[0x80]; unsigned char f558; };
extern struct S *data_030064C4;
void fn_0801E180(int a, int b, int c, int d);
void fn_08019B64(int a, int b, int c)
{
    fn_0801E180(data_030064C4->f4D4, a, b, c);
    data_030064C4->f558 = 0;
}
