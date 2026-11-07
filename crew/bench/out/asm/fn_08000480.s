@ fn_08000480: thumb, 24 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000480:
  0000:  000a      movs r2, r1
  0002:  b510      push {r4, lr}
  0004:  17c1      asrs r1, r0, #31
  0006:  17d3      asrs r3, r2, #31
  0008:  f7fffffe  bl __aeabi_lmul
  000c:  0409      lsls r1, r1, #16
  000e:  0c00      lsrs r0, r0, #16
  0010:  1808      adds r0, r1, r0
  0012:  bc10      pop {r4}
  0014:  bc02      pop {r1}
  0016:  4708      bx r1
