/* fn_08018548: recovered by the Frankenstein crew, run doom_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Node {
    struct Node *next;
    struct Node *prev;
};
void fn_08018548(struct Node *p) {
    struct Node *next = p->next;
    struct Node *prev = p->prev;
    prev->next = next;
    next->prev = prev;
    p->next = 0;
    p->prev = 0;
}
