fn_0801D67C:
 801d67c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801d67e:	4657      	mov	r7, sl
 801d680:	464e      	mov	r6, r9
 801d682:	46de      	mov	lr, fp
 801d684:	4645      	mov	r5, r8
 801d686:	2303      	movs	r3, #3
 801d688:	b5e0      	push	{r5, r6, r7, lr}
 801d68a:	1cc7      	adds	r7, r0, #3
 801d68c:	439f      	bics	r7, r3
 801d68e:	4b39      	ldr	r3, [pc, #228]	@ (801d774 <fn_0801D67C+0xf8>)
 801d690:	469a      	mov	sl, r3
 801d692:	681b      	ldr	r3, [r3, #0]
 801d694:	691c      	ldr	r4, [r3, #16]
 801d696:	68e6      	ldr	r6, [r4, #12]
 801d698:	6873      	ldr	r3, [r6, #4]
 801d69a:	4689      	mov	r9, r1
 801d69c:	4693      	mov	fp, r2
 801d69e:	3710      	adds	r7, #16
 801d6a0:	2b00      	cmp	r3, #0
 801d6a2:	d05a      	beq.n	801d75a <fn_0801D67C+0xde>
 801d6a4:	4b34      	ldr	r3, [pc, #208]	@ (801d778 <fn_0801D67C+0xfc>)
 801d6a6:	0025      	movs	r5, r4
 801d6a8:	4698      	mov	r8, r3
 801d6aa:	42b4      	cmp	r4, r6
 801d6ac:	d050      	beq.n	801d750 <fn_0801D67C+0xd4>
 801d6ae:	6863      	ldr	r3, [r4, #4]
 801d6b0:	2b00      	cmp	r3, #0
 801d6b2:	d043      	beq.n	801d73c <fn_0801D67C+0xc0>
 801d6b4:	78e3      	ldrb	r3, [r4, #3]
 801d6b6:	071b      	lsls	r3, r3, #28
 801d6b8:	0f1b      	lsrs	r3, r3, #28
 801d6ba:	2b03      	cmp	r3, #3
 801d6bc:	d840      	bhi.n	801d740 <fn_0801D67C+0xc4>
 801d6be:	68a4      	ldr	r4, [r4, #8]
 801d6c0:	0025      	movs	r5, r4
 801d6c2:	686b      	ldr	r3, [r5, #4]
 801d6c4:	2b00      	cmp	r3, #0
 801d6c6:	d1f0      	bne.n	801d6aa <fn_0801D67C+0x2e>
 801d6c8:	682a      	ldr	r2, [r5, #0]
 801d6ca:	0212      	lsls	r2, r2, #8
 801d6cc:	0a12      	lsrs	r2, r2, #8
 801d6ce:	42ba      	cmp	r2, r7
 801d6d0:	dbeb      	blt.n	801d6aa <fn_0801D67C+0x2e>
 801d6d2:	1bd2      	subs	r2, r2, r7
 801d6d4:	2a40      	cmp	r2, #64	@ 0x40
 801d6d6:	dd16      	ble.n	801d706 <fn_0801D67C+0x8a>
 801d6d8:	19e9      	adds	r1, r5, r7
 801d6da:	78c8      	ldrb	r0, [r1, #3]
 801d6dc:	0212      	lsls	r2, r2, #8
 801d6de:	0600      	lsls	r0, r0, #24
 801d6e0:	0a12      	lsrs	r2, r2, #8
 801d6e2:	604b      	str	r3, [r1, #4]
 801d6e4:	4302      	orrs	r2, r0
 801d6e6:	330f      	adds	r3, #15
 801d6e8:	0e00      	lsrs	r0, r0, #24
 801d6ea:	4398      	bics	r0, r3
 801d6ec:	600a      	str	r2, [r1, #0]
 801d6ee:	70c8      	strb	r0, [r1, #3]
 801d6f0:	68ab      	ldr	r3, [r5, #8]
 801d6f2:	60cd      	str	r5, [r1, #12]
 801d6f4:	608b      	str	r3, [r1, #8]
 801d6f6:	60d9      	str	r1, [r3, #12]
 801d6f8:	78eb      	ldrb	r3, [r5, #3]
 801d6fa:	023f      	lsls	r7, r7, #8
 801d6fc:	0a3f      	lsrs	r7, r7, #8
 801d6fe:	061b      	lsls	r3, r3, #24
 801d700:	433b      	orrs	r3, r7
 801d702:	60a9      	str	r1, [r5, #8]
 801d704:	602b      	str	r3, [r5, #0]
 801d706:	002c      	movs	r4, r5
 801d708:	465b      	mov	r3, fp
 801d70a:	3410      	adds	r4, #16
 801d70c:	2b00      	cmp	r3, #0
 801d70e:	d027      	beq.n	801d760 <fn_0801D67C+0xe4>
 801d710:	606b      	str	r3, [r5, #4]
 801d712:	601c      	str	r4, [r3, #0]
 801d714:	210f      	movs	r1, #15
 801d716:	464a      	mov	r2, r9
 801d718:	78eb      	ldrb	r3, [r5, #3]
 801d71a:	400a      	ands	r2, r1
 801d71c:	438b      	bics	r3, r1
 801d71e:	4313      	orrs	r3, r2
 801d720:	70eb      	strb	r3, [r5, #3]
 801d722:	4653      	mov	r3, sl
 801d724:	68aa      	ldr	r2, [r5, #8]
 801d726:	681b      	ldr	r3, [r3, #0]
 801d728:	0020      	movs	r0, r4
 801d72a:	611a      	str	r2, [r3, #16]
 801d72c:	bcf0      	pop	{r4, r5, r6, r7}
 801d72e:	46bb      	mov	fp, r7
 801d730:	46b2      	mov	sl, r6
 801d732:	46a9      	mov	r9, r5
 801d734:	46a0      	mov	r8, r4
 801d736:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801d738:	bc02      	pop	{r1}
 801d73a:	4708      	bx	r1
 801d73c:	68a4      	ldr	r4, [r4, #8]
 801d73e:	e7c0      	b.n	801d6c2 <fn_0801D67C+0x46>
 801d740:	0020      	movs	r0, r4
 801d742:	68ed      	ldr	r5, [r5, #12]
 801d744:	3010      	adds	r0, #16
 801d746:	f7ff ff4f 	bl	801d5e8 <fn_0801D5E8>
 801d74a:	68ad      	ldr	r5, [r5, #8]
 801d74c:	68ac      	ldr	r4, [r5, #8]
 801d74e:	e7b8      	b.n	801d6c2 <fn_0801D67C+0x46>
 801d750:	0039      	movs	r1, r7
 801d752:	4640      	mov	r0, r8
 801d754:	f7e2 ff28 	bl	80005a8 <fn_080005A8>
 801d758:	e7a9      	b.n	801d6ae <fn_0801D67C+0x32>
 801d75a:	0034      	movs	r4, r6
 801d75c:	68f6      	ldr	r6, [r6, #12]
 801d75e:	e7a1      	b.n	801d6a4 <fn_0801D67C+0x28>
 801d760:	464b      	mov	r3, r9
 801d762:	2b03      	cmp	r3, #3
 801d764:	dc02      	bgt.n	801d76c <fn_0801D67C+0xf0>
 801d766:	2302      	movs	r3, #2
 801d768:	606b      	str	r3, [r5, #4]
 801d76a:	e7d3      	b.n	801d714 <fn_0801D67C+0x98>
 801d76c:	4803      	ldr	r0, [pc, #12]	@ (801d77c <fn_0801D67C+0x100>)
 801d76e:	f7e2 ff1b 	bl	80005a8 <fn_080005A8>
 801d772:	e7f8      	b.n	801d766 <fn_0801D67C+0xea>
 801d774:	03006780 	.word	0x03006780	@ data_03006780
 801d778:	0814aa1c 	.word	0x0814aa1c
 801d77c:	0814aa48 	.word	0x0814aa48
