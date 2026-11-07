@ fn_080004C0: thumb, 34 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_080004C0:
  0000:  000a      movs r2, r1
  0002:  0fcb      lsrs r3, r1, #31
  0004:  185b      adds r3, r3, r1
  0006:  b510      push {r4, lr}
  0008:  105b      asrs r3, r3, #1
  000a:  4042      eors r2, r0
  000c:  d405      bmi.n .L1a
  000e:  1818      adds r0, r3, r0
  0010:  f7fffffe  bl __aeabi_idiv
.L14:
  0014:  bc10      pop {r4}
  0016:  bc02      pop {r1}
  0018:  4708      bx r1
.L1a:
  001a:  1ac0      subs r0, r0, r3
  001c:  f7fffffe  bl __aeabi_idiv
  0020:  e7f8      b.n .L14
