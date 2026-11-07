fn_0800A37C:
 800a37c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800a37e:	4b22      	ldr	r3, [pc, #136]	@ (800a408 <fn_0800A37C+0x8c>)
 800a380:	681c      	ldr	r4, [r3, #0]
 800a382:	2388      	movs	r3, #136	@ 0x88
 800a384:	011b      	lsls	r3, r3, #4
 800a386:	58e1      	ldr	r1, [r4, r3]
 800a388:	0005      	movs	r5, r0
 800a38a:	2900      	cmp	r1, #0
 800a38c:	d036      	beq.n	800a3fc <fn_0800A37C+0x80>
 800a38e:	4b1f      	ldr	r3, [pc, #124]	@ (800a40c <fn_0800A37C+0x90>)
 800a390:	58e6      	ldr	r6, [r4, r3]
 800a392:	2001      	movs	r0, #1
 800a394:	0032      	movs	r2, r6
 800a396:	4042      	eors	r2, r0
 800a398:	50e2      	str	r2, [r4, r3]
 800a39a:	23d6      	movs	r3, #214	@ 0xd6
 800a39c:	2700      	movs	r7, #0
 800a39e:	56e2      	ldrsb	r2, [r4, r3]
 800a3a0:	0fd3      	lsrs	r3, r2, #31
 800a3a2:	4290      	cmp	r0, r2
 800a3a4:	417b      	adcs	r3, r7
 800a3a6:	061b      	lsls	r3, r3, #24
 800a3a8:	d001      	beq.n	800a3ae <fn_0800A37C+0x32>
 800a3aa:	2e01      	cmp	r6, #1
 800a3ac:	d026      	beq.n	800a3fc <fn_0800A37C+0x80>
 800a3ae:	4f18      	ldr	r7, [pc, #96]	@ (800a410 <fn_0800A37C+0x94>)
 800a3b0:	4b18      	ldr	r3, [pc, #96]	@ (800a414 <fn_0800A37C+0x98>)
 800a3b2:	59e0      	ldr	r0, [r4, r7]
 800a3b4:	58e3      	ldr	r3, [r4, r3]
 800a3b6:	0082      	lsls	r2, r0, #2
 800a3b8:	3001      	adds	r0, #1
 800a3ba:	58d6      	ldr	r6, [r2, r3]
 800a3bc:	f01b f894 	bl	80254e8 <fn_080254E8>
 800a3c0:	221c      	movs	r2, #28
 800a3c2:	51e1      	str	r1, [r4, r7]
 800a3c4:	0028      	movs	r0, r5
 800a3c6:	0031      	movs	r1, r6
 800a3c8:	f007 fe28 	bl	801201c <fn_0801201C>
 800a3cc:	0004      	movs	r4, r0
 800a3ce:	0031      	movs	r1, r6
 800a3d0:	3050      	adds	r0, #80	@ 0x50
 800a3d2:	f00e f8ed 	bl	80185b0 <fn_080185B0>
 800a3d6:	692b      	ldr	r3, [r5, #16]
 800a3d8:	6930      	ldr	r0, [r6, #16]
 800a3da:	6c21      	ldr	r1, [r4, #64]	@ 0x40
 800a3dc:	1ac0      	subs	r0, r0, r3
 800a3de:	f01b f8d7 	bl	8025590 <fn_08025590>
 800a3e2:	6ca3      	ldr	r3, [r4, #72]	@ 0x48
 800a3e4:	2104      	movs	r1, #4
 800a3e6:	5e59      	ldrsh	r1, [r3, r1]
 800a3e8:	f01b f8d2 	bl	8025590 <fn_08025590>
 800a3ec:	28ff      	cmp	r0, #255	@ 0xff
 800a3ee:	dc08      	bgt.n	800a402 <fn_0800A37C+0x86>
 800a3f0:	235c      	movs	r3, #92	@ 0x5c
 800a3f2:	215e      	movs	r1, #94	@ 0x5e
 800a3f4:	54e0      	strb	r0, [r4, r3]
 800a3f6:	2000      	movs	r0, #0
 800a3f8:	f00f ff66 	bl	801a2c8 <fn_0801A2C8>
 800a3fc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800a3fe:	bc01      	pop	{r0}
 800a400:	4700      	bx	r0
 800a402:	20ff      	movs	r0, #255	@ 0xff
 800a404:	e7f4      	b.n	800a3f0 <fn_0800A37C+0x74>
 800a406:	46c0      	nop			@ (mov r8, r8)
 800a408:	030064c4 	.word	0x030064c4
 800a40c:	00000884 	.word	0x00000884
 800a410:	00000888 	.word	0x00000888
 800a414:	00000878 	.word	0x00000878
