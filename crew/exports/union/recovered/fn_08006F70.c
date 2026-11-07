/* fn_08006F70: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void *data_030064C4;
struct Entry {
    int unk0;
    int unk4;
    int unk8;
    char pad[40];
    int f34;
    int f38;
    int f3C;
};
struct Arg {
    char pad[28];
    short val;
};
int fn_08006F70(struct Arg *a)
{
    char *base = (char *)data_030064C4;
    struct Entry **p = (struct Entry **)(base + 0x7dc);
    struct Entry **end = (struct Entry **)(base + 0x85c);
    int ret = 0;
    do {
        struct Entry *u = *p;
        if (u != 0) {
            int v = u->f34;
            if (v != 0) {
                if (u->f38 == a->val) {
                    u->f3C = v;
                    u->f34 = 0;
                    u->unk8 = 0;
                    ret = 1;
                }
            }
        }
        p++;
    } while (p != end);
    return ret;
}
