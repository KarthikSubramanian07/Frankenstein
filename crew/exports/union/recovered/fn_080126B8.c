/* fn_080126B8: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

extern void *data_030064C4;
void fn_08012254(void);

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
    unsigned char f36;
    unsigned char f37;
    unsigned char f38;
    unsigned char f39;
    int f40;
    unsigned char f44;
};

void fn_080126B8(int a)
{
    struct Item **p = (struct Item **)((char *)data_030064C4 + 0xD64);
    struct Item **end = (struct Item **)((char *)data_030064C4 + 0xDE4);
    struct Item *it;
    do {
        it = *p;
        if (it != 0 && it->f40 == a && it->f36 == 3) {
            it->f36 = it->f44 == 7 ? !it->f37 : it->f37;
            it->f8 = fn_08012254;
        }
        p++;
    } while (p != end);
}
