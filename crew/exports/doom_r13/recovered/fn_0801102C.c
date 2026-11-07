/* fn_0801102C: recovered by the Frankenstein crew, run doom_r13.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
int fn_08006B00(void);
void fn_08010F6C(void *);

struct Obj {
    char pad0[8];
    int field8;
    char padC[8];
    int field14;
    char pad18[24];
    int field30;
    char pad34[8];
    int field3C;
    int field40;
    int field44;
    char pad48[4];
    int field4C;
    char pad50[8];
    short field58;
    unsigned char field5A;
};

void fn_0801102C(struct Obj *p)
{
    if ((p->field4C & 0x100000) && p->field5A != 0) {
        if (data_030064C4[0x25A] == 0) {
            if ((p->field3C | p->field40 | p->field44) != 0)
                return;
            if (p->field14 != p->field30)
                return;
            p->field8 = 0;
            return;
        } else {
            if ((p->field4C & 0x400000) == 0)
                return;
        }
    } else {
        if ((p->field4C & 0x400000) == 0)
            return;
        if (data_030064C4[0x25A] == 0)
            return;
    }
    if (++p->field58 <= 419)
        return;
    if ((*(int *)(data_030064C4 + 0x10EC) << 27) != 0)
        return;
    if (fn_08006B00() > 4)
        return;
    fn_08010F6C(p);
}
