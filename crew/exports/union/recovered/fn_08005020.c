/* fn_08005020: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

int fn_08000464(void);
extern unsigned char *data_030064C4;
extern int data_030064CC;

int fn_08005020(void)
{
    int v = fn_08000464();
    *(int *)(data_030064C4 + 0x5A30) = v;
    data_030064CC = v;
    return 1;
}
