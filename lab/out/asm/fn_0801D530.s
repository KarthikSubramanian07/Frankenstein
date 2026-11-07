fn_0801D530:
 801d530:	b570      	push	{r4, r5, r6, lr}
 801d532:	4d15      	ldr	r5, [pc, #84]	@ (801d588 <fn_0801D530+0x58>)
 801d534:	b082      	sub	sp, #8
 801d536:	0001      	movs	r1, r0
 801d538:	0004      	movs	r4, r0
 801d53a:	2208      	movs	r2, #8
 801d53c:	4668      	mov	r0, sp
 801d53e:	68ae      	ldr	r6, [r5, #8]
 801d540:	f003 ff8e 	bl	8021460 <fn_08021460>
 801d544:	686b      	ldr	r3, [r5, #4]
 801d546:	1e58      	subs	r0, r3, #1
 801d548:	d413      	bmi.n	801d572 <fn_0801D530+0x42>
 801d54a:	9a01      	ldr	r2, [sp, #4]
 801d54c:	011b      	lsls	r3, r3, #4
 801d54e:	3b08      	subs	r3, #8
 801d550:	1976      	adds	r6, r6, r5
 801d552:	4694      	mov	ip, r2
 801d554:	9900      	ldr	r1, [sp, #0]
 801d556:	199b      	adds	r3, r3, r6
 801d558:	e002      	b.n	801d560 <fn_0801D530+0x30>
 801d55a:	3b10      	subs	r3, #16
 801d55c:	3801      	subs	r0, #1
 801d55e:	d308      	bcc.n	801d572 <fn_0801D530+0x42>
 801d560:	681a      	ldr	r2, [r3, #0]
 801d562:	428a      	cmp	r2, r1
 801d564:	d1f9      	bne.n	801d55a <fn_0801D530+0x2a>
 801d566:	685a      	ldr	r2, [r3, #4]
 801d568:	4562      	cmp	r2, ip
 801d56a:	d008      	beq.n	801d57e <fn_0801D530+0x4e>
 801d56c:	3b10      	subs	r3, #16
 801d56e:	3801      	subs	r0, #1
 801d570:	d2f6      	bcs.n	801d560 <fn_0801D530+0x30>
 801d572:	4806      	ldr	r0, [pc, #24]	@ (801d58c <fn_0801D530+0x5c>)
 801d574:	0021      	movs	r1, r4
 801d576:	f7e3 f817 	bl	80005a8 <fn_080005A8>
 801d57a:	2001      	movs	r0, #1
 801d57c:	4240      	negs	r0, r0
 801d57e:	b002      	add	sp, #8
 801d580:	bc70      	pop	{r4, r5, r6}
 801d582:	bc02      	pop	{r1}
 801d584:	4708      	bx	r1
 801d586:	46c0      	nop			@ (mov r8, r8)
 801d588:	08156c40 	.word	0x08156c40
 801d58c:	0814aa64 	.word	0x0814aa64
