/* fn_08018558: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Node { struct Node *next; struct Node *prev; void (*cb)(void); };
struct Outer { unsigned char pad[0x10F0]; struct Node head; };
extern struct Outer *data_030064C4;
extern void fn_080184D8(void);
void fn_08018558(struct Node *p)
{
    if (p->prev != 0) {
        p->cb = fn_080184D8;
    } else {
        data_030064C4->head.next->prev = p;
        p->prev = &data_030064C4->head;
        p->next = data_030064C4->head.next;
        data_030064C4->head.next = p;
        p->cb = fn_080184D8;
    }
}
