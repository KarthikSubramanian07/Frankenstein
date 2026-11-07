/* fn_0801AC0C: recovered by the Frankenstein crew, run doom_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Rec { int x; int y; int z; };
struct Big { unsigned char unk[0x55D0]; struct Rec arr[16]; };
extern unsigned char data_080257F6;
extern struct Big *data_030064C4;
void fn_0801AC0C(int a0) {
    if (data_080257F6 != 0) return;
    if (data_030064C4->arr[a0].x != 0) data_030064C4->arr[a0].x = data_080257F6;
}
