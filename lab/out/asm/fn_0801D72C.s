fn_0801D72C:
 801d72c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801d72e:	4657      	mov	r7, sl
 801d730:	464e      	mov	r6, r9
 801d732:	46de      	mov	lr, fp
 801d734:	4645      	mov	r5, r8
 801d736:	2303      	movs	r3, #3
 801d738:	b5e0      	push	{r5, r6, r7, lr}
 801d73a:	1cc7      	adds	r7, r0, #3
 801d73c:	439f      	bics	r7, r3
 801d73e:	4b39      	ldr	r3, [pc, #228]	@ (801d824 <fn_0801D72C+0xf8>)
 801d740:	469a      	mov	sl, r3
 801d742:	681b      	ldr	r3, [r3, #0]
 801d744:	691c      	ldr	r4, [r3, #16]
 801d746:	68e6      	ldr	r6, [r4, #12]
 801d748:	6873      	ldr	r3, [r6, #4]
 801d74a:	4689      	mov	r9, r1
 801d74c:	4693      	mov	fp, r2
 801d74e:	3710      	adds	r7, #16
 801d750:	2b00      	cmp	r3, #0
 801d752:	d05a      	beq.n	801d80a <fn_0801D72C+0xde>
 801d754:	4b34      	ldr	r3, [pc, #208]	@ (801d828 <fn_0801D72C+0xfc>)
 801d756:	0025      	movs	r5, r4
 801d758:	4698      	mov	r8, r3
 801d75a:	42b4      	cmp	r4, r6
 801d75c:	d050      	beq.n	801d800 <fn_0801D72C+0xd4>
 801d75e:	6863      	ldr	r3, [r4, #4]
 801d760:	2b00      	cmp	r3, #0
 801d762:	d043      	beq.n	801d7ec <fn_0801D72C+0xc0>
 801d764:	78e3      	ldrb	r3, [r4, #3]
 801d766:	071b      	lsls	r3, r3, #28
 801d768:	0f1b      	lsrs	r3, r3, #28
 801d76a:	2b03      	cmp	r3, #3
 801d76c:	d840      	bhi.n	801d7f0 <fn_0801D72C+0xc4>
 801d76e:	68a4      	ldr	r4, [r4, #8]
 801d770:	0025      	movs	r5, r4
 801d772:	686b      	ldr	r3, [r5, #4]
 801d774:	2b00      	cmp	r3, #0
 801d776:	d1f0      	bne.n	801d75a <fn_0801D72C+0x2e>
 801d778:	682a      	ldr	r2, [r5, #0]
 801d77a:	0212      	lsls	r2, r2, #8
 801d77c:	0a12      	lsrs	r2, r2, #8
 801d77e:	42ba      	cmp	r2, r7
 801d780:	dbeb      	blt.n	801d75a <fn_0801D72C+0x2e>
 801d782:	1bd2      	subs	r2, r2, r7
 801d784:	2a40      	cmp	r2, #64	@ 0x40
 801d786:	dd16      	ble.n	801d7b6 <fn_0801D72C+0x8a>
 801d788:	19e9      	adds	r1, r5, r7
 801d78a:	78c8      	ldrb	r0, [r1, #3]
 801d78c:	0212      	lsls	r2, r2, #8
 801d78e:	0600      	lsls	r0, r0, #24
 801d790:	0a12      	lsrs	r2, r2, #8
 801d792:	604b      	str	r3, [r1, #4]
 801d794:	4302      	orrs	r2, r0
 801d796:	330f      	adds	r3, #15
 801d798:	0e00      	lsrs	r0, r0, #24
 801d79a:	4398      	bics	r0, r3
 801d79c:	600a      	str	r2, [r1, #0]
 801d79e:	70c8      	strb	r0, [r1, #3]
 801d7a0:	68ab      	ldr	r3, [r5, #8]
 801d7a2:	60cd      	str	r5, [r1, #12]
 801d7a4:	608b      	str	r3, [r1, #8]
 801d7a6:	60d9      	str	r1, [r3, #12]
 801d7a8:	78eb      	ldrb	r3, [r5, #3]
 801d7aa:	023f      	lsls	r7, r7, #8
 801d7ac:	0a3f      	lsrs	r7, r7, #8
 801d7ae:	061b      	lsls	r3, r3, #24
 801d7b0:	433b      	orrs	r3, r7
 801d7b2:	60a9      	str	r1, [r5, #8]
 801d7b4:	602b      	str	r3, [r5, #0]
 801d7b6:	002c      	movs	r4, r5
 801d7b8:	465b      	mov	r3, fp
 801d7ba:	3410      	adds	r4, #16
 801d7bc:	2b00      	cmp	r3, #0
 801d7be:	d027      	beq.n	801d810 <fn_0801D72C+0xe4>
 801d7c0:	606b      	str	r3, [r5, #4]
 801d7c2:	601c      	str	r4, [r3, #0]
 801d7c4:	210f      	movs	r1, #15
 801d7c6:	464a      	mov	r2, r9
 801d7c8:	78eb      	ldrb	r3, [r5, #3]
 801d7ca:	400a      	ands	r2, r1
 801d7cc:	438b      	bics	r3, r1
 801d7ce:	4313      	orrs	r3, r2
 801d7d0:	70eb      	strb	r3, [r5, #3]
 801d7d2:	4653      	mov	r3, sl
 801d7d4:	68aa      	ldr	r2, [r5, #8]
 801d7d6:	681b      	ldr	r3, [r3, #0]
 801d7d8:	0020      	movs	r0, r4
 801d7da:	611a      	str	r2, [r3, #16]
 801d7dc:	bcf0      	pop	{r4, r5, r6, r7}
 801d7de:	46bb      	mov	fp, r7
 801d7e0:	46b2      	mov	sl, r6
 801d7e2:	46a9      	mov	r9, r5
 801d7e4:	46a0      	mov	r8, r4
 801d7e6:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801d7e8:	bc02      	pop	{r1}
 801d7ea:	4708      	bx	r1
 801d7ec:	68a4      	ldr	r4, [r4, #8]
 801d7ee:	e7c0      	b.n	801d772 <fn_0801D72C+0x46>
 801d7f0:	0020      	movs	r0, r4
 801d7f2:	68ed      	ldr	r5, [r5, #12]
 801d7f4:	3010      	adds	r0, #16
 801d7f6:	f7ff ff4f 	bl	801d698 <fn_0801D698>
 801d7fa:	68ad      	ldr	r5, [r5, #8]
 801d7fc:	68ac      	ldr	r4, [r5, #8]
 801d7fe:	e7b8      	b.n	801d772 <fn_0801D72C+0x46>
 801d800:	0039      	movs	r1, r7
 801d802:	4640      	mov	r0, r8
 801d804:	f7e2 fed0 	bl	80005a8 <fn_080005A8>
 801d808:	e7a9      	b.n	801d75e <fn_0801D72C+0x32>
 801d80a:	0034      	movs	r4, r6
 801d80c:	68f6      	ldr	r6, [r6, #12]
 801d80e:	e7a1      	b.n	801d754 <fn_0801D72C+0x28>
 801d810:	464b      	mov	r3, r9
 801d812:	2b03      	cmp	r3, #3
 801d814:	dc02      	bgt.n	801d81c <fn_0801D72C+0xf0>
 801d816:	2302      	movs	r3, #2
 801d818:	606b      	str	r3, [r5, #4]
 801d81a:	e7d3      	b.n	801d7c4 <fn_0801D72C+0x98>
 801d81c:	4803      	ldr	r0, [pc, #12]	@ (801d82c <fn_0801D72C+0x100>)
 801d81e:	f7e2 fec3 	bl	80005a8 <fn_080005A8>
 801d822:	e7f8      	b.n	801d816 <fn_0801D72C+0xea>
 801d824:	03006780 	.word	0x03006780
 801d828:	0814aaf0 	.word	0x0814aaf0
 801d82c:	0814ab1c 	.word	0x0814ab1c
