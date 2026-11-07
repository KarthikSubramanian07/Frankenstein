@ fn_08000498: thumb, 38 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000498:
  0000:  22ef      movs r2, #239 @ 0xef
  0002:  b510      push {r4, lr}
  0004:  2100      movs r1, #0
  0006:  0004      movs r4, r0
  0008:  0412      lsls r2, r2, #16
  000a:  6800      ldr r0, [r0, #0]
  000c:  f7fffffe  bl fn_08000250
  0010:  229f      movs r2, #159 @ 0x9f
  0012:  6020      str r0, [r4, #0]
  0014:  2100      movs r1, #0
  0016:  6860      ldr r0, [r4, #4]
  0018:  0412      lsls r2, r2, #16
  001a:  f7fffffe  bl fn_08000250
  001e:  6060      str r0, [r4, #4]
  0020:  bc10      pop {r4}
  0022:  bc01      pop {r0}
  0024:  4700      bx r0
