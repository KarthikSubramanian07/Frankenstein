/* fn_080057E8: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef unsigned char u8;
typedef unsigned int u32;
struct Main {
    u8 pad0[0xE0];
    u8 padE0[0x54];
    u8 b134;
    u8 _p1[31];
    u32 w154;
    u8 _p2[64];
    u32 w198;
    u8 _p3[0x75C - 0x19C];
    u32 *p75C;
};
extern struct Main *data_030064C4;
void fn_0800D0E0(void *a, int b);
void fn_080057E8(void) {
    data_030064C4->w154 = 1;
    data_030064C4->b134 = 7;
    fn_0800D0E0(&data_030064C4->pad0[0xE0], 0);
    data_030064C4->w198 = (u32)data_030064C4->p75C + data_030064C4->p75C[0xDC];
}
