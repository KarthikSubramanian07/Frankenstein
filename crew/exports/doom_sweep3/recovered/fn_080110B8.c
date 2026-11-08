/* fn_080110B8: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080100E4(void *a);
void fn_0801A74C(void *a);
void fn_08018558(void *a);
void fn_080185B0(void *a, int b);
void fn_080110B8(unsigned char *a)
{
    fn_080100E4(a);
    fn_0801A74C(a);
    if (data_030064C4[0x25E] == 0) {
        fn_080185B0(a + 0x50, 0);
        fn_080185B0(a + 0x60, 0);
    }
    fn_08018558(a);
}
