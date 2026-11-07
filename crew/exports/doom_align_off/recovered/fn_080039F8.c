/* fn_080039F8: recovered by the Frankenstein crew, run doom_align_off.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned int *data_030064C4;
void fn_080039F8(void)
{
    unsigned int buf[6];
    unsigned char *dst = (unsigned char *)0x0E000300;
    unsigned char *src = (unsigned char *)buf;
    buf[0] = 0xBADDEAD1;
    buf[2] = data_030064C4[33];
    buf[1] = data_030064C4[475];
    buf[3] = data_030064C4[474];
    buf[4] = data_030064C4[5517];
    buf[5] = data_030064C4[5516];
    while (dst < (unsigned char *)0x0E000318)
        *dst++ = *src++;
}
