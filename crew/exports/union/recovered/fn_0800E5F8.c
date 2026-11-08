/* fn_0800E5F8: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08010030(void *);
unsigned char fn_0800E5F8(int *a)
{
    unsigned int *p = (unsigned int *)a[2];
    unsigned short idx = *(unsigned short *)((unsigned char *)p + 30);
    unsigned char *tbl = *(unsigned char **)(data_030064C4 + 0xE04);
    unsigned char f = *(unsigned char *)(tbl + idx * 4 + 3);
    if ((f << 25) >= 0) {
        short v = *(short *)((unsigned char *)p + 26);
        if (v != ((f >> 7) << 8))
            return 1;
    }
    if (*(unsigned short *)((unsigned char *)p + 24) & 1)
        return 0;
    fn_08010030(p);
    if (*(int *)(data_030064C4 + 0x934) <= 0)
        return 0;
    int *q = *(int **)(data_030064C4 + 0x920);
    int v2 = *(int *)((unsigned char *)q + 20);
    if (*(int *)(data_030064C4 + 0x930) > v2 + 0x180000)
        return 0;
    int sum = v2 + *(int *)((unsigned char *)q + 0x38);
    return *(int *)(data_030064C4 + 0x92C) >= sum;
}
