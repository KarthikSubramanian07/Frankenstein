/* fn_080077E4: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

typedef struct Main Main;
typedef struct Sub Sub;
struct Sub {
    int unk0;
    int unk4;
    void (*handler)(void);
    unsigned char flag;
    unsigned char _pad0d[3];
    void *owner;
    int _pad14;
    int unk18;
    int unk1c;
    int _pad20;
    int unk24;
    int unk28;
    int unk2c;
};
struct Main {
    char _pad00[20];
    Sub *sub;
    char _pad18[8];
    unsigned short s20;
};

void *fn_0801D67C(int, int, int);
void fn_08020990(void *, int, int);
void fn_0801851C(void *);
void fn_0800704C(void);

void fn_080077E4(Main *p)
{
    Sub *s = fn_0801D67C(48, 3, 0);
    fn_08020990(s, 0, 48);
    fn_0801851C(s);
    p->sub = s;
    p->s20 = 0;
    s->handler = fn_0800704C;
    s->flag = 0;
    s->unk18 = 131072;
    s->owner = p;
    s->unk1c = 0;
    s->unk24 = 1050;
    s->unk28 = 0;
    s->unk2c = 0;
}
