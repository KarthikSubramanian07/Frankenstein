/* fn_08004B58: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080199EC(void *p);
void fn_08004B58(void)
{
    *(volatile unsigned int *)0x040000C4 = 0;
    {
        unsigned char *base = data_030064C4;
        unsigned int idx = *(unsigned int *)(base + 0x73c);
        *(volatile unsigned int *)0x040000BC = (unsigned int)(base + (idx * 240 + 0x55c));
        *(volatile unsigned int *)0x040000C4 = 0xB6400000;
        idx ^= 1;
        *(unsigned int *)(base + 0x73c) = idx;
        fn_080199EC(base + (idx * 240 + 0x55c));
    }
}
