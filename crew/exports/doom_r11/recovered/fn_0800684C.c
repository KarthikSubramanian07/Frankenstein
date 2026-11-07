/* fn_0800684C: recovered by the Frankenstein crew, run doom_r11.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
extern unsigned int data_030064C8;
void fn_0800684C(unsigned int a, unsigned int b, unsigned int c)
{
    unsigned char *p = data_030064C4;
    *(unsigned int *)(p + 0x77c) = *(p + 0x792);
    *(unsigned int *)(p + 0x774) = 1;
    *(unsigned int *)(p + 0x778) = a;
    data_030064C8 = b;
    *(p + 0x793) = c;
    *(p + 0x792) = 1;
}
