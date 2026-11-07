/* fn_0801C61C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08005458(char *buf, int size, const char *fmt, ...);
void fn_0801C61C(int a, int b, char *buf)
{
    if (data_030064C4[0x94] == 2)
        fn_08005458(buf, 9, "x", b);
    else
        fn_08005458(buf, 9, "y", a, b);
}
