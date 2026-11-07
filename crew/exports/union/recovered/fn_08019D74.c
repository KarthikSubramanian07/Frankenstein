/* fn_08019D74: recovered by the Frankenstein crew, run doom_r11.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char data_080257F6;
extern unsigned char *data_030064C4;
void fn_08019D74(void) {
    unsigned char *p;
    if (data_080257F6 != 0)
        return;
    p = data_030064C4;
    if (*(unsigned int *)(p + 0x55d0))
        *(unsigned int *)(p + 0x55d0) = 0;
    if (*(unsigned int *)(p + 0x55dc))
        *(unsigned int *)(p + 0x55dc) = 0;
    if (*(unsigned int *)(p + 0x55e8))
        *(unsigned int *)(p + 0x55e8) = 0;
    if (*(unsigned int *)(p + 0x55f4))
        *(unsigned int *)(p + 0x55f4) = 0;
    if (*(unsigned int *)(p + 0x5600))
        *(unsigned int *)(p + 0x5600) = 0;
    if (*(unsigned int *)(p + 0x560c))
        *(unsigned int *)(p + 0x560c) = 0;
    if (*(unsigned int *)(p + 0x5618))
        *(unsigned int *)(p + 0x5618) = 0;
    if (*(unsigned int *)(p + 0x5624))
        *(unsigned int *)(p + 0x5624) = 0;
}
