/* fn_0800A458: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_0801A2C8(void *, int);
struct S { char f[0x54]; short v; };
void fn_0800A458(struct S *p)
{
    fn_0801A2C8(p, data_030064C4[0x94] != 0 && p->v + 50 < 0 ? 58 : 57);
}
