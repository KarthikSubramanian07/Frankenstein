/* fn_08005458: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef __builtin_va_list va_list;
struct Out { char *cur; char *end; };
void fn_080051BC(struct Out *o, const char *fmt, va_list ap);
int fn_08005458(char *buf, int size, const char *fmt, ...)
{
    va_list ap;
    struct Out out;
    char *cur;
    out.cur = buf;
    out.end = buf + size - 1;
    __builtin_va_start(ap, fmt);
    fn_080051BC(&out, fmt, ap);
    cur = out.cur;
    *cur = 0;
    return cur - buf;
}
