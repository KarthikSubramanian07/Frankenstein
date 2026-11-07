fn_0801D880:
 801d880:	b5f0      	push	{r4, r5, r6, r7, lr}
 801d882:	46c6      	mov	lr, r8
 801d884:	000e      	movs	r6, r1
 801d886:	0005      	movs	r5, r0
 801d888:	0011      	movs	r1, r2
 801d88a:	0030      	movs	r0, r6
 801d88c:	001a      	movs	r2, r3
 801d88e:	b500      	push	{lr}
 801d890:	001f      	movs	r7, r3
 801d892:	f7ff ff4b 	bl	801d72c <fn_0801D72C>
 801d896:	4680      	mov	r8, r0
 801d898:	2d00      	cmp	r5, #0
 801d89a:	d022      	beq.n	801d8e2 <fn_0801D880+0x62>
 801d89c:	002c      	movs	r4, r5
 801d89e:	3c10      	subs	r4, #16
 801d8a0:	6822      	ldr	r2, [r4, #0]
 801d8a2:	0212      	lsls	r2, r2, #8
 801d8a4:	0a12      	lsrs	r2, r2, #8
 801d8a6:	42b2      	cmp	r2, r6
 801d8a8:	d821      	bhi.n	801d8ee <fn_0801D880+0x6e>
 801d8aa:	0029      	movs	r1, r5
 801d8ac:	4640      	mov	r0, r8
 801d8ae:	f002 ffa3 	bl	80207f8 <fn_080207F8>
 801d8b2:	2280      	movs	r2, #128	@ 0x80
 801d8b4:	6863      	ldr	r3, [r4, #4]
 801d8b6:	0021      	movs	r1, r4
 801d8b8:	0052      	lsls	r2, r2, #1
 801d8ba:	4293      	cmp	r3, r2
 801d8bc:	d819      	bhi.n	801d8f2 <fn_0801D880+0x72>
 801d8be:	2300      	movs	r3, #0
 801d8c0:	220f      	movs	r2, #15
 801d8c2:	6063      	str	r3, [r4, #4]
 801d8c4:	78e3      	ldrb	r3, [r4, #3]
 801d8c6:	4393      	bics	r3, r2
 801d8c8:	70e3      	strb	r3, [r4, #3]
 801d8ca:	68e3      	ldr	r3, [r4, #12]
 801d8cc:	685a      	ldr	r2, [r3, #4]
 801d8ce:	2a00      	cmp	r2, #0
 801d8d0:	d012      	beq.n	801d8f8 <fn_0801D880+0x78>
 801d8d2:	68a2      	ldr	r2, [r4, #8]
 801d8d4:	6853      	ldr	r3, [r2, #4]
 801d8d6:	2b00      	cmp	r3, #0
 801d8d8:	d023      	beq.n	801d922 <fn_0801D880+0xa2>
 801d8da:	2f00      	cmp	r7, #0
 801d8dc:	d001      	beq.n	801d8e2 <fn_0801D880+0x62>
 801d8de:	4643      	mov	r3, r8
 801d8e0:	603b      	str	r3, [r7, #0]
 801d8e2:	4640      	mov	r0, r8
 801d8e4:	bc80      	pop	{r7}
 801d8e6:	46b8      	mov	r8, r7
 801d8e8:	bcf0      	pop	{r4, r5, r6, r7}
 801d8ea:	bc02      	pop	{r1}
 801d8ec:	4708      	bx	r1
 801d8ee:	0032      	movs	r2, r6
 801d8f0:	e7db      	b.n	801d8aa <fn_0801D880+0x2a>
 801d8f2:	2200      	movs	r2, #0
 801d8f4:	601a      	str	r2, [r3, #0]
 801d8f6:	e7e2      	b.n	801d8be <fn_0801D880+0x3e>
 801d8f8:	681a      	ldr	r2, [r3, #0]
 801d8fa:	6821      	ldr	r1, [r4, #0]
 801d8fc:	1889      	adds	r1, r1, r2
 801d8fe:	0209      	lsls	r1, r1, #8
 801d900:	0e12      	lsrs	r2, r2, #24
 801d902:	0a09      	lsrs	r1, r1, #8
 801d904:	0612      	lsls	r2, r2, #24
 801d906:	430a      	orrs	r2, r1
 801d908:	601a      	str	r2, [r3, #0]
 801d90a:	4911      	ldr	r1, [pc, #68]	@ (801d950 <fn_0801D880+0xd0>)
 801d90c:	6809      	ldr	r1, [r1, #0]
 801d90e:	68a2      	ldr	r2, [r4, #8]
 801d910:	6908      	ldr	r0, [r1, #16]
 801d912:	609a      	str	r2, [r3, #8]
 801d914:	60d3      	str	r3, [r2, #12]
 801d916:	4284      	cmp	r4, r0
 801d918:	d016      	beq.n	801d948 <fn_0801D880+0xc8>
 801d91a:	0019      	movs	r1, r3
 801d91c:	6853      	ldr	r3, [r2, #4]
 801d91e:	2b00      	cmp	r3, #0
 801d920:	d1db      	bne.n	801d8da <fn_0801D880+0x5a>
 801d922:	680b      	ldr	r3, [r1, #0]
 801d924:	6810      	ldr	r0, [r2, #0]
 801d926:	18c0      	adds	r0, r0, r3
 801d928:	0200      	lsls	r0, r0, #8
 801d92a:	0e1b      	lsrs	r3, r3, #24
 801d92c:	0a00      	lsrs	r0, r0, #8
 801d92e:	061b      	lsls	r3, r3, #24
 801d930:	4303      	orrs	r3, r0
 801d932:	600b      	str	r3, [r1, #0]
 801d934:	6893      	ldr	r3, [r2, #8]
 801d936:	608b      	str	r3, [r1, #8]
 801d938:	60d9      	str	r1, [r3, #12]
 801d93a:	4b05      	ldr	r3, [pc, #20]	@ (801d950 <fn_0801D880+0xd0>)
 801d93c:	681b      	ldr	r3, [r3, #0]
 801d93e:	6918      	ldr	r0, [r3, #16]
 801d940:	4290      	cmp	r0, r2
 801d942:	d1ca      	bne.n	801d8da <fn_0801D880+0x5a>
 801d944:	6119      	str	r1, [r3, #16]
 801d946:	e7c8      	b.n	801d8da <fn_0801D880+0x5a>
 801d948:	610b      	str	r3, [r1, #16]
 801d94a:	0019      	movs	r1, r3
 801d94c:	e7e6      	b.n	801d91c <fn_0801D880+0x9c>
 801d94e:	46c0      	nop			@ (mov r8, r8)
 801d950:	03006780 	.word	0x03006780
