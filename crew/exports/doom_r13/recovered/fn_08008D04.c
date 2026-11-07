/* fn_08008D04: recovered by the Frankenstein crew, run doom_r13.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct Obj { int unk00; int unk04; int unk08; int unk0C; int unk10; int unk14; int unk18; int unk1C; int unk20; int unk24; int unk28; int unk2C; int unk30; int unk34; int unk38; int unk3C; int unk40; int unk44; int unk48; int unk4C; struct Obj *unk50; } Obj;
int fn_08006B00(void);
int fn_0800FAB8(Obj *a, int b, int c);
int fn_0800FB6C(Obj *a, int b, int c, int d, int e);
void fn_0801A2C8(Obj *a, int b);
int fn_0300275C(int a, int b, int c, int d);

void fn_08008D04(Obj *p)
{
    int v;
    int saved;
    int i;
    if (p->unk50 == 0)
        return;
    fn_0801A2C8(p, 2);
    if (p->unk50 == 0) {
        v = p->unk20;
    } else {
        p->unk4C &= ~32;
        v = fn_0300275C(p->unk0C, p->unk10, p->unk50->unk0C, p->unk50->unk10);
        p->unk20 = v;
        if ((p->unk50->unk4C << 13) < 0) {
            int a = fn_08006B00();
            int b = fn_08006B00();
            v = ((a - b) << 21) + p->unk20;
            p->unk20 = v;
        }
    }
    saved = fn_0800FAB8(p, v, 0x08000000);
    for (i = 3; i != 0; i--) {
        int d1 = fn_08006B00();
        int d2 = fn_08006B00();
        int diff = d1 - d2;
        int q = fn_08006B00() % 5;
        fn_0800FB6C(p, (diff << 20) + v, 0x08000000, saved, (q + 1) * 3);
    }
}
