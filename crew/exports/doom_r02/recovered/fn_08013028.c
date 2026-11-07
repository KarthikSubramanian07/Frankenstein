/* fn_08013028: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Sub { uint8_t pad0[8]; uint16_t val; uint8_t padA[14]; };
struct Outer { uint8_t pad[0x754]; struct Sub *arr; };
extern struct Outer *data_030064C4;
struct Arg { uint8_t pad[0x53]; uint8_t idx; };
void fn_08012820(struct Arg *a, unsigned short b);
void fn_08013028(struct Arg *a)
{
    uint8_t idx = a->idx;
    struct Sub *base = data_030064C4->arr;
    fn_08012820(a, base[idx].val);
}
