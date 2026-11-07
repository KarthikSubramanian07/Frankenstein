/* fn_08004E30: salvaged MATCH; Checker now allows GBA MMIO (0x0400…) as hardware, not a missing data_ id. */

void fn_08019BB0(int);
void fn_08004E30(void)
{
    unsigned short ime = *(volatile unsigned short *)0x04000208;
    *(volatile unsigned short *)0x04000208 = 0;
    fn_08019BB0(0);
    *(volatile unsigned short *)0x04000208 = ime;
}
