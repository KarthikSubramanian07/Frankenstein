/* fn_08012FBC: recovered by the Frankenstein crew, run doom_r11.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
struct Ent { int v; int f[5]; };
unsigned char fn_08012FBC(unsigned char *p)
{
    unsigned char *b = data_030064C4;
    int id = p[0x53];
    struct Ent *t = *(struct Ent **)(b + 0x754);
    int v = t[id].v;
    unsigned char low = (unsigned char)v;
    int th;
    if (id == 6) {
        th = *(int *)(*(unsigned char **)(b + 0x758) + 0x30);
    } else {
        th = 1 + (id == 8);
    }
    if (low == 5)
        return 1;
    return *(int *)(p + (v & 255) * 4 + 124) >= th;
}
