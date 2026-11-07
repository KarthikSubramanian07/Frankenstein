/* fn_0801B1F8: salvaged by the Frankenstein crew from run doom_hud01, attempt 1.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
extern unsigned char data_08130000;

void fn_0801B1F8(void)
{
    unsigned char *src = &data_08130000;
    unsigned char *end = src + (0xF0 << 5);
    unsigned char *dst = *(unsigned char **)(data_030064C4 + 0x5A30) + (0xF0 << 7);
    do {
        *(volatile unsigned int *)0x040000D4 = (unsigned int)src;
        src += 0xF0;
        *(volatile unsigned int *)0x040000D8 = (unsigned int)dst;
        *(volatile unsigned int *)0x040000DC = 0x80000078;
        dst += 0xF0;
    } while (src != end);
}
