fn_0801D698:
 801d698:	b510      	push	{r4, lr}
 801d69a:	2800      	cmp	r0, #0
 801d69c:	d014      	beq.n	801d6c8 <fn_0801D698+0x30>
 801d69e:	2280      	movs	r2, #128	@ 0x80
 801d6a0:	3810      	subs	r0, #16
 801d6a2:	6843      	ldr	r3, [r0, #4]
 801d6a4:	0001      	movs	r1, r0
 801d6a6:	0052      	lsls	r2, r2, #1
 801d6a8:	4293      	cmp	r3, r2
 801d6aa:	d810      	bhi.n	801d6ce <fn_0801D698+0x36>
 801d6ac:	2300      	movs	r3, #0
 801d6ae:	220f      	movs	r2, #15
 801d6b0:	6043      	str	r3, [r0, #4]
 801d6b2:	78c3      	ldrb	r3, [r0, #3]
 801d6b4:	4393      	bics	r3, r2
 801d6b6:	70c3      	strb	r3, [r0, #3]
 801d6b8:	68c3      	ldr	r3, [r0, #12]
 801d6ba:	685a      	ldr	r2, [r3, #4]
 801d6bc:	2a00      	cmp	r2, #0
 801d6be:	d01c      	beq.n	801d6fa <fn_0801D698+0x62>
 801d6c0:	6882      	ldr	r2, [r0, #8]
 801d6c2:	6853      	ldr	r3, [r2, #4]
 801d6c4:	2b00      	cmp	r3, #0
 801d6c6:	d005      	beq.n	801d6d4 <fn_0801D698+0x3c>
 801d6c8:	bc10      	pop	{r4}
 801d6ca:	bc01      	pop	{r0}
 801d6cc:	4700      	bx	r0
 801d6ce:	2200      	movs	r2, #0
 801d6d0:	601a      	str	r2, [r3, #0]
 801d6d2:	e7eb      	b.n	801d6ac <fn_0801D698+0x14>
 801d6d4:	680b      	ldr	r3, [r1, #0]
 801d6d6:	6810      	ldr	r0, [r2, #0]
 801d6d8:	18c0      	adds	r0, r0, r3
 801d6da:	0200      	lsls	r0, r0, #8
 801d6dc:	0e1b      	lsrs	r3, r3, #24
 801d6de:	0a00      	lsrs	r0, r0, #8
 801d6e0:	061b      	lsls	r3, r3, #24
 801d6e2:	4303      	orrs	r3, r0
 801d6e4:	600b      	str	r3, [r1, #0]
 801d6e6:	6893      	ldr	r3, [r2, #8]
 801d6e8:	608b      	str	r3, [r1, #8]
 801d6ea:	60d9      	str	r1, [r3, #12]
 801d6ec:	4b0e      	ldr	r3, [pc, #56]	@ (801d728 <fn_0801D698+0x90>)
 801d6ee:	681b      	ldr	r3, [r3, #0]
 801d6f0:	6918      	ldr	r0, [r3, #16]
 801d6f2:	4290      	cmp	r0, r2
 801d6f4:	d1e8      	bne.n	801d6c8 <fn_0801D698+0x30>
 801d6f6:	6119      	str	r1, [r3, #16]
 801d6f8:	e7e6      	b.n	801d6c8 <fn_0801D698+0x30>
 801d6fa:	681a      	ldr	r2, [r3, #0]
 801d6fc:	6801      	ldr	r1, [r0, #0]
 801d6fe:	1889      	adds	r1, r1, r2
 801d700:	0209      	lsls	r1, r1, #8
 801d702:	0e12      	lsrs	r2, r2, #24
 801d704:	0a09      	lsrs	r1, r1, #8
 801d706:	0612      	lsls	r2, r2, #24
 801d708:	430a      	orrs	r2, r1
 801d70a:	601a      	str	r2, [r3, #0]
 801d70c:	4906      	ldr	r1, [pc, #24]	@ (801d728 <fn_0801D698+0x90>)
 801d70e:	6809      	ldr	r1, [r1, #0]
 801d710:	6882      	ldr	r2, [r0, #8]
 801d712:	690c      	ldr	r4, [r1, #16]
 801d714:	609a      	str	r2, [r3, #8]
 801d716:	60d3      	str	r3, [r2, #12]
 801d718:	4284      	cmp	r4, r0
 801d71a:	d001      	beq.n	801d720 <fn_0801D698+0x88>
 801d71c:	0019      	movs	r1, r3
 801d71e:	e7d0      	b.n	801d6c2 <fn_0801D698+0x2a>
 801d720:	610b      	str	r3, [r1, #16]
 801d722:	0019      	movs	r1, r3
 801d724:	e7cd      	b.n	801d6c2 <fn_0801D698+0x2a>
 801d726:	46c0      	nop			@ (mov r8, r8)
 801d728:	03006780 	.word	0x03006780
