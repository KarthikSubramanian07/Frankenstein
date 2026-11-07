/* fn_08006F18: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void *data_030064C4;
void fn_08006B60(void);

struct Item {
    int f0;
    int f4;
    void (*f8)(void);
    int f12;
    int f16;
    int f20;
    int f24;
    int f28;
    int f32;
    int f36;
    int f40;
    int f44;
    int f48;
    int f52;
    int f56;
    int f60;
};

struct Param {
    int f0;
    int f4;
    int f8;
    int f12;
    int f16;
    int f20;
    int f24;
    short f28;
};

int fn_08006F18(struct Param *a)
{
    char *base = (char *)data_030064C4;
    struct Item **p = (struct Item **)(base + 0x7dc);
    struct Item **end = (struct Item **)(base + 0x85c);
    int found = 0;
    struct Item *it;
    do {
        it = *p;
        if (it != 0 && it->f56 == a->f28 && it->f52 == 0) {
            it->f52 = it->f60;
            it->f8 = fn_08006B60;
            found = 1;
        }
        p++;
    } while (p != end);
    return found;
}
