/* fn_0801C8FC: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { unsigned char _0[0x5A38]; unsigned int a; unsigned char b; unsigned char _p[0xB]; unsigned int c; };
extern struct S *data_030064C4;
void fn_0801C8FC(void) {
    data_030064C4->b = 255;
    data_030064C4->a = 0;
    data_030064C4->c = 10;
}
