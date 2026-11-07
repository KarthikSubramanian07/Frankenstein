/* fn_08004D4C: salvaged MATCH; Checker now allows GBA MMIO (0x0400…) as hardware, not a missing data_ id. */

extern short *data_030064C4;
extern int fn_0801D568(int);
extern void fn_08019ABC(unsigned int, int, unsigned int);
int fn_08004D4C(unsigned int a0, unsigned int a1, unsigned int a2)
{
    if (a1 > 7 || a0 > 108)
        return -1;
    int flag = a0 > 108;
    short v = data_030064C4[a0 + 508];
    if (v < 0)
        return -1;
    int w = fn_0801D568(v);
    unsigned short s = *(unsigned short *)0x04000208;
    *(unsigned short *)0x04000208 = flag;
    fn_08019ABC(a1, w, a2);
    *(unsigned short *)0x04000208 = s;
    return a1;
}
