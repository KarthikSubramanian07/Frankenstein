/* fn_0801A95C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern const unsigned char data_080257F5;
extern unsigned char *data_030064C4;
void fn_08004E68(unsigned int);
void fn_080005A8(const char *, unsigned int);
void fn_0801A95C(unsigned int a)
{
    unsigned int v = a;
    if (data_080257F5 != 0)
        return;
    if (v > 15)
        fn_080005A8("x", v);
    fn_08004E68(v);
    *(unsigned int *)(data_030064C4 + 0x5634) = v;
}
