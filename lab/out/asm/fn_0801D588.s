fn_0801D588:
 801d588:	b570      	push	{r4, r5, r6, lr}
 801d58a:	2480      	movs	r4, #128	@ 0x80
 801d58c:	4d14      	ldr	r5, [pc, #80]	@ (801d5e0 <fn_0801D588+0x58>)
 801d58e:	02e4      	lsls	r4, r4, #11
 801d590:	0020      	movs	r0, r4
 801d592:	f003 ff41 	bl	8021418 <fn_08021418>
 801d596:	6028      	str	r0, [r5, #0]
 801d598:	2800      	cmp	r0, #0
 801d59a:	d01e      	beq.n	801d5da <fn_0801D588+0x52>
 801d59c:	0021      	movs	r1, r4
 801d59e:	4811      	ldr	r0, [pc, #68]	@ (801d5e4 <fn_0801D588+0x5c>)
 801d5a0:	f7e7 ff40 	bl	8005424 <fn_08005424>
 801d5a4:	200f      	movs	r0, #15
 801d5a6:	682b      	ldr	r3, [r5, #0]
 801d5a8:	78da      	ldrb	r2, [r3, #3]
 801d5aa:	4382      	bics	r2, r0
 801d5ac:	2001      	movs	r0, #1
 801d5ae:	4302      	orrs	r2, r0
 801d5b0:	70da      	strb	r2, [r3, #3]
 801d5b2:	2200      	movs	r2, #0
 801d5b4:	0019      	movs	r1, r3
 801d5b6:	619a      	str	r2, [r3, #24]
 801d5b8:	3c14      	subs	r4, #20
 801d5ba:	7dda      	ldrb	r2, [r3, #23]
 801d5bc:	0224      	lsls	r4, r4, #8
 801d5be:	0a24      	lsrs	r4, r4, #8
 801d5c0:	0612      	lsls	r2, r2, #24
 801d5c2:	3114      	adds	r1, #20
 801d5c4:	4322      	orrs	r2, r4
 801d5c6:	60d9      	str	r1, [r3, #12]
 801d5c8:	6099      	str	r1, [r3, #8]
 801d5ca:	605b      	str	r3, [r3, #4]
 801d5cc:	6119      	str	r1, [r3, #16]
 801d5ce:	61db      	str	r3, [r3, #28]
 801d5d0:	621b      	str	r3, [r3, #32]
 801d5d2:	615a      	str	r2, [r3, #20]
 801d5d4:	bc70      	pop	{r4, r5, r6}
 801d5d6:	bc01      	pop	{r0}
 801d5d8:	4700      	bx	r0
 801d5da:	3c04      	subs	r4, #4
 801d5dc:	e7d8      	b.n	801d590 <fn_0801D588+0x8>
 801d5de:	46c0      	nop			@ (mov r8, r8)
 801d5e0:	03006780 	.word	0x03006780
 801d5e4:	0814a9fc 	.word	0x0814a9fc
