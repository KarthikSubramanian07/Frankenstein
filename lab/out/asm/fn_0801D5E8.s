fn_0801D5E8:
 801d5e8:	b510      	push	{r4, lr}
 801d5ea:	2800      	cmp	r0, #0
 801d5ec:	d014      	beq.n	801d618 <fn_0801D5E8+0x30>
 801d5ee:	2280      	movs	r2, #128	@ 0x80
 801d5f0:	3810      	subs	r0, #16
 801d5f2:	6843      	ldr	r3, [r0, #4]
 801d5f4:	0001      	movs	r1, r0
 801d5f6:	0052      	lsls	r2, r2, #1
 801d5f8:	4293      	cmp	r3, r2
 801d5fa:	d810      	bhi.n	801d61e <fn_0801D5E8+0x36>
 801d5fc:	2300      	movs	r3, #0
 801d5fe:	220f      	movs	r2, #15
 801d600:	6043      	str	r3, [r0, #4]
 801d602:	78c3      	ldrb	r3, [r0, #3]
 801d604:	4393      	bics	r3, r2
 801d606:	70c3      	strb	r3, [r0, #3]
 801d608:	68c3      	ldr	r3, [r0, #12]
 801d60a:	685a      	ldr	r2, [r3, #4]
 801d60c:	2a00      	cmp	r2, #0
 801d60e:	d01c      	beq.n	801d64a <fn_0801D5E8+0x62>
 801d610:	6882      	ldr	r2, [r0, #8]
 801d612:	6853      	ldr	r3, [r2, #4]
 801d614:	2b00      	cmp	r3, #0
 801d616:	d005      	beq.n	801d624 <fn_0801D5E8+0x3c>
 801d618:	bc10      	pop	{r4}
 801d61a:	bc01      	pop	{r0}
 801d61c:	4700      	bx	r0
 801d61e:	2200      	movs	r2, #0
 801d620:	601a      	str	r2, [r3, #0]
 801d622:	e7eb      	b.n	801d5fc <fn_0801D5E8+0x14>
 801d624:	680b      	ldr	r3, [r1, #0]
 801d626:	6810      	ldr	r0, [r2, #0]
 801d628:	18c0      	adds	r0, r0, r3
 801d62a:	0200      	lsls	r0, r0, #8
 801d62c:	0e1b      	lsrs	r3, r3, #24
 801d62e:	0a00      	lsrs	r0, r0, #8
 801d630:	061b      	lsls	r3, r3, #24
 801d632:	4303      	orrs	r3, r0
 801d634:	600b      	str	r3, [r1, #0]
 801d636:	6893      	ldr	r3, [r2, #8]
 801d638:	608b      	str	r3, [r1, #8]
 801d63a:	60d9      	str	r1, [r3, #12]
 801d63c:	4b0e      	ldr	r3, [pc, #56]	@ (801d678 <fn_0801D5E8+0x90>)
 801d63e:	681b      	ldr	r3, [r3, #0]
 801d640:	6918      	ldr	r0, [r3, #16]
 801d642:	4290      	cmp	r0, r2
 801d644:	d1e8      	bne.n	801d618 <fn_0801D5E8+0x30>
 801d646:	6119      	str	r1, [r3, #16]
 801d648:	e7e6      	b.n	801d618 <fn_0801D5E8+0x30>
 801d64a:	681a      	ldr	r2, [r3, #0]
 801d64c:	6801      	ldr	r1, [r0, #0]
 801d64e:	1889      	adds	r1, r1, r2
 801d650:	0209      	lsls	r1, r1, #8
 801d652:	0e12      	lsrs	r2, r2, #24
 801d654:	0a09      	lsrs	r1, r1, #8
 801d656:	0612      	lsls	r2, r2, #24
 801d658:	430a      	orrs	r2, r1
 801d65a:	601a      	str	r2, [r3, #0]
 801d65c:	4906      	ldr	r1, [pc, #24]	@ (801d678 <fn_0801D5E8+0x90>)
 801d65e:	6809      	ldr	r1, [r1, #0]
 801d660:	6882      	ldr	r2, [r0, #8]
 801d662:	690c      	ldr	r4, [r1, #16]
 801d664:	609a      	str	r2, [r3, #8]
 801d666:	60d3      	str	r3, [r2, #12]
 801d668:	4284      	cmp	r4, r0
 801d66a:	d001      	beq.n	801d670 <fn_0801D5E8+0x88>
 801d66c:	0019      	movs	r1, r3
 801d66e:	e7d0      	b.n	801d612 <fn_0801D5E8+0x2a>
 801d670:	610b      	str	r3, [r1, #16]
 801d672:	0019      	movs	r1, r3
 801d674:	e7cd      	b.n	801d612 <fn_0801D5E8+0x2a>
 801d676:	46c0      	nop			@ (mov r8, r8)
 801d678:	03006780 	.word	0x03006780
