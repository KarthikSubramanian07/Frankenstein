/* fn_08013028: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Entry {
    uint32_t a;
    uint32_t b;
    uint16_t c;
    uint8_t pad[14];
};
struct Outer {
    uint8_t filler[0x754];
    struct Entry *entries;
};
struct Arg {
    uint8_t filler[0x53];
    uint8_t idx;
};
extern struct Outer *data_030064C4;
void fn_08012820(struct Arg *a0, uint16_t a1);
void fn_08013028(struct Arg *a0) {
    fn_08012820(a0, data_030064C4->entries[a0->idx].c);
}
