fn_0801D284:
 801d284:	4b11      	ldr	r3, [pc, #68]	@ (801d2cc <fn_0801D284+0x48>)
 801d286:	4a12      	ldr	r2, [pc, #72]	@ (801d2d0 <fn_0801D284+0x4c>)
 801d288:	681b      	ldr	r3, [r3, #0]
 801d28a:	5098      	str	r0, [r3, r2]
 801d28c:	2200      	movs	r2, #0
 801d28e:	4911      	ldr	r1, [pc, #68]	@ (801d2d4 <fn_0801D284+0x50>)
 801d290:	505a      	str	r2, [r3, r1]
 801d292:	4911      	ldr	r1, [pc, #68]	@ (801d2d8 <fn_0801D284+0x54>)
 801d294:	505a      	str	r2, [r3, r1]
 801d296:	4911      	ldr	r1, [pc, #68]	@ (801d2dc <fn_0801D284+0x58>)
 801d298:	505a      	str	r2, [r3, r1]
 801d29a:	0001      	movs	r1, r0
 801d29c:	4a10      	ldr	r2, [pc, #64]	@ (801d2e0 <fn_0801D284+0x5c>)
 801d29e:	3124      	adds	r1, #36	@ 0x24
 801d2a0:	5099      	str	r1, [r3, r2]
 801d2a2:	6902      	ldr	r2, [r0, #16]
 801d2a4:	2a00      	cmp	r2, #0
 801d2a6:	d101      	bne.n	801d2ac <fn_0801D284+0x28>
 801d2a8:	3201      	adds	r2, #1
 801d2aa:	6102      	str	r2, [r0, #16]
 801d2ac:	6942      	ldr	r2, [r0, #20]
 801d2ae:	2a00      	cmp	r2, #0
 801d2b0:	d101      	bne.n	801d2b6 <fn_0801D284+0x32>
 801d2b2:	3201      	adds	r2, #1
 801d2b4:	6142      	str	r2, [r0, #20]
 801d2b6:	2294      	movs	r2, #148	@ 0x94
 801d2b8:	5c9b      	ldrb	r3, [r3, r2]
 801d2ba:	2b03      	cmp	r3, #3
 801d2bc:	d004      	beq.n	801d2c8 <fn_0801D284+0x44>
 801d2be:	6803      	ldr	r3, [r0, #0]
 801d2c0:	2b02      	cmp	r3, #2
 801d2c2:	dd01      	ble.n	801d2c8 <fn_0801D284+0x44>
 801d2c4:	3b03      	subs	r3, #3
 801d2c6:	6003      	str	r3, [r0, #0]
 801d2c8:	4770      	bx	lr
 801d2ca:	46c0      	nop			@ (mov r8, r8)
 801d2cc:	030064c4 	.word	0x030064c4
 801d2d0:	00005a40 	.word	0x00005a40
 801d2d4:	00005a38 	.word	0x00005a38
 801d2d8:	00005a4c 	.word	0x00005a4c
 801d2dc:	00005a48 	.word	0x00005a48
 801d2e0:	00005a44 	.word	0x00005a44
