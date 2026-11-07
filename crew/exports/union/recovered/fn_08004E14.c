/* fn_08004E14: salvaged MATCH; Checker now allows GBA MMIO (0x0400…) as hardware, not a missing data_ id. */

void fn_08019BB0(int);
void fn_08004E14(void)
{
    unsigned short *p = (unsigned short *)0x04000208;
    unsigned short ime = *p;
    *p = 0;
    fn_08019BB0(1);
    *p = ime;
}
