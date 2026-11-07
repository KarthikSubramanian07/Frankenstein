/* fn_08005E6C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_0801D480(char *p);
void fn_0801C130(int a, int b, int c, int d);
void fn_08005E6C(int arg0, int arg1)
{
    int a = fn_0801D480("aaaaaaaaaaa");
    int b = fn_0801D480("bbbbbbbbbbb");
    fn_0801C130(0x50, arg0, 0, b);
    int i = 0x58;
    do {
        fn_0801C130(i, arg0, 0, a);
        i += 8;
    } while (i != 0xD8);
    int c = fn_0801D480("ccccccccccc");
    fn_0801C130(0xD8, arg0, 0, c);
    int d = fn_0801D480("ddddddddddd");
    fn_0801C130((arg1 << 3) + 0x58, arg0, 0, d);
}
