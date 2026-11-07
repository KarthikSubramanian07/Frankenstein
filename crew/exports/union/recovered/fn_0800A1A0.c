/* fn_0800A1A0: recovered by the Frankenstein crew. The Digger's attempt 6 in run doom_align_on
   scored 97.7%; crew/permuter.py found a semantics-preserving rewrite that matches.
   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct Node Node;
struct Node {
    int unk0;
    Node *next;
    void (*func)(void);
    unsigned char pad[0x5A - 12];
    unsigned char kind;
};
typedef struct Main Main;
struct Main {
    unsigned char _0[0x878];
    Node **arr;
    int cap;
    int count;
    int unk884;
    int unk888;
    unsigned char _1[0x10F0 - 0x88C];
    Node sentinel;
};
extern Main *data_030064C4;
void fn_03001618(void);
void *fn_0801D7D0(void *a, int b, int c, int d);
void fn_0800A1A0(void)
{
    Node *n;
    data_030064C4->count = 0;
    data_030064C4->unk888 = 0;
    data_030064C4->unk884 = 0;
    n = data_030064C4->sentinel.next;
    while (n != &data_030064C4->sentinel) {
        if (n->func == fn_03001618 && n->kind == 27) {
            if (data_030064C4->count >= data_030064C4->cap) {
                void *old = (void *)data_030064C4->arr;
                unsigned int cap = data_030064C4->cap;
                int newCap;
                int newSize;
                if (cap != 0) {
                    newCap = cap * 2;
                    newSize = 8 * cap;
                } else {
                    newCap = 32;
                    newSize = 128;
                }
                data_030064C4->cap = newCap;
                data_030064C4->arr = (Node **)fn_0801D7D0(old, newSize, 1, 0);
            }
            data_030064C4->arr[data_030064C4->count++] = n;
        }
        n = n->next;
    }
}
