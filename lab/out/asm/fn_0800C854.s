fn_0800C854:
 800c854:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800c856:	464e      	mov	r6, r9
 800c858:	4645      	mov	r5, r8
 800c85a:	46de      	mov	lr, fp
 800c85c:	4657      	mov	r7, sl
 800c85e:	b5e0      	push	{r5, r6, r7, lr}
 800c860:	4e5d      	ldr	r6, [pc, #372]	@ (800c9d8 <fn_0800C854+0x184>)
 800c862:	4b5e      	ldr	r3, [pc, #376]	@ (800c9dc <fn_0800C854+0x188>)
 800c864:	6831      	ldr	r1, [r6, #0]
 800c866:	8bc2      	ldrh	r2, [r0, #30]
 800c868:	58cb      	ldr	r3, [r1, r3]
 800c86a:	0092      	lsls	r2, r2, #2
 800c86c:	189b      	adds	r3, r3, r2
 800c86e:	78dc      	ldrb	r4, [r3, #3]
 800c870:	0005      	movs	r5, r0
 800c872:	0662      	lsls	r2, r4, #25
 800c874:	d569      	bpl.n	800c94a <fn_0800C854+0xf6>
 800c876:	f7fa fb4f 	bl	8006f18 <fn_08006F18>
 800c87a:	2300      	movs	r3, #0
 800c87c:	4698      	mov	r8, r3
 800c87e:	4b58      	ldr	r3, [pc, #352]	@ (800c9e0 <fn_0800C854+0x18c>)
 800c880:	2401      	movs	r4, #1
 800c882:	0007      	movs	r7, r0
 800c884:	4699      	mov	r9, r3
 800c886:	4264      	negs	r4, r4
 800c888:	0021      	movs	r1, r4
 800c88a:	0028      	movs	r0, r5
 800c88c:	f008 fbfa 	bl	8015084 <fn_08015084>
 800c890:	1e04      	subs	r4, r0, #0
 800c892:	db51      	blt.n	800c938 <fn_0800C854+0xe4>
 800c894:	22df      	movs	r2, #223	@ 0xdf
 800c896:	6831      	ldr	r1, [r6, #0]
 800c898:	00a3      	lsls	r3, r4, #2
 800c89a:	0112      	lsls	r2, r2, #4
 800c89c:	588a      	ldr	r2, [r1, r2]
 800c89e:	191b      	adds	r3, r3, r4
 800c8a0:	00db      	lsls	r3, r3, #3
 800c8a2:	18d3      	adds	r3, r2, r3
 800c8a4:	0019      	movs	r1, r3
 800c8a6:	2001      	movs	r0, #1
 800c8a8:	469a      	mov	sl, r3
 800c8aa:	f008 fd89 	bl	80153c0 <fn_080153C0>
 800c8ae:	4683      	mov	fp, r0
 800c8b0:	2800      	cmp	r0, #0
 800c8b2:	d1e9      	bne.n	800c888 <fn_0800C854+0x34>
 800c8b4:	2200      	movs	r2, #0
 800c8b6:	2103      	movs	r1, #3
 800c8b8:	2040      	movs	r0, #64	@ 0x40
 800c8ba:	f010 fedf 	bl	801d67c <fn_0801D67C>
 800c8be:	0007      	movs	r7, r0
 800c8c0:	2240      	movs	r2, #64	@ 0x40
 800c8c2:	2100      	movs	r1, #0
 800c8c4:	f014 f864 	bl	8020990 <fn_08020990>
 800c8c8:	0038      	movs	r0, r7
 800c8ca:	f00b fe27 	bl	801851c <fn_0801851C>
 800c8ce:	4651      	mov	r1, sl
 800c8d0:	4b44      	ldr	r3, [pc, #272]	@ (800c9e4 <fn_0800C854+0x190>)
 800c8d2:	614f      	str	r7, [r1, #20]
 800c8d4:	2201      	movs	r2, #1
 800c8d6:	60bb      	str	r3, [r7, #8]
 800c8d8:	2324      	movs	r3, #36	@ 0x24
 800c8da:	54fa      	strb	r2, [r7, r3]
 800c8dc:	000a      	movs	r2, r1
 800c8de:	3b25      	subs	r3, #37	@ 0x25
 800c8e0:	637b      	str	r3, [r7, #52]	@ 0x34
 800c8e2:	6139      	str	r1, [r7, #16]
 800c8e4:	3326      	adds	r3, #38	@ 0x26
 800c8e6:	5ccb      	ldrb	r3, [r1, r3]
 800c8e8:	863b      	strh	r3, [r7, #48]	@ 0x30
 800c8ea:	2120      	movs	r1, #32
 800c8ec:	5e53      	ldrsh	r3, [r2, r1]
 800c8ee:	62bb      	str	r3, [r7, #40]	@ 0x28
 800c8f0:	2122      	movs	r1, #34	@ 0x22
 800c8f2:	5e53      	ldrsh	r3, [r2, r1]
 800c8f4:	63bb      	str	r3, [r7, #56]	@ 0x38
 800c8f6:	464b      	mov	r3, r9
 800c8f8:	065b      	lsls	r3, r3, #25
 800c8fa:	0fdb      	lsrs	r3, r3, #31
 800c8fc:	330c      	adds	r3, #12
 800c8fe:	733b      	strb	r3, [r7, #12]
 800c900:	6853      	ldr	r3, [r2, #4]
 800c902:	61bb      	str	r3, [r7, #24]
 800c904:	2380      	movs	r3, #128	@ 0x80
 800c906:	6812      	ldr	r2, [r2, #0]
 800c908:	031b      	lsls	r3, r3, #12
 800c90a:	18d2      	adds	r2, r2, r3
 800c90c:	4643      	mov	r3, r8
 800c90e:	2b02      	cmp	r3, #2
 800c910:	d05c      	beq.n	800c9cc <fn_0800C854+0x178>
 800c912:	2b03      	cmp	r3, #3
 800c914:	d05d      	beq.n	800c9d2 <fn_0800C854+0x17e>
 800c916:	3b01      	subs	r3, #1
 800c918:	4259      	negs	r1, r3
 800c91a:	414b      	adcs	r3, r1
 800c91c:	2180      	movs	r1, #128	@ 0x80
 800c91e:	041b      	lsls	r3, r3, #16
 800c920:	0249      	lsls	r1, r1, #9
 800c922:	185b      	adds	r3, r3, r1
 800c924:	61fb      	str	r3, [r7, #28]
 800c926:	623b      	str	r3, [r7, #32]
 800c928:	0038      	movs	r0, r7
 800c92a:	617a      	str	r2, [r7, #20]
 800c92c:	f7fa fb48 	bl	8006fc0 <fn_08006FC0>
 800c930:	465b      	mov	r3, fp
 800c932:	2701      	movs	r7, #1
 800c934:	2b00      	cmp	r3, #0
 800c936:	d0a7      	beq.n	800c888 <fn_0800C854+0x34>
 800c938:	0038      	movs	r0, r7
 800c93a:	bcf0      	pop	{r4, r5, r6, r7}
 800c93c:	46bb      	mov	fp, r7
 800c93e:	46b2      	mov	sl, r6
 800c940:	46a9      	mov	r9, r5
 800c942:	46a0      	mov	r8, r4
 800c944:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800c946:	bc02      	pop	{r1}
 800c948:	4708      	bx	r1
 800c94a:	221a      	movs	r2, #26
 800c94c:	5e83      	ldrsh	r3, [r0, r2]
 800c94e:	09e4      	lsrs	r4, r4, #7
 800c950:	0224      	lsls	r4, r4, #8
 800c952:	405c      	eors	r4, r3
 800c954:	4b22      	ldr	r3, [pc, #136]	@ (800c9e0 <fn_0800C854+0x18c>)
 800c956:	469c      	mov	ip, r3
 800c958:	06e3      	lsls	r3, r4, #27
 800c95a:	0f9b      	lsrs	r3, r3, #30
 800c95c:	44a4      	add	ip, r4
 800c95e:	4698      	mov	r8, r3
 800c960:	46e1      	mov	r9, ip
 800c962:	f7fa fad9 	bl	8006f18 <fn_08006F18>
 800c966:	2307      	movs	r3, #7
 800c968:	4023      	ands	r3, r4
 800c96a:	3b06      	subs	r3, #6
 800c96c:	0007      	movs	r7, r0
 800c96e:	2b01      	cmp	r3, #1
 800c970:	d829      	bhi.n	800c9c6 <fn_0800C854+0x172>
 800c972:	8aea      	ldrh	r2, [r5, #22]
 800c974:	4b1c      	ldr	r3, [pc, #112]	@ (800c9e8 <fn_0800C854+0x194>)
 800c976:	429a      	cmp	r2, r3
 800c978:	d0de      	beq.n	800c938 <fn_0800C854+0xe4>
 800c97a:	6831      	ldr	r1, [r6, #0]
 800c97c:	4b1b      	ldr	r3, [pc, #108]	@ (800c9ec <fn_0800C854+0x198>)
 800c97e:	58c8      	ldr	r0, [r1, r3]
 800c980:	0053      	lsls	r3, r2, #1
 800c982:	189b      	adds	r3, r3, r2
 800c984:	009b      	lsls	r3, r3, #2
 800c986:	18c3      	adds	r3, r0, r3
 800c988:	895b      	ldrh	r3, [r3, #10]
 800c98a:	009c      	lsls	r4, r3, #2
 800c98c:	18e4      	adds	r4, r4, r3
 800c98e:	23df      	movs	r3, #223	@ 0xdf
 800c990:	011b      	lsls	r3, r3, #4
 800c992:	58cb      	ldr	r3, [r1, r3]
 800c994:	00e4      	lsls	r4, r4, #3
 800c996:	191b      	adds	r3, r3, r4
 800c998:	469a      	mov	sl, r3
 800c99a:	2b00      	cmp	r3, #0
 800c99c:	d0cc      	beq.n	800c938 <fn_0800C854+0xe4>
 800c99e:	0019      	movs	r1, r3
 800c9a0:	2001      	movs	r0, #1
 800c9a2:	f008 fd0d 	bl	80153c0 <fn_080153C0>
 800c9a6:	2800      	cmp	r0, #0
 800c9a8:	d1c6      	bne.n	800c938 <fn_0800C854+0xe4>
 800c9aa:	10e3      	asrs	r3, r4, #3
 800c9ac:	08a4      	lsrs	r4, r4, #2
 800c9ae:	18e4      	adds	r4, r4, r3
 800c9b0:	0122      	lsls	r2, r4, #4
 800c9b2:	18a4      	adds	r4, r4, r2
 800c9b4:	0222      	lsls	r2, r4, #8
 800c9b6:	18a4      	adds	r4, r4, r2
 800c9b8:	0422      	lsls	r2, r4, #16
 800c9ba:	18a4      	adds	r4, r4, r2
 800c9bc:	00a4      	lsls	r4, r4, #2
 800c9be:	18e4      	adds	r4, r4, r3
 800c9c0:	2301      	movs	r3, #1
 800c9c2:	469b      	mov	fp, r3
 800c9c4:	e776      	b.n	800c8b4 <fn_0800C854+0x60>
 800c9c6:	2401      	movs	r4, #1
 800c9c8:	4264      	negs	r4, r4
 800c9ca:	e75d      	b.n	800c888 <fn_0800C854+0x34>
 800c9cc:	2380      	movs	r3, #128	@ 0x80
 800c9ce:	02db      	lsls	r3, r3, #11
 800c9d0:	e7a8      	b.n	800c924 <fn_0800C854+0xd0>
 800c9d2:	2380      	movs	r3, #128	@ 0x80
 800c9d4:	031b      	lsls	r3, r3, #12
 800c9d6:	e7a5      	b.n	800c924 <fn_0800C854+0xd0>
 800c9d8:	030064c4 	.word	0x030064c4
 800c9dc:	00000e04 	.word	0x00000e04
 800c9e0:	ffffd080 	.word	0xffffd080
 800c9e4:	08006b61 	.word	0x08006b61
 800c9e8:	0000ffff 	.word	0x0000ffff
 800c9ec:	00000e0c 	.word	0x00000e0c
