@ fn_08000454: thumb, 42 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000454:
  0000:  6882      ldr r2, [r0, #8]
  0002:  6803      ldr r3, [r0, #0]
  0004:  189b      adds r3, r3, r2
  0006:  6841      ldr r1, [r0, #4]
  0008:  6003      str r3, [r0, #0]
  000a:  68c3      ldr r3, [r0, #12]
  000c:  18c9      adds r1, r1, r3
  000e:  6041      str r1, [r0, #4]
  0010:  10d1      asrs r1, r2, #3
  0012:  1a52      subs r2, r2, r1
  0014:  6082      str r2, [r0, #8]
  0016:  2280      movs r2, #128 @ 0x80
  0018:  01d2      lsls r2, r2, #7
  001a:  189b      adds r3, r3, r2
  001c:  22c0      movs r2, #192 @ 0xc0
  001e:  02d2      lsls r2, r2, #11
  0020:  4293      cmp r3, r2
  0022:  dd00      ble.n .L26
  0024:  0013      movs r3, r2
.L26:
  0026:  60c3      str r3, [r0, #12]
  0028:  4770      bx lr
