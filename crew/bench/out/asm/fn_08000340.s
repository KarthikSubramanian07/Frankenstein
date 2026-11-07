@ fn_08000340: thumb, 50 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000340:
  0000:  7c82      ldrb r2, [r0, #18]
  0002:  0613      lsls r3, r2, #24
  0004:  d40a      bmi.n .L1c
  0006:  8a03      ldrh r3, [r0, #16]
  0008:  1a59      subs r1, r3, r1
  000a:  0409      lsls r1, r1, #16
  000c:  1409      asrs r1, r1, #16
  000e:  8201      strh r1, [r0, #16]
  0010:  2900      cmp r1, #0
  0012:  dd05      ble.n .L20
  0014:  2380      movs r3, #128 @ 0x80
  0016:  425b      negs r3, r3
  0018:  4313      orrs r3, r2
  001a:  7483      strb r3, [r0, #18]
.L1c:
  001c:  2000      movs r0, #0
.L1e:
  001e:  4770      bx lr
.L20:
  0020:  2300      movs r3, #0
  0022:  8203      strh r3, [r0, #16]
  0024:  2301      movs r3, #1
  0026:  431a      orrs r2, r3
  0028:  2303      movs r3, #3
  002a:  7482      strb r2, [r0, #18]
  002c:  74c3      strb r3, [r0, #19]
  002e:  2001      movs r0, #1
  0030:  e7f5      b.n .L1e
