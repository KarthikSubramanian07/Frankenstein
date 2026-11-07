/* fn_080127AC: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

struct G { char pad[0xD64]; int **a[32]; };
extern struct G *data_030064C4;
void fn_0801853C(int **);
void fn_080127AC(int **arg)
{
    int ***p = (int ***)&data_030064C4->a[0];
    int i = 0;
    for (;;) {
        if (*p == arg) {
            arg[3][4] = 0;
            fn_0801853C(data_030064C4->a[i + 857 - 857]);
            data_030064C4->a[i + 857 - 857] = 0;
            break;
        }
        i++;
        p++;
        if (i == 32)
            break;
    }
}
