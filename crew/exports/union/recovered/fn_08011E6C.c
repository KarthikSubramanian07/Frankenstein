/* fn_08011E6C: recovered by the Frankenstein crew, run doom_r11.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08006B00(void);
void *fn_08010DEC(int, int, int, int);
void fn_0801120C(void *, int);
extern void *data_030064C4;

void fn_08011E6C(int a, int b, int c)
{
    int d = fn_08006B00();
    int e = fn_08006B00();
    int f = ((d - e) << 10) + c;
    void *p = fn_08010DEC(a, b, f, 37);
    *(int *)((char *)p + 68) = 0x10000;
    {
        short v = fn_08006B00() & 3;
        v = *(short *)((char *)p + 86) - v;
        if (v <= 0)
            v = 1;
        *(short *)((char *)p + 86) = v;
    }
    if (*(int *)((char *)data_030064C4 + 0x904) == 0x400000)
        fn_0801120C(p, 95);
}
