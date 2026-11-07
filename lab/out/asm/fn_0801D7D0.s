fn_0801D7D0:
 801d7d0:	b5f0      	push	{r4, r5, r6, r7, lr}
 801d7d2:	46c6      	mov	lr, r8
 801d7d4:	000e      	movs	r6, r1
 801d7d6:	0005      	movs	r5, r0
 801d7d8:	0011      	movs	r1, r2
 801d7da:	0030      	movs	r0, r6
 801d7dc:	001a      	movs	r2, r3
 801d7de:	b500      	push	{lr}
 801d7e0:	001f      	movs	r7, r3
 801d7e2:	f7ff ff4b 	bl	801d67c <fn_0801D67C>
 801d7e6:	4680      	mov	r8, r0
 801d7e8:	2d00      	cmp	r5, #0
 801d7ea:	d022      	beq.n	801d832 <fn_0801D7D0+0x62>
 801d7ec:	002c      	movs	r4, r5
 801d7ee:	3c10      	subs	r4, #16
 801d7f0:	6822      	ldr	r2, [r4, #0]
 801d7f2:	0212      	lsls	r2, r2, #8
 801d7f4:	0a12      	lsrs	r2, r2, #8
 801d7f6:	42b2      	cmp	r2, r6
 801d7f8:	d821      	bhi.n	801d83e <fn_0801D7D0+0x6e>
 801d7fa:	0029      	movs	r1, r5
 801d7fc:	4640      	mov	r0, r8
 801d7fe:	f002 ffa3 	bl	8020748 <fn_08020748>
 801d802:	2280      	movs	r2, #128	@ 0x80
 801d804:	6863      	ldr	r3, [r4, #4]
 801d806:	0021      	movs	r1, r4
 801d808:	0052      	lsls	r2, r2, #1
 801d80a:	4293      	cmp	r3, r2
 801d80c:	d819      	bhi.n	801d842 <fn_0801D7D0+0x72>
 801d80e:	2300      	movs	r3, #0
 801d810:	220f      	movs	r2, #15
 801d812:	6063      	str	r3, [r4, #4]
 801d814:	78e3      	ldrb	r3, [r4, #3]
 801d816:	4393      	bics	r3, r2
 801d818:	70e3      	strb	r3, [r4, #3]
 801d81a:	68e3      	ldr	r3, [r4, #12]
 801d81c:	685a      	ldr	r2, [r3, #4]
 801d81e:	2a00      	cmp	r2, #0
 801d820:	d012      	beq.n	801d848 <fn_0801D7D0+0x78>
 801d822:	68a2      	ldr	r2, [r4, #8]
 801d824:	6853      	ldr	r3, [r2, #4]
 801d826:	2b00      	cmp	r3, #0
 801d828:	d023      	beq.n	801d872 <fn_0801D7D0+0xa2>
 801d82a:	2f00      	cmp	r7, #0
 801d82c:	d001      	beq.n	801d832 <fn_0801D7D0+0x62>
 801d82e:	4643      	mov	r3, r8
 801d830:	603b      	str	r3, [r7, #0]
 801d832:	4640      	mov	r0, r8
 801d834:	bc80      	pop	{r7}
 801d836:	46b8      	mov	r8, r7
 801d838:	bcf0      	pop	{r4, r5, r6, r7}
 801d83a:	bc02      	pop	{r1}
 801d83c:	4708      	bx	r1
 801d83e:	0032      	movs	r2, r6
 801d840:	e7db      	b.n	801d7fa <fn_0801D7D0+0x2a>
 801d842:	2200      	movs	r2, #0
 801d844:	601a      	str	r2, [r3, #0]
 801d846:	e7e2      	b.n	801d80e <fn_0801D7D0+0x3e>
 801d848:	681a      	ldr	r2, [r3, #0]
 801d84a:	6821      	ldr	r1, [r4, #0]
 801d84c:	1889      	adds	r1, r1, r2
 801d84e:	0209      	lsls	r1, r1, #8
 801d850:	0e12      	lsrs	r2, r2, #24
 801d852:	0a09      	lsrs	r1, r1, #8
 801d854:	0612      	lsls	r2, r2, #24
 801d856:	430a      	orrs	r2, r1
 801d858:	601a      	str	r2, [r3, #0]
 801d85a:	4911      	ldr	r1, [pc, #68]	@ (801d8a0 <fn_0801D7D0+0xd0>)
 801d85c:	6809      	ldr	r1, [r1, #0]
 801d85e:	68a2      	ldr	r2, [r4, #8]
 801d860:	6908      	ldr	r0, [r1, #16]
 801d862:	609a      	str	r2, [r3, #8]
 801d864:	60d3      	str	r3, [r2, #12]
 801d866:	4284      	cmp	r4, r0
 801d868:	d016      	beq.n	801d898 <fn_0801D7D0+0xc8>
 801d86a:	0019      	movs	r1, r3
 801d86c:	6853      	ldr	r3, [r2, #4]
 801d86e:	2b00      	cmp	r3, #0
 801d870:	d1db      	bne.n	801d82a <fn_0801D7D0+0x5a>
 801d872:	680b      	ldr	r3, [r1, #0]
 801d874:	6810      	ldr	r0, [r2, #0]
 801d876:	18c0      	adds	r0, r0, r3
 801d878:	0200      	lsls	r0, r0, #8
 801d87a:	0e1b      	lsrs	r3, r3, #24
 801d87c:	0a00      	lsrs	r0, r0, #8
 801d87e:	061b      	lsls	r3, r3, #24
 801d880:	4303      	orrs	r3, r0
 801d882:	600b      	str	r3, [r1, #0]
 801d884:	6893      	ldr	r3, [r2, #8]
 801d886:	608b      	str	r3, [r1, #8]
 801d888:	60d9      	str	r1, [r3, #12]
 801d88a:	4b05      	ldr	r3, [pc, #20]	@ (801d8a0 <fn_0801D7D0+0xd0>)
 801d88c:	681b      	ldr	r3, [r3, #0]
 801d88e:	6918      	ldr	r0, [r3, #16]
 801d890:	4290      	cmp	r0, r2
 801d892:	d1ca      	bne.n	801d82a <fn_0801D7D0+0x5a>
 801d894:	6119      	str	r1, [r3, #16]
 801d896:	e7c8      	b.n	801d82a <fn_0801D7D0+0x5a>
 801d898:	610b      	str	r3, [r1, #16]
 801d89a:	0019      	movs	r1, r3
 801d89c:	e7e6      	b.n	801d86c <fn_0801D7D0+0x9c>
 801d89e:	46c0      	nop			@ (mov r8, r8)
 801d8a0:	03006780 	.word	0x03006780
