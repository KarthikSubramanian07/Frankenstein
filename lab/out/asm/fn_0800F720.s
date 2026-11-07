fn_0800F720:
 800f720:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800f722:	46ce      	mov	lr, r9
 800f724:	4647      	mov	r7, r8
 800f726:	b580      	push	{r7, lr}
 800f728:	4d33      	ldr	r5, [pc, #204]	@ (800f7f8 <fn_0800F720+0xd8>)
 800f72a:	2108      	movs	r1, #8
 800f72c:	5e43      	ldrsh	r3, [r0, r1]
 800f72e:	0004      	movs	r4, r0
 800f730:	682a      	ldr	r2, [r5, #0]
 800f732:	2b00      	cmp	r3, #0
 800f734:	d107      	bne.n	800f746 <fn_0800F720+0x26>
 800f736:	4931      	ldr	r1, [pc, #196]	@ (800f7fc <fn_0800F720+0xdc>)
 800f738:	5053      	str	r3, [r2, r1]
 800f73a:	bcc0      	pop	{r6, r7}
 800f73c:	46b9      	mov	r9, r7
 800f73e:	46b0      	mov	r8, r6
 800f740:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800f742:	bc01      	pop	{r0}
 800f744:	4700      	bx	r0
 800f746:	210a      	movs	r1, #10
 800f748:	5e43      	ldrsh	r3, [r0, r1]
 800f74a:	2b00      	cmp	r3, #0
 800f74c:	d04f      	beq.n	800f7ee <fn_0800F720+0xce>
 800f74e:	4b2c      	ldr	r3, [pc, #176]	@ (800f800 <fn_0800F720+0xe0>)
 800f750:	58d3      	ldr	r3, [r2, r3]
 800f752:	330c      	adds	r3, #12
 800f754:	cb03      	ldmia	r3!, {r0, r1}
 800f756:	0022      	movs	r2, r4
 800f758:	f000 fb60 	bl	800fe1c <fn_0800FE1C>
 800f75c:	8963      	ldrh	r3, [r4, #10]
 800f75e:	8922      	ldrh	r2, [r4, #8]
 800f760:	0006      	movs	r6, r0
 800f762:	2100      	movs	r1, #0
 800f764:	2000      	movs	r0, #0
 800f766:	041b      	lsls	r3, r3, #16
 800f768:	0412      	lsls	r2, r2, #16
 800f76a:	f015 fef9 	bl	8025560 <fn_08025560>
 800f76e:	4680      	mov	r8, r0
 800f770:	2e01      	cmp	r6, #1
 800f772:	d103      	bne.n	800f77c <fn_0800F720+0x5c>
 800f774:	2280      	movs	r2, #128	@ 0x80
 800f776:	0612      	lsls	r2, r2, #24
 800f778:	1883      	adds	r3, r0, r2
 800f77a:	4698      	mov	r8, r3
 800f77c:	278f      	movs	r7, #143	@ 0x8f
 800f77e:	682a      	ldr	r2, [r5, #0]
 800f780:	491e      	ldr	r1, [pc, #120]	@ (800f7fc <fn_0800F720+0xdc>)
 800f782:	013f      	lsls	r7, r7, #4
 800f784:	59d3      	ldr	r3, [r2, r7]
 800f786:	2000      	movs	r0, #0
 800f788:	5852      	ldr	r2, [r2, r1]
 800f78a:	2100      	movs	r1, #0
 800f78c:	f015 fee8 	bl	8025560 <fn_08025560>
 800f790:	4642      	mov	r2, r8
 800f792:	4b1a      	ldr	r3, [pc, #104]	@ (800f7fc <fn_0800F720+0xdc>)
 800f794:	682c      	ldr	r4, [r5, #0]
 800f796:	300a      	adds	r0, #10
 800f798:	1a86      	subs	r6, r0, r2
 800f79a:	59e1      	ldr	r1, [r4, r7]
 800f79c:	58e0      	ldr	r0, [r4, r3]
 800f79e:	f000 fb2d 	bl	800fdfc <fn_0800FDFC>
 800f7a2:	2380      	movs	r3, #128	@ 0x80
 800f7a4:	46b1      	mov	r9, r6
 800f7a6:	061b      	lsls	r3, r3, #24
 800f7a8:	429e      	cmp	r6, r3
 800f7aa:	d901      	bls.n	800f7b0 <fn_0800F720+0x90>
 800f7ac:	18f6      	adds	r6, r6, r3
 800f7ae:	46b1      	mov	r9, r6
 800f7b0:	4643      	mov	r3, r8
 800f7b2:	2280      	movs	r2, #128	@ 0x80
 800f7b4:	0cde      	lsrs	r6, r3, #19
 800f7b6:	464b      	mov	r3, r9
 800f7b8:	0112      	lsls	r2, r2, #4
 800f7ba:	0cdb      	lsrs	r3, r3, #19
 800f7bc:	189b      	adds	r3, r3, r2
 800f7be:	4d11      	ldr	r5, [pc, #68]	@ (800f804 <fn_0800F720+0xe4>)
 800f7c0:	009b      	lsls	r3, r3, #2
 800f7c2:	58e9      	ldr	r1, [r5, r3]
 800f7c4:	f015 ff0a 	bl	80255dc <fn_080255DC>
 800f7c8:	2380      	movs	r3, #128	@ 0x80
 800f7ca:	011b      	lsls	r3, r3, #4
 800f7cc:	199b      	adds	r3, r3, r6
 800f7ce:	009b      	lsls	r3, r3, #2
 800f7d0:	58e9      	ldr	r1, [r5, r3]
 800f7d2:	0007      	movs	r7, r0
 800f7d4:	f015 ff02 	bl	80255dc <fn_080255DC>
 800f7d8:	4b08      	ldr	r3, [pc, #32]	@ (800f7fc <fn_0800F720+0xdc>)
 800f7da:	50e0      	str	r0, [r4, r3]
 800f7dc:	00b0      	lsls	r0, r6, #2
 800f7de:	5941      	ldr	r1, [r0, r5]
 800f7e0:	0038      	movs	r0, r7
 800f7e2:	f015 fefb 	bl	80255dc <fn_080255DC>
 800f7e6:	238f      	movs	r3, #143	@ 0x8f
 800f7e8:	011b      	lsls	r3, r3, #4
 800f7ea:	50e0      	str	r0, [r4, r3]
 800f7ec:	e7a5      	b.n	800f73a <fn_0800F720+0x1a>
 800f7ee:	218f      	movs	r1, #143	@ 0x8f
 800f7f0:	0109      	lsls	r1, r1, #4
 800f7f2:	5053      	str	r3, [r2, r1]
 800f7f4:	e7a1      	b.n	800f73a <fn_0800F720+0x1a>
 800f7f6:	46c0      	nop			@ (mov r8, r8)
 800f7f8:	030064c4 	.word	0x030064c4
 800f7fc:	000008ec 	.word	0x000008ec
 800f800:	000008e8 	.word	0x000008e8
 800f804:	081397cc 	.word	0x081397cc
