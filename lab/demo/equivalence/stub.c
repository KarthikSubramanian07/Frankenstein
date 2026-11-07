/* Host-side stand-ins for the two globals the RNG functions read. Not agent code. */
unsigned int g_state[512];
unsigned int *data_030064C4 = g_state;   /* the game keeps a pointer to its globals block here */
unsigned char data_0802638C[256];        /* filled with the ROM's own 256-byte random table */
unsigned int box[4];
void set_table(int i, int v) { data_0802638C[i] = (unsigned char)v; }
void set_state(int i, unsigned int v) { g_state[i] = v; }
unsigned int get_state(int i) { return g_state[i]; }
void set_box(int i, unsigned int v) { box[i] = v; }
unsigned int get_box(int i) { return box[i]; }
int *box_ptr(void) { return (int *)box; }
