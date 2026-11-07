fn_08009068:
 8009068:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 800906a:	b570      	push	{r4, r5, r6, lr}
 800906c:	0004      	movs	r4, r0
 800906e:	2a00      	cmp	r2, #0
 8009070:	d025      	beq.n	80090be <fn_08009068+0x56>
 8009072:	2120      	movs	r1, #32
 8009074:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8009076:	320c      	adds	r2, #12
 8009078:	438b      	bics	r3, r1
 800907a:	64c3      	str	r3, [r0, #76]	@ 0x4c
 800907c:	6901      	ldr	r1, [r0, #16]
 800907e:	ca0c      	ldmia	r2, {r2, r3}
 8009080:	68c0      	ldr	r0, [r0, #12]
 8009082:	f01c fac5 	bl	8025610 <fn_08025610>
 8009086:	6d25      	ldr	r5, [r4, #80]	@ 0x50
 8009088:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 800908a:	6220      	str	r0, [r4, #32]
 800908c:	035b      	lsls	r3, r3, #13
 800908e:	d419      	bmi.n	80090c4 <fn_08009068+0x5c>
 8009090:	6923      	ldr	r3, [r4, #16]
 8009092:	6929      	ldr	r1, [r5, #16]
 8009094:	68e8      	ldr	r0, [r5, #12]
 8009096:	1ac9      	subs	r1, r1, r3
 8009098:	68e3      	ldr	r3, [r4, #12]
 800909a:	1ac0      	subs	r0, r0, r3
 800909c:	f006 feae 	bl	800fdfc <fn_0800FDFC>
 80090a0:	4b19      	ldr	r3, [pc, #100]	@ (8009108 <fn_08009068+0xa0>)
 80090a2:	681a      	ldr	r2, [r3, #0]
 80090a4:	235a      	movs	r3, #90	@ 0x5a
 80090a6:	5ce9      	ldrb	r1, [r5, r3]
 80090a8:	23ea      	movs	r3, #234	@ 0xea
 80090aa:	00db      	lsls	r3, r3, #3
 80090ac:	58d3      	ldr	r3, [r2, r3]
 80090ae:	225c      	movs	r2, #92	@ 0x5c
 80090b0:	434a      	muls	r2, r1
 80090b2:	189b      	adds	r3, r3, r2
 80090b4:	6c1b      	ldr	r3, [r3, #64]	@ 0x40
 80090b6:	4a15      	ldr	r2, [pc, #84]	@ (800910c <fn_08009068+0xa4>)
 80090b8:	189b      	adds	r3, r3, r2
 80090ba:	4283      	cmp	r3, r0
 80090bc:	da10      	bge.n	80090e0 <fn_08009068+0x78>
 80090be:	bc70      	pop	{r4, r5, r6}
 80090c0:	bc01      	pop	{r0}
 80090c2:	4700      	bx	r0
 80090c4:	f7fd fd1c 	bl	8006b00 <fn_08006B00>
 80090c8:	0005      	movs	r5, r0
 80090ca:	f7fd fd19 	bl	8006b00 <fn_08006B00>
 80090ce:	6a23      	ldr	r3, [r4, #32]
 80090d0:	1a2d      	subs	r5, r5, r0
 80090d2:	056d      	lsls	r5, r5, #21
 80090d4:	195b      	adds	r3, r3, r5
 80090d6:	6d25      	ldr	r5, [r4, #80]	@ 0x50
 80090d8:	6223      	str	r3, [r4, #32]
 80090da:	2d00      	cmp	r5, #0
 80090dc:	d0ef      	beq.n	80090be <fn_08009068+0x56>
 80090de:	e7d7      	b.n	8009090 <fn_08009068+0x28>
 80090e0:	0029      	movs	r1, r5
 80090e2:	0020      	movs	r0, r4
 80090e4:	f00b f92c 	bl	8014340 <fn_08014340>
 80090e8:	2800      	cmp	r0, #0
 80090ea:	d0e8      	beq.n	80090be <fn_08009068+0x56>
 80090ec:	f7fd fd08 	bl	8006b00 <fn_08006B00>
 80090f0:	210a      	movs	r1, #10
 80090f2:	f01c fa51 	bl	8025598 <fn_08025598>
 80090f6:	3101      	adds	r1, #1
 80090f8:	008b      	lsls	r3, r1, #2
 80090fa:	0022      	movs	r2, r4
 80090fc:	0021      	movs	r1, r4
 80090fe:	6d20      	ldr	r0, [r4, #80]	@ 0x50
 8009100:	f004 fc5c 	bl	800d9bc <fn_0800D9BC>
 8009104:	e7db      	b.n	80090be <fn_08009068+0x56>
 8009106:	46c0      	nop			@ (mov r8, r8)
 8009108:	030064c4 	.word	0x030064c4
 800910c:	002bffff 	.word	0x002bffff
