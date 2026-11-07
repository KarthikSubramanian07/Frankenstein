fn_0801440C:
 801440c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801440e:	4645      	mov	r5, r8
 8014410:	46de      	mov	lr, fp
 8014412:	4657      	mov	r7, sl
 8014414:	464e      	mov	r6, r9
 8014416:	22e9      	movs	r2, #233	@ 0xe9
 8014418:	b5e0      	push	{r5, r6, r7, lr}
 801441a:	4b36      	ldr	r3, [pc, #216]	@ (80144f4 <fn_0801440C+0xe8>)
 801441c:	469a      	mov	sl, r3
 801441e:	681b      	ldr	r3, [r3, #0]
 8014420:	4e35      	ldr	r6, [pc, #212]	@ (80144f8 <fn_0801440C+0xec>)
 8014422:	0112      	lsls	r2, r2, #4
 8014424:	189a      	adds	r2, r3, r2
 8014426:	b083      	sub	sp, #12
 8014428:	519a      	str	r2, [r3, r6]
 801442a:	4b34      	ldr	r3, [pc, #208]	@ (80144fc <fn_0801440C+0xf0>)
 801442c:	469b      	mov	fp, r3
 801442e:	1c5c      	adds	r4, r3, #1
 8014430:	2300      	movs	r3, #0
 8014432:	4698      	mov	r8, r3
 8014434:	4b32      	ldr	r3, [pc, #200]	@ (8014500 <fn_0801440C+0xf4>)
 8014436:	2500      	movs	r5, #0
 8014438:	9301      	str	r3, [sp, #4]
 801443a:	e033      	b.n	80144a4 <fn_0801440C+0x98>
 801443c:	f008 fffa 	bl	801d434 <fn_0801D434>
 8014440:	3001      	adds	r0, #1
 8014442:	d026      	beq.n	8014492 <fn_0801440C+0x86>
 8014444:	0020      	movs	r0, r4
 8014446:	f004 fde5 	bl	8019014 <fn_08019014>
 801444a:	4653      	mov	r3, sl
 801444c:	681b      	ldr	r3, [r3, #0]
 801444e:	599b      	ldr	r3, [r3, r6]
 8014450:	8058      	strh	r0, [r3, #2]
 8014452:	4648      	mov	r0, r9
 8014454:	f004 fdde 	bl	8019014 <fn_08019014>
 8014458:	4653      	mov	r3, sl
 801445a:	6819      	ldr	r1, [r3, #0]
 801445c:	598a      	ldr	r2, [r1, r6]
 801445e:	0003      	movs	r3, r0
 8014460:	8090      	strh	r0, [r2, #4]
 8014462:	4640      	mov	r0, r8
 8014464:	1e47      	subs	r7, r0, #1
 8014466:	41b8      	sbcs	r0, r7
 8014468:	7010      	strb	r0, [r2, #0]
 801446a:	8850      	ldrh	r0, [r2, #2]
 801446c:	1ac0      	subs	r0, r0, r3
 801446e:	3001      	adds	r0, #1
 8014470:	0400      	lsls	r0, r0, #16
 8014472:	1400      	asrs	r0, r0, #16
 8014474:	80d0      	strh	r0, [r2, #6]
 8014476:	2801      	cmp	r0, #1
 8014478:	dd2a      	ble.n	80144d0 <fn_0801440C+0xc4>
 801447a:	006b      	lsls	r3, r5, #1
 801447c:	195b      	adds	r3, r3, r5
 801447e:	00db      	lsls	r3, r3, #3
 8014480:	1b5b      	subs	r3, r3, r5
 8014482:	445b      	add	r3, fp
 8014484:	7cd8      	ldrb	r0, [r3, #19]
 8014486:	7d1b      	ldrb	r3, [r3, #20]
 8014488:	021b      	lsls	r3, r3, #8
 801448a:	4303      	orrs	r3, r0
 801448c:	8113      	strh	r3, [r2, #8]
 801448e:	320a      	adds	r2, #10
 8014490:	518a      	str	r2, [r1, r6]
 8014492:	3417      	adds	r4, #23
 8014494:	1e63      	subs	r3, r4, #1
 8014496:	781b      	ldrb	r3, [r3, #0]
 8014498:	061b      	lsls	r3, r3, #24
 801449a:	161b      	asrs	r3, r3, #24
 801449c:	4698      	mov	r8, r3
 801449e:	3501      	adds	r5, #1
 80144a0:	3301      	adds	r3, #1
 80144a2:	d01e      	beq.n	80144e2 <fn_0801440C+0xd6>
 80144a4:	2309      	movs	r3, #9
 80144a6:	4699      	mov	r9, r3
 80144a8:	4643      	mov	r3, r8
 80144aa:	44a1      	add	r9, r4
 80144ac:	4648      	mov	r0, r9
 80144ae:	2b00      	cmp	r3, #0
 80144b0:	d0c4      	beq.n	801443c <fn_0801440C+0x30>
 80144b2:	f004 fdc9 	bl	8019048 <fn_08019048>
 80144b6:	3001      	adds	r0, #1
 80144b8:	d0eb      	beq.n	8014492 <fn_0801440C+0x86>
 80144ba:	0020      	movs	r0, r4
 80144bc:	f004 fdc4 	bl	8019048 <fn_08019048>
 80144c0:	4653      	mov	r3, sl
 80144c2:	681b      	ldr	r3, [r3, #0]
 80144c4:	599b      	ldr	r3, [r3, r6]
 80144c6:	8058      	strh	r0, [r3, #2]
 80144c8:	4648      	mov	r0, r9
 80144ca:	f004 fdbd 	bl	8019048 <fn_08019048>
 80144ce:	e7c3      	b.n	8014458 <fn_0801440C+0x4c>
 80144d0:	0022      	movs	r2, r4
 80144d2:	4649      	mov	r1, r9
 80144d4:	9801      	ldr	r0, [sp, #4]
 80144d6:	f7ec f867 	bl	80005a8 <fn_080005A8>
 80144da:	4653      	mov	r3, sl
 80144dc:	6819      	ldr	r1, [r3, #0]
 80144de:	598a      	ldr	r2, [r1, r6]
 80144e0:	e7cb      	b.n	801447a <fn_0801440C+0x6e>
 80144e2:	b003      	add	sp, #12
 80144e4:	bcf0      	pop	{r4, r5, r6, r7}
 80144e6:	46bb      	mov	fp, r7
 80144e8:	46b2      	mov	sl, r6
 80144ea:	46a9      	mov	r9, r5
 80144ec:	46a0      	mov	r8, r4
 80144ee:	bcf0      	pop	{r4, r5, r6, r7}
 80144f0:	bc01      	pop	{r0}
 80144f2:	4700      	bx	r0
 80144f4:	030064c4 	.word	0x030064c4	@ data_030064C4
 80144f8:	00000e8c 	.word	0x00000e8c
 80144fc:	0812ec8c 	.word	0x0812ec8c	@ data_0812EC8C
 8014500:	0814a0c4 	.word	0x0814a0c4
