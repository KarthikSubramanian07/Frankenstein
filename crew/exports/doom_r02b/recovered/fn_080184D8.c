/* fn_080184D8: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Node { struct Node *next; struct Node *prev; int unk1[17]; int unk2; unsigned char pad[10]; unsigned char flag; };
void fn_0801D5E8(struct Node *p);
void fn_080184D8(struct Node *p)
{
    struct Node *next = p->next;
    struct Node *prev = p->prev;
    prev->next = next;
    next->prev = prev;
    if ((p->unk2 << 3) < 0) {
        p->flag = 0x89;
    } else {
        fn_0801D5E8(p);
    }
}
