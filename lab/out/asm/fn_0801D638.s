fn_0801D638:
 801d638:	b570      	push	{r4, r5, r6, lr}
 801d63a:	2480      	movs	r4, #128	@ 0x80
 801d63c:	4d14      	ldr	r5, [pc, #80]	@ (801d690 <fn_0801D638+0x58>)
 801d63e:	02e4      	lsls	r4, r4, #11
 801d640:	0020      	movs	r0, r4
 801d642:	f003 ff41 	bl	80214c8 <fn_080214C8>
 801d646:	6028      	str	r0, [r5, #0]
 801d648:	2800      	cmp	r0, #0
 801d64a:	d01e      	beq.n	801d68a <fn_0801D638+0x52>
 801d64c:	0021      	movs	r1, r4
 801d64e:	4811      	ldr	r0, [pc, #68]	@ (801d694 <fn_0801D638+0x5c>)
 801d650:	f7e7 fee8 	bl	8005424 <fn_08005424>
 801d654:	200f      	movs	r0, #15
 801d656:	682b      	ldr	r3, [r5, #0]
 801d658:	78da      	ldrb	r2, [r3, #3]
 801d65a:	4382      	bics	r2, r0
 801d65c:	2001      	movs	r0, #1
 801d65e:	4302      	orrs	r2, r0
 801d660:	70da      	strb	r2, [r3, #3]
 801d662:	2200      	movs	r2, #0
 801d664:	0019      	movs	r1, r3
 801d666:	619a      	str	r2, [r3, #24]
 801d668:	3c14      	subs	r4, #20
 801d66a:	7dda      	ldrb	r2, [r3, #23]
 801d66c:	0224      	lsls	r4, r4, #8
 801d66e:	0a24      	lsrs	r4, r4, #8
 801d670:	0612      	lsls	r2, r2, #24
 801d672:	3114      	adds	r1, #20
 801d674:	4322      	orrs	r2, r4
 801d676:	60d9      	str	r1, [r3, #12]
 801d678:	6099      	str	r1, [r3, #8]
 801d67a:	605b      	str	r3, [r3, #4]
 801d67c:	6119      	str	r1, [r3, #16]
 801d67e:	61db      	str	r3, [r3, #28]
 801d680:	621b      	str	r3, [r3, #32]
 801d682:	615a      	str	r2, [r3, #20]
 801d684:	bc70      	pop	{r4, r5, r6}
 801d686:	bc01      	pop	{r0}
 801d688:	4700      	bx	r0
 801d68a:	3c04      	subs	r4, #4
 801d68c:	e7d8      	b.n	801d640 <fn_0801D638+0x8>
 801d68e:	46c0      	nop			@ (mov r8, r8)
 801d690:	03006780 	.word	0x03006780
 801d694:	0814aad0 	.word	0x0814aad0
