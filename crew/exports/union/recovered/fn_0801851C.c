/* fn_0801851C: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Node { struct Node *next; struct Node *prev; };
struct Outer { char pad[0x10F0]; struct Node head; };
extern struct Outer *data_030064C4;
void fn_0801851C(struct Node *p)
{
    data_030064C4->head.next->prev = p;
    p->prev = &data_030064C4->head;
    p->next = data_030064C4->head.next;
    data_030064C4->head.next = p;
}
