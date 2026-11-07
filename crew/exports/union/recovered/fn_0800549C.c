/* fn_0800549C: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

void fn_0800549C(int *a, int b, int c)
{
    if (a[2] > b) {
        a[2] = b;
    } else if (a[3] < b) {
        a[3] = b;
    }
    if (a[1] > c) {
        a[1] = c;
    } else if (a[0] < c) {
        a[0] = c;
    }
}
