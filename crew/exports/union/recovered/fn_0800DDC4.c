/* fn_0800DDC4: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

struct S {
    int f0;
    int f4;
    int f8;
    unsigned char *p;
    int f16;
    int f20;
    int f24;
};

void fn_0800DDC4(struct S *a)
{
    if (a->f24 == -1) {
        if (a->p[38] - 8 > a->f16)
            a->p[38] -= 8;
        else
            a->f24 = 1;
    } else if (a->f24 == 1) {
        if (a->p[38] + 8 >= a->f20)
            a->f24 = -1;
        else
            a->p[38] += 8;
    }
}
