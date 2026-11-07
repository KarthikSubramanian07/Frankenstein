/* fn_08014504: recovered by the Frankenstein crew, run doom_align_on.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct { char pad[24]; unsigned short *f; char pad2[12]; } Obj40;
typedef struct { char pad[20]; unsigned short vals[6]; } Obj32;
typedef struct { char pad[12]; } Elem12;
typedef struct {
  char pad0[3568];
  Obj40 *a;
  char pad1[12];
  Obj32 *b;
  char pad2[8];
  Elem12 *out2;
  unsigned int lim;
  Elem12 *out1;
} Glob;
extern Glob *data_030064C4;
Elem12 *fn_08014504(int a0, int a1, int a2)
{
    Glob *g = data_030064C4;
    unsigned short h = g->a[a0].f[a1];
    unsigned short h2 = g->b[h].vals[a2];
    if (h2 >= g->lim)
        return &g->out2[h2];
    return &g->out1[h2];
}
