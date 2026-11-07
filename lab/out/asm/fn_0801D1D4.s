fn_0801D1D4:
 801d1d4:	4b11      	ldr	r3, [pc, #68]	@ (801d21c <fn_0801D1D4+0x48>)
 801d1d6:	4a12      	ldr	r2, [pc, #72]	@ (801d220 <fn_0801D1D4+0x4c>)
 801d1d8:	681b      	ldr	r3, [r3, #0]
 801d1da:	5098      	str	r0, [r3, r2]
 801d1dc:	2200      	movs	r2, #0
 801d1de:	4911      	ldr	r1, [pc, #68]	@ (801d224 <fn_0801D1D4+0x50>)
 801d1e0:	505a      	str	r2, [r3, r1]
 801d1e2:	4911      	ldr	r1, [pc, #68]	@ (801d228 <fn_0801D1D4+0x54>)
 801d1e4:	505a      	str	r2, [r3, r1]
 801d1e6:	4911      	ldr	r1, [pc, #68]	@ (801d22c <fn_0801D1D4+0x58>)
 801d1e8:	505a      	str	r2, [r3, r1]
 801d1ea:	0001      	movs	r1, r0
 801d1ec:	4a10      	ldr	r2, [pc, #64]	@ (801d230 <fn_0801D1D4+0x5c>)
 801d1ee:	3124      	adds	r1, #36	@ 0x24
 801d1f0:	5099      	str	r1, [r3, r2]
 801d1f2:	6902      	ldr	r2, [r0, #16]
 801d1f4:	2a00      	cmp	r2, #0
 801d1f6:	d101      	bne.n	801d1fc <fn_0801D1D4+0x28>
 801d1f8:	3201      	adds	r2, #1
 801d1fa:	6102      	str	r2, [r0, #16]
 801d1fc:	6942      	ldr	r2, [r0, #20]
 801d1fe:	2a00      	cmp	r2, #0
 801d200:	d101      	bne.n	801d206 <fn_0801D1D4+0x32>
 801d202:	3201      	adds	r2, #1
 801d204:	6142      	str	r2, [r0, #20]
 801d206:	2294      	movs	r2, #148	@ 0x94
 801d208:	5c9b      	ldrb	r3, [r3, r2]
 801d20a:	2b03      	cmp	r3, #3
 801d20c:	d004      	beq.n	801d218 <fn_0801D1D4+0x44>
 801d20e:	6803      	ldr	r3, [r0, #0]
 801d210:	2b02      	cmp	r3, #2
 801d212:	dd01      	ble.n	801d218 <fn_0801D1D4+0x44>
 801d214:	3b03      	subs	r3, #3
 801d216:	6003      	str	r3, [r0, #0]
 801d218:	4770      	bx	lr
 801d21a:	46c0      	nop			@ (mov r8, r8)
 801d21c:	030064c4 	.word	0x030064c4	@ data_030064C4
 801d220:	00005a40 	.word	0x00005a40
 801d224:	00005a38 	.word	0x00005a38
 801d228:	00005a4c 	.word	0x00005a4c
 801d22c:	00005a48 	.word	0x00005a48
 801d230:	00005a44 	.word	0x00005a44
