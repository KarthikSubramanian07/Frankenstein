/* fn_0801B1F8: salvaged MATCH; Checker now allows GBA MMIO (0x0400…) as hardware, not a missing data_ id. */

#define REG_DMA3SAD *(volatile unsigned int *)0x040000D4
#define REG_DMA3DAD *(volatile unsigned int *)0x040000D8
#define REG_DMA3CNT *(volatile unsigned int *)0x040000DC
struct S { unsigned char pad[0x5A30]; unsigned char *ptr; };
extern struct S *data_030064C4;
extern unsigned char data_08130000[];
void fn_0801B1F8(void) {
    unsigned char *src = data_08130000;
    unsigned char *dst = data_030064C4->ptr + 0x7800;
    unsigned char *end = src + 0x1E00;
    do {
        REG_DMA3SAD = (unsigned int)src;
        src += 0xF0;
        REG_DMA3DAD = (unsigned int)dst;
        REG_DMA3CNT = 0x80000078;
        dst += 0xF0;
    } while (src != end);
}
