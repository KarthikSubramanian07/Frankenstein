fn_0800E340:
 800e340:	2307      	movs	r3, #7
 800e342:	b570      	push	{r4, r5, r6, lr}
 800e344:	8b02      	ldrh	r2, [r0, #24]
 800e346:	0004      	movs	r4, r0
 800e348:	4013      	ands	r3, r2
 800e34a:	2b04      	cmp	r3, #4
 800e34c:	d008      	beq.n	800e360 <fn_0800E340+0x20>
 800e34e:	4d18      	ldr	r5, [pc, #96]	@ (800e3b0 <fn_0800E340+0x70>)
 800e350:	4b18      	ldr	r3, [pc, #96]	@ (800e3b4 <fn_0800E340+0x74>)
 800e352:	6828      	ldr	r0, [r5, #0]
 800e354:	58c2      	ldr	r2, [r0, r3]
 800e356:	8a63      	ldrh	r3, [r4, #18]
 800e358:	6891      	ldr	r1, [r2, #8]
 800e35a:	041b      	lsls	r3, r3, #16
 800e35c:	4299      	cmp	r1, r3
 800e35e:	dd03      	ble.n	800e368 <fn_0800E340+0x28>
 800e360:	2001      	movs	r0, #1
 800e362:	bc70      	pop	{r4, r5, r6}
 800e364:	bc02      	pop	{r1}
 800e366:	4708      	bx	r1
 800e368:	8a23      	ldrh	r3, [r4, #16]
 800e36a:	68d1      	ldr	r1, [r2, #12]
 800e36c:	041b      	lsls	r3, r3, #16
 800e36e:	4299      	cmp	r1, r3
 800e370:	dbf6      	blt.n	800e360 <fn_0800E340+0x20>
 800e372:	89e3      	ldrh	r3, [r4, #14]
 800e374:	6811      	ldr	r1, [r2, #0]
 800e376:	041b      	lsls	r3, r3, #16
 800e378:	4299      	cmp	r1, r3
 800e37a:	dbf1      	blt.n	800e360 <fn_0800E340+0x20>
 800e37c:	89a3      	ldrh	r3, [r4, #12]
 800e37e:	6852      	ldr	r2, [r2, #4]
 800e380:	041b      	lsls	r3, r3, #16
 800e382:	429a      	cmp	r2, r3
 800e384:	dcec      	bgt.n	800e360 <fn_0800E340+0x20>
 800e386:	4b0c      	ldr	r3, [pc, #48]	@ (800e3b8 <fn_0800E340+0x78>)
 800e388:	58c1      	ldr	r1, [r0, r3]
 800e38a:	4b0c      	ldr	r3, [pc, #48]	@ (800e3bc <fn_0800E340+0x7c>)
 800e38c:	0022      	movs	r2, r4
 800e38e:	58c0      	ldr	r0, [r0, r3]
 800e390:	f001 fd44 	bl	800fe1c <fn_0800FE1C>
 800e394:	682b      	ldr	r3, [r5, #0]
 800e396:	4a0a      	ldr	r2, [pc, #40]	@ (800e3c0 <fn_0800E340+0x80>)
 800e398:	5899      	ldr	r1, [r3, r2]
 800e39a:	3a04      	subs	r2, #4
 800e39c:	0006      	movs	r6, r0
 800e39e:	5898      	ldr	r0, [r3, r2]
 800e3a0:	0022      	movs	r2, r4
 800e3a2:	f001 fd3b 	bl	800fe1c <fn_0800FE1C>
 800e3a6:	1a30      	subs	r0, r6, r0
 800e3a8:	4243      	negs	r3, r0
 800e3aa:	4158      	adcs	r0, r3
 800e3ac:	e7d9      	b.n	800e362 <fn_0800E340+0x22>
 800e3ae:	46c0      	nop			@ (mov r8, r8)
 800e3b0:	030064c4 	.word	0x030064c4	@ data_030064C4
 800e3b4:	000008a8 	.word	0x000008a8
 800e3b8:	0000089c 	.word	0x0000089c
 800e3bc:	00000898 	.word	0x00000898
 800e3c0:	000008a4 	.word	0x000008a4
