/* fn_080127AC: recovered by the Frankenstein crew, run doom_relay1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Big {
    unsigned char pad[3428];
    int slots[32];
};
extern struct Big *data_030064C4;
void fn_0801853C(int);
void fn_080127AC(int arg)
{
    int *p = data_030064C4->slots;
    int i = 0;
    for (;;) {
        if (*p == arg) {
            ((int *)((int *)arg)[3])[4] = 0;
            fn_0801853C(data_030064C4->slots[i]);
            data_030064C4->slots[i] = 0;
            break;
        }
        i++;
        p++;
        if (i == 32)
            break;
    }
}
