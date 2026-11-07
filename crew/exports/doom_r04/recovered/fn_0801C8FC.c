/* fn_0801C8FC: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_0801C8FC(void) {
    data_030064C4[0x5A3C] = 0xFF;
    *(unsigned int *)(data_030064C4 + 0x5A38) = 0;
    *(unsigned int *)(data_030064C4 + 0x5A48) = 10;
}
