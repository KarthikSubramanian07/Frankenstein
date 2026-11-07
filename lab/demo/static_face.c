/* Demo-only replacement for fn_0801B298 (status-bar face update), NOT a recovery.
   Display rule: code we haven't recovered yet shows as static. Every tick the face
   jumps to a random one of the 42 face frames, so it flickers like TV static.
   data_030064C4 is the global-state pointer; offsets come from the function's own asm:
     +0x5A10 face countdown, +0x5A14 face index, +0x5A24 per-tick random number (0..255),
   refreshed by the caller every tick before this function runs. */
#include <stdint.h>

#define NUM_FACES 42 /* 5 pain levels * 8 frames + god face + dead face */

extern uint8_t *data_030064C4;

void fn_0801B298(void)
{
    uint8_t *g = data_030064C4;
    uint32_t rnd = *(int32_t *)(g + 0x5A24);
    *(int32_t *)(g + 0x5A14) = (int32_t)(((rnd & 0xFF) * NUM_FACES) >> 8) /* 0..41, no divide helper */;
    *(int32_t *)(g + 0x5A10) = 0;
}
