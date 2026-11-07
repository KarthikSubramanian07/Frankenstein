/* fn_0800A498: salvaged by the Frankenstein crew from run doom_sweep1, attempt 1.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Entry {
    unsigned char unk0[0x4C];
    int value;
    unsigned char unk1[12];
};
struct Table {
    unsigned char unk0[0x750];
    struct Entry *entries;
};
extern struct Table *data_030064C4;
struct Param {
    unsigned char unk0[0x50];
    int field50;
    unsigned char unk1[6];
    unsigned char byte5A;
};
void fn_0800FC90(void *, int, int);
void fn_0800A498(struct Param *p)
{
    unsigned int idx = p->byte5A;
    int v = data_030064C4->entries[idx].value;
    fn_0800FC90(p, p->field50, v);
}
