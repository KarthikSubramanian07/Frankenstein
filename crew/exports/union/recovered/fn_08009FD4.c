/* fn_08009FD4: MMIO absolute casts rewritten to named symbols; still byte-identical MATCH. */

void fn_0800FC90(void *a, void *b, unsigned int c);
void fn_08009FD4(void *a)
{
    fn_0800FC90(a, ((void **)a)[20], 128);
}
