#include "bench.h"

/* Returns the action code for a key on the pause menu. */
s32 menu_input(u32 key)
{
    switch (key) {
    case 0:
        if (menu_cursor > 0)
            menu_cursor--;
        return 0;
    case 1:
        if (menu_cursor < 4)
            menu_cursor++;
        return 0;
    case 2:
        return menu_cursor + 1;
    case 3:
        sound_on ^= 1;
        return 7;
    case 6:
        return -1;
    default:
        return 0;
    }
}
