@ fn_08000374: thumb, 80 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000374:
  0000:  b570      push {r4, r5, r6, lr}
  0002:  4684      mov ip, r0
  0004:  0015      movs r5, r2
  0006:  0943      lsrs r3, r0, #5
  0008:  2210      movs r2, #16
  000a:  201f      movs r0, #31
  000c:  000c      movs r4, r1
  000e:  0949      lsrs r1, r1, #5
  0010:  1b52      subs r2, r2, r5
  0012:  4003      ands r3, r0
  0014:  4001      ands r1, r0
  0016:  4369      muls r1, r5
  0018:  4353      muls r3, r2
  001a:  185b      adds r3, r3, r1
  001c:  091b      lsrs r3, r3, #4
  001e:  0159      lsls r1, r3, #5
  0020:  4663      mov r3, ip
  0022:  0aa6      lsrs r6, r4, #10
  0024:  0a9b      lsrs r3, r3, #10
  0026:  4003      ands r3, r0
  0028:  4006      ands r6, r0
  002a:  436e      muls r6, r5
  002c:  4353      muls r3, r2
  002e:  199b      adds r3, r3, r6
  0030:  091b      lsrs r3, r3, #4
  0032:  029b      lsls r3, r3, #10
  0034:  430b      orrs r3, r1
  0036:  4661      mov r1, ip
  0038:  4001      ands r1, r0
  003a:  4020      ands r0, r4
  003c:  4345      muls r5, r0
  003e:  434a      muls r2, r1
  0040:  1952      adds r2, r2, r5
  0042:  0912      lsrs r2, r2, #4
  0044:  4313      orrs r3, r2
  0046:  0418      lsls r0, r3, #16
  0048:  0c00      lsrs r0, r0, #16
  004a:  bc70      pop {r4, r5, r6}
  004c:  bc02      pop {r1}
  004e:  4708      bx r1
