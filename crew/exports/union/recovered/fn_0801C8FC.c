/* fn_0801C8FC: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801C8FC(void)
{
    extern unsigned char *data_030064C4;
    data_030064C4[0x5A3C] = 255;
    *(int *)(data_030064C4 + 0x5A38) = 0;
    *(int *)(data_030064C4 + 0x5A48) = 10;
}
