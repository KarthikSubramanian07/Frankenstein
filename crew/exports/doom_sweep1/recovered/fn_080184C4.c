/* fn_080184C4: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Node { struct Node *prev; struct Node *next; };
void fn_0801D5E8(void *p);
void fn_080184C4(struct Node *p)
{
    p->next->prev = p->prev;
    p->prev->next = p->next;
    fn_0801D5E8(p);
}
