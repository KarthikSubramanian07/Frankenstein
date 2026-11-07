@ fn_08000200: thumb, 46 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000200:
  0000:  b570      push {r4, r5, r6, lr}
  0002:  000e      movs r6, r1
  0004:  0011      movs r1, r2
  0006:  001d      movs r5, r3
  0008:  f7fffffe  bl fn_080002F8
  000c:  0029      movs r1, r5
  000e:  0004      movs r4, r0
  0010:  0030      movs r0, r6
  0012:  f7fffffe  bl fn_080002F8
  0016:  4284      cmp r4, r0
  0018:  da02      bge.n .L20
  001a:  0003      movs r3, r0
  001c:  0020      movs r0, r4
  001e:  001c      movs r4, r3
.L20:
  0020:  1043      asrs r3, r0, #1
  0022:  191b      adds r3, r3, r4
  0024:  10c0      asrs r0, r0, #3
  0026:  1a18      subs r0, r3, r0
  0028:  bc70      pop {r4, r5, r6}
  002a:  bc02      pop {r1}
  002c:  4708      bx r1
