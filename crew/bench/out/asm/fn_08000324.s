@ fn_08000324: thumb, 28 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000324:
  0000:  b510      push {r4, lr}
  0002:  000c      movs r4, r1
  0004:  2a00      cmp r2, #0
  0006:  d006      beq.n .L16
  0008:  2300      movs r3, #0
  000a:  3a01      subs r2, #1
.Lc:
  000c:  58e1      ldr r1, [r4, r3]
  000e:  50c1      str r1, [r0, r3]
  0010:  3304      adds r3, #4
  0012:  3a01      subs r2, #1
  0014:  d2fa      bcs.n .Lc
.L16:
  0016:  bc10      pop {r4}
  0018:  bc01      pop {r0}
  001a:  4700      bx r0
