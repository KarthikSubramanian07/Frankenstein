/* fn_080039F8: recovered by the Frankenstein crew, run doom_r12.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080039F8(void)
{
    unsigned int buf[6];
    unsigned char *p;
    unsigned char *src;
    unsigned char *dst;
    buf[0] = 0xBADDEAD1;
    p = data_030064C4;
    buf[2] = *(unsigned int *)(p + 0x84);
    buf[1] = *(unsigned int *)(p + 0x76C);
    buf[3] = *(unsigned int *)(p + 0x768);
    buf[4] = *(unsigned int *)(p + 0x5634);
    buf[5] = *(unsigned int *)(p + 0x5630);
    src = (unsigned char *)buf;
    dst = (unsigned char *)0x0E000300;
    do {
        *dst++ = *src++;
    } while (dst != (unsigned char *)0x0E000318);
}
