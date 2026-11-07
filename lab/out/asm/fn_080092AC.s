fn_080092AC:
 80092ac:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 80092ae:	b570      	push	{r4, r5, r6, lr}
 80092b0:	0004      	movs	r4, r0
 80092b2:	2a00      	cmp	r2, #0
 80092b4:	d027      	beq.n	8009306 <fn_080092AC+0x5a>
 80092b6:	2120      	movs	r1, #32
 80092b8:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 80092ba:	320c      	adds	r2, #12
 80092bc:	438b      	bics	r3, r1
 80092be:	64c3      	str	r3, [r0, #76]	@ 0x4c
 80092c0:	6901      	ldr	r1, [r0, #16]
 80092c2:	ca0c      	ldmia	r2, {r2, r3}
 80092c4:	68c0      	ldr	r0, [r0, #12]
 80092c6:	f01c f9a3 	bl	8025610 <fn_08025610>
 80092ca:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 80092cc:	6ccb      	ldr	r3, [r1, #76]	@ 0x4c
 80092ce:	6220      	str	r0, [r4, #32]
 80092d0:	035b      	lsls	r3, r3, #13
 80092d2:	d41b      	bmi.n	800930c <fn_080092AC+0x60>
 80092d4:	2280      	movs	r2, #128	@ 0x80
 80092d6:	6963      	ldr	r3, [r4, #20]
 80092d8:	0352      	lsls	r2, r2, #13
 80092da:	189b      	adds	r3, r3, r2
 80092dc:	6163      	str	r3, [r4, #20]
 80092de:	2206      	movs	r2, #6
 80092e0:	0020      	movs	r0, r4
 80092e2:	f008 fe9b 	bl	801201c <fn_0801201C>
 80092e6:	6963      	ldr	r3, [r4, #20]
 80092e8:	4a0e      	ldr	r2, [pc, #56]	@ (8009324 <fn_080092AC+0x78>)
 80092ea:	189b      	adds	r3, r3, r2
 80092ec:	6163      	str	r3, [r4, #20]
 80092ee:	6bc2      	ldr	r2, [r0, #60]	@ 0x3c
 80092f0:	68c3      	ldr	r3, [r0, #12]
 80092f2:	189b      	adds	r3, r3, r2
 80092f4:	60c3      	str	r3, [r0, #12]
 80092f6:	6c02      	ldr	r2, [r0, #64]	@ 0x40
 80092f8:	6903      	ldr	r3, [r0, #16]
 80092fa:	189b      	adds	r3, r3, r2
 80092fc:	6103      	str	r3, [r0, #16]
 80092fe:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009300:	3060      	adds	r0, #96	@ 0x60
 8009302:	f00f f9af 	bl	8018664 <fn_08018664>
 8009306:	bc70      	pop	{r4, r5, r6}
 8009308:	bc01      	pop	{r0}
 800930a:	4700      	bx	r0
 800930c:	f7fd fbf8 	bl	8006b00 <fn_08006B00>
 8009310:	0005      	movs	r5, r0
 8009312:	f7fd fbf5 	bl	8006b00 <fn_08006B00>
 8009316:	6a23      	ldr	r3, [r4, #32]
 8009318:	1a28      	subs	r0, r5, r0
 800931a:	0540      	lsls	r0, r0, #21
 800931c:	181b      	adds	r3, r3, r0
 800931e:	6223      	str	r3, [r4, #32]
 8009320:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009322:	e7d7      	b.n	80092d4 <fn_080092AC+0x28>
 8009324:	fff00000 	.word	0xfff00000
