fn_0801393C:
 801393c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801393e:	46c6      	mov	lr, r8
 8013940:	2753      	movs	r7, #83	@ 0x53
 8013942:	b500      	push	{lr}
 8013944:	4d4f      	ldr	r5, [pc, #316]	@ (8013a84 <fn_0801393C+0x148>)
 8013946:	5dc2      	ldrb	r2, [r0, r7]
 8013948:	682b      	ldr	r3, [r5, #0]
 801394a:	4e4f      	ldr	r6, [pc, #316]	@ (8013a88 <fn_0801393C+0x14c>)
 801394c:	4688      	mov	r8, r1
 801394e:	5999      	ldr	r1, [r3, r6]
 8013950:	0053      	lsls	r3, r2, #1
 8013952:	189b      	adds	r3, r3, r2
 8013954:	00db      	lsls	r3, r3, #3
 8013956:	585b      	ldr	r3, [r3, r1]
 8013958:	009b      	lsls	r3, r3, #2
 801395a:	18c3      	adds	r3, r0, r3
 801395c:	6fdb      	ldr	r3, [r3, #124]	@ 0x7c
 801395e:	0004      	movs	r4, r0
 8013960:	b084      	sub	sp, #16
 8013962:	2b00      	cmp	r3, #0
 8013964:	d105      	bne.n	8013972 <fn_0801393C+0x36>
 8013966:	b004      	add	sp, #16
 8013968:	bc80      	pop	{r7}
 801396a:	46b8      	mov	r8, r7
 801396c:	bcf0      	pop	{r4, r5, r6, r7}
 801396e:	bc01      	pop	{r0}
 8013970:	4700      	bx	r0
 8013972:	2101      	movs	r1, #1
 8013974:	6800      	ldr	r0, [r0, #0]
 8013976:	f006 fca7 	bl	801a2c8 <fn_0801A2C8>
 801397a:	682b      	ldr	r3, [r5, #0]
 801397c:	5de2      	ldrb	r2, [r4, r7]
 801397e:	5999      	ldr	r1, [r3, r6]
 8013980:	0053      	lsls	r3, r2, #1
 8013982:	189b      	adds	r3, r3, r2
 8013984:	00db      	lsls	r3, r3, #3
 8013986:	585b      	ldr	r3, [r3, r1]
 8013988:	009b      	lsls	r3, r3, #2
 801398a:	18e3      	adds	r3, r4, r3
 801398c:	6fdb      	ldr	r3, [r3, #124]	@ 0x7c
 801398e:	2b00      	cmp	r3, #0
 8013990:	d0e9      	beq.n	8013966 <fn_0801393C+0x2a>
 8013992:	219b      	movs	r1, #155	@ 0x9b
 8013994:	6820      	ldr	r0, [r4, #0]
 8013996:	f7fd fc39 	bl	801120c <fn_0801120C>
 801399a:	5de2      	ldrb	r2, [r4, r7]
 801399c:	6829      	ldr	r1, [r5, #0]
 801399e:	0053      	lsls	r3, r2, #1
 80139a0:	5988      	ldr	r0, [r1, r6]
 80139a2:	189b      	adds	r3, r3, r2
 80139a4:	00db      	lsls	r3, r3, #3
 80139a6:	581b      	ldr	r3, [r3, r0]
 80139a8:	009b      	lsls	r3, r3, #2
 80139aa:	18e3      	adds	r3, r4, r3
 80139ac:	6fda      	ldr	r2, [r3, #124]	@ 0x7c
 80139ae:	3a01      	subs	r2, #1
 80139b0:	67da      	str	r2, [r3, #124]	@ 0x7c
 80139b2:	2282      	movs	r2, #130	@ 0x82
 80139b4:	4b35      	ldr	r3, [pc, #212]	@ (8013a8c <fn_0801393C+0x150>)
 80139b6:	58cb      	ldr	r3, [r1, r3]
 80139b8:	0092      	lsls	r2, r2, #2
 80139ba:	189b      	adds	r3, r3, r2
 80139bc:	4642      	mov	r2, r8
 80139be:	6812      	ldr	r2, [r2, #0]
 80139c0:	1ad2      	subs	r2, r2, r3
 80139c2:	1052      	asrs	r2, r2, #1
 80139c4:	0053      	lsls	r3, r2, #1
 80139c6:	189b      	adds	r3, r3, r2
 80139c8:	0119      	lsls	r1, r3, #4
 80139ca:	185b      	adds	r3, r3, r1
 80139cc:	0219      	lsls	r1, r3, #8
 80139ce:	185b      	adds	r3, r3, r1
 80139d0:	0419      	lsls	r1, r3, #16
 80139d2:	1859      	adds	r1, r3, r1
 80139d4:	0089      	lsls	r1, r1, #2
 80139d6:	1889      	adds	r1, r1, r2
 80139d8:	0020      	movs	r0, r4
 80139da:	f7fe ff7b 	bl	80128d4 <fn_080128D4>
 80139de:	2280      	movs	r2, #128	@ 0x80
 80139e0:	6827      	ldr	r7, [r4, #0]
 80139e2:	6a3b      	ldr	r3, [r7, #32]
 80139e4:	0038      	movs	r0, r7
 80139e6:	0019      	movs	r1, r3
 80139e8:	04d2      	lsls	r2, r2, #19
 80139ea:	682e      	ldr	r6, [r5, #0]
 80139ec:	9302      	str	r3, [sp, #8]
 80139ee:	f7fc f863 	bl	800fab8 <fn_0800FAB8>
 80139f2:	4b27      	ldr	r3, [pc, #156]	@ (8013a90 <fn_0801393C+0x154>)
 80139f4:	50f0      	str	r0, [r6, r3]
 80139f6:	682b      	ldr	r3, [r5, #0]
 80139f8:	4e26      	ldr	r6, [pc, #152]	@ (8013a94 <fn_0801393C+0x158>)
 80139fa:	4698      	mov	r8, r3
 80139fc:	599b      	ldr	r3, [r3, r6]
 80139fe:	2b00      	cmp	r3, #0
 8013a00:	d024      	beq.n	8013a4c <fn_0801393C+0x110>
 8013a02:	23a8      	movs	r3, #168	@ 0xa8
 8013a04:	58e3      	ldr	r3, [r4, r3]
 8013a06:	6826      	ldr	r6, [r4, #0]
 8013a08:	9302      	str	r3, [sp, #8]
 8013a0a:	f7f3 f879 	bl	8006b00 <fn_08006B00>
 8013a0e:	2103      	movs	r1, #3
 8013a10:	f011 fd6a 	bl	80254e8 <fn_080254E8>
 8013a14:	9b02      	ldr	r3, [sp, #8]
 8013a16:	3101      	adds	r1, #1
 8013a18:	008c      	lsls	r4, r1, #2
 8013a1a:	6a37      	ldr	r7, [r6, #32]
 8013a1c:	1864      	adds	r4, r4, r1
 8013a1e:	2b00      	cmp	r3, #0
 8013a20:	d10a      	bne.n	8013a38 <fn_0801393C+0xfc>
 8013a22:	682a      	ldr	r2, [r5, #0]
 8013a24:	4b1a      	ldr	r3, [pc, #104]	@ (8013a90 <fn_0801393C+0x154>)
 8013a26:	58d3      	ldr	r3, [r2, r3]
 8013a28:	2280      	movs	r2, #128	@ 0x80
 8013a2a:	0039      	movs	r1, r7
 8013a2c:	0030      	movs	r0, r6
 8013a2e:	9400      	str	r4, [sp, #0]
 8013a30:	0512      	lsls	r2, r2, #20
 8013a32:	f7fc f89b 	bl	800fb6c <fn_0800FB6C>
 8013a36:	e796      	b.n	8013966 <fn_0801393C+0x2a>
 8013a38:	f7f3 f862 	bl	8006b00 <fn_08006B00>
 8013a3c:	4680      	mov	r8, r0
 8013a3e:	f7f3 f85f 	bl	8006b00 <fn_08006B00>
 8013a42:	4643      	mov	r3, r8
 8013a44:	1a18      	subs	r0, r3, r0
 8013a46:	0480      	lsls	r0, r0, #18
 8013a48:	183f      	adds	r7, r7, r0
 8013a4a:	e7ea      	b.n	8013a22 <fn_0801393C+0xe6>
 8013a4c:	2280      	movs	r2, #128	@ 0x80
 8013a4e:	9902      	ldr	r1, [sp, #8]
 8013a50:	04d2      	lsls	r2, r2, #19
 8013a52:	1889      	adds	r1, r1, r2
 8013a54:	0038      	movs	r0, r7
 8013a56:	f7fc f82f 	bl	800fab8 <fn_0800FAB8>
 8013a5a:	4642      	mov	r2, r8
 8013a5c:	4b0c      	ldr	r3, [pc, #48]	@ (8013a90 <fn_0801393C+0x154>)
 8013a5e:	50d0      	str	r0, [r2, r3]
 8013a60:	682a      	ldr	r2, [r5, #0]
 8013a62:	5993      	ldr	r3, [r2, r6]
 8013a64:	9203      	str	r2, [sp, #12]
 8013a66:	2b00      	cmp	r3, #0
 8013a68:	d1cb      	bne.n	8013a02 <fn_0801393C+0xc6>
 8013a6a:	20fc      	movs	r0, #252	@ 0xfc
 8013a6c:	2280      	movs	r2, #128	@ 0x80
 8013a6e:	9902      	ldr	r1, [sp, #8]
 8013a70:	0600      	lsls	r0, r0, #24
 8013a72:	1809      	adds	r1, r1, r0
 8013a74:	04d2      	lsls	r2, r2, #19
 8013a76:	0038      	movs	r0, r7
 8013a78:	f7fc f81e 	bl	800fab8 <fn_0800FAB8>
 8013a7c:	9a03      	ldr	r2, [sp, #12]
 8013a7e:	4b04      	ldr	r3, [pc, #16]	@ (8013a90 <fn_0801393C+0x154>)
 8013a80:	50d0      	str	r0, [r2, r3]
 8013a82:	e7be      	b.n	8013a02 <fn_0801393C+0xc6>
 8013a84:	030064c4 	.word	0x030064c4	@ data_030064C4
 8013a88:	00000754 	.word	0x00000754
 8013a8c:	0000074c 	.word	0x0000074c
 8013a90:	00000de4 	.word	0x00000de4
 8013a94:	000008f4 	.word	0x000008f4
