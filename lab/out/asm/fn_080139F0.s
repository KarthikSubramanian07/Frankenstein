fn_080139F0:
 80139f0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80139f2:	46c6      	mov	lr, r8
 80139f4:	2753      	movs	r7, #83	@ 0x53
 80139f6:	b500      	push	{lr}
 80139f8:	4d4f      	ldr	r5, [pc, #316]	@ (8013b38 <fn_080139F0+0x148>)
 80139fa:	5dc2      	ldrb	r2, [r0, r7]
 80139fc:	682b      	ldr	r3, [r5, #0]
 80139fe:	4e4f      	ldr	r6, [pc, #316]	@ (8013b3c <fn_080139F0+0x14c>)
 8013a00:	4688      	mov	r8, r1
 8013a02:	5999      	ldr	r1, [r3, r6]
 8013a04:	0053      	lsls	r3, r2, #1
 8013a06:	189b      	adds	r3, r3, r2
 8013a08:	00db      	lsls	r3, r3, #3
 8013a0a:	585b      	ldr	r3, [r3, r1]
 8013a0c:	009b      	lsls	r3, r3, #2
 8013a0e:	18c3      	adds	r3, r0, r3
 8013a10:	6fdb      	ldr	r3, [r3, #124]	@ 0x7c
 8013a12:	0004      	movs	r4, r0
 8013a14:	b084      	sub	sp, #16
 8013a16:	2b00      	cmp	r3, #0
 8013a18:	d105      	bne.n	8013a26 <fn_080139F0+0x36>
 8013a1a:	b004      	add	sp, #16
 8013a1c:	bc80      	pop	{r7}
 8013a1e:	46b8      	mov	r8, r7
 8013a20:	bcf0      	pop	{r4, r5, r6, r7}
 8013a22:	bc01      	pop	{r0}
 8013a24:	4700      	bx	r0
 8013a26:	2101      	movs	r1, #1
 8013a28:	6800      	ldr	r0, [r0, #0]
 8013a2a:	f006 fca7 	bl	801a37c <fn_0801A37C>
 8013a2e:	682b      	ldr	r3, [r5, #0]
 8013a30:	5de2      	ldrb	r2, [r4, r7]
 8013a32:	5999      	ldr	r1, [r3, r6]
 8013a34:	0053      	lsls	r3, r2, #1
 8013a36:	189b      	adds	r3, r3, r2
 8013a38:	00db      	lsls	r3, r3, #3
 8013a3a:	585b      	ldr	r3, [r3, r1]
 8013a3c:	009b      	lsls	r3, r3, #2
 8013a3e:	18e3      	adds	r3, r4, r3
 8013a40:	6fdb      	ldr	r3, [r3, #124]	@ 0x7c
 8013a42:	2b00      	cmp	r3, #0
 8013a44:	d0e9      	beq.n	8013a1a <fn_080139F0+0x2a>
 8013a46:	219b      	movs	r1, #155	@ 0x9b
 8013a48:	6820      	ldr	r0, [r4, #0]
 8013a4a:	f7fd fbdf 	bl	801120c <fn_0801120C>
 8013a4e:	5de2      	ldrb	r2, [r4, r7]
 8013a50:	6829      	ldr	r1, [r5, #0]
 8013a52:	0053      	lsls	r3, r2, #1
 8013a54:	5988      	ldr	r0, [r1, r6]
 8013a56:	189b      	adds	r3, r3, r2
 8013a58:	00db      	lsls	r3, r3, #3
 8013a5a:	581b      	ldr	r3, [r3, r0]
 8013a5c:	009b      	lsls	r3, r3, #2
 8013a5e:	18e3      	adds	r3, r4, r3
 8013a60:	6fda      	ldr	r2, [r3, #124]	@ 0x7c
 8013a62:	3a01      	subs	r2, #1
 8013a64:	67da      	str	r2, [r3, #124]	@ 0x7c
 8013a66:	2282      	movs	r2, #130	@ 0x82
 8013a68:	4b35      	ldr	r3, [pc, #212]	@ (8013b40 <fn_080139F0+0x150>)
 8013a6a:	58cb      	ldr	r3, [r1, r3]
 8013a6c:	0092      	lsls	r2, r2, #2
 8013a6e:	189b      	adds	r3, r3, r2
 8013a70:	4642      	mov	r2, r8
 8013a72:	6812      	ldr	r2, [r2, #0]
 8013a74:	1ad2      	subs	r2, r2, r3
 8013a76:	1052      	asrs	r2, r2, #1
 8013a78:	0053      	lsls	r3, r2, #1
 8013a7a:	189b      	adds	r3, r3, r2
 8013a7c:	0119      	lsls	r1, r3, #4
 8013a7e:	185b      	adds	r3, r3, r1
 8013a80:	0219      	lsls	r1, r3, #8
 8013a82:	185b      	adds	r3, r3, r1
 8013a84:	0419      	lsls	r1, r3, #16
 8013a86:	1859      	adds	r1, r3, r1
 8013a88:	0089      	lsls	r1, r1, #2
 8013a8a:	1889      	adds	r1, r1, r2
 8013a8c:	0020      	movs	r0, r4
 8013a8e:	f7fe ff21 	bl	80128d4 <fn_080128D4>
 8013a92:	2280      	movs	r2, #128	@ 0x80
 8013a94:	6827      	ldr	r7, [r4, #0]
 8013a96:	6a3b      	ldr	r3, [r7, #32]
 8013a98:	0038      	movs	r0, r7
 8013a9a:	0019      	movs	r1, r3
 8013a9c:	04d2      	lsls	r2, r2, #19
 8013a9e:	682e      	ldr	r6, [r5, #0]
 8013aa0:	9302      	str	r3, [sp, #8]
 8013aa2:	f7fc f809 	bl	800fab8 <fn_0800FAB8>
 8013aa6:	4b27      	ldr	r3, [pc, #156]	@ (8013b44 <fn_080139F0+0x154>)
 8013aa8:	50f0      	str	r0, [r6, r3]
 8013aaa:	682b      	ldr	r3, [r5, #0]
 8013aac:	4e26      	ldr	r6, [pc, #152]	@ (8013b48 <fn_080139F0+0x158>)
 8013aae:	4698      	mov	r8, r3
 8013ab0:	599b      	ldr	r3, [r3, r6]
 8013ab2:	2b00      	cmp	r3, #0
 8013ab4:	d024      	beq.n	8013b00 <fn_080139F0+0x110>
 8013ab6:	23a8      	movs	r3, #168	@ 0xa8
 8013ab8:	58e3      	ldr	r3, [r4, r3]
 8013aba:	6826      	ldr	r6, [r4, #0]
 8013abc:	9302      	str	r3, [sp, #8]
 8013abe:	f7f3 f81f 	bl	8006b00 <fn_08006B00>
 8013ac2:	2103      	movs	r1, #3
 8013ac4:	f011 fd68 	bl	8025598 <fn_08025598>
 8013ac8:	9b02      	ldr	r3, [sp, #8]
 8013aca:	3101      	adds	r1, #1
 8013acc:	008c      	lsls	r4, r1, #2
 8013ace:	6a37      	ldr	r7, [r6, #32]
 8013ad0:	1864      	adds	r4, r4, r1
 8013ad2:	2b00      	cmp	r3, #0
 8013ad4:	d10a      	bne.n	8013aec <fn_080139F0+0xfc>
 8013ad6:	682a      	ldr	r2, [r5, #0]
 8013ad8:	4b1a      	ldr	r3, [pc, #104]	@ (8013b44 <fn_080139F0+0x154>)
 8013ada:	58d3      	ldr	r3, [r2, r3]
 8013adc:	2280      	movs	r2, #128	@ 0x80
 8013ade:	0039      	movs	r1, r7
 8013ae0:	0030      	movs	r0, r6
 8013ae2:	9400      	str	r4, [sp, #0]
 8013ae4:	0512      	lsls	r2, r2, #20
 8013ae6:	f7fc f841 	bl	800fb6c <fn_0800FB6C>
 8013aea:	e796      	b.n	8013a1a <fn_080139F0+0x2a>
 8013aec:	f7f3 f808 	bl	8006b00 <fn_08006B00>
 8013af0:	4680      	mov	r8, r0
 8013af2:	f7f3 f805 	bl	8006b00 <fn_08006B00>
 8013af6:	4643      	mov	r3, r8
 8013af8:	1a18      	subs	r0, r3, r0
 8013afa:	0480      	lsls	r0, r0, #18
 8013afc:	183f      	adds	r7, r7, r0
 8013afe:	e7ea      	b.n	8013ad6 <fn_080139F0+0xe6>
 8013b00:	2280      	movs	r2, #128	@ 0x80
 8013b02:	9902      	ldr	r1, [sp, #8]
 8013b04:	04d2      	lsls	r2, r2, #19
 8013b06:	1889      	adds	r1, r1, r2
 8013b08:	0038      	movs	r0, r7
 8013b0a:	f7fb ffd5 	bl	800fab8 <fn_0800FAB8>
 8013b0e:	4642      	mov	r2, r8
 8013b10:	4b0c      	ldr	r3, [pc, #48]	@ (8013b44 <fn_080139F0+0x154>)
 8013b12:	50d0      	str	r0, [r2, r3]
 8013b14:	682a      	ldr	r2, [r5, #0]
 8013b16:	5993      	ldr	r3, [r2, r6]
 8013b18:	9203      	str	r2, [sp, #12]
 8013b1a:	2b00      	cmp	r3, #0
 8013b1c:	d1cb      	bne.n	8013ab6 <fn_080139F0+0xc6>
 8013b1e:	20fc      	movs	r0, #252	@ 0xfc
 8013b20:	2280      	movs	r2, #128	@ 0x80
 8013b22:	9902      	ldr	r1, [sp, #8]
 8013b24:	0600      	lsls	r0, r0, #24
 8013b26:	1809      	adds	r1, r1, r0
 8013b28:	04d2      	lsls	r2, r2, #19
 8013b2a:	0038      	movs	r0, r7
 8013b2c:	f7fb ffc4 	bl	800fab8 <fn_0800FAB8>
 8013b30:	9a03      	ldr	r2, [sp, #12]
 8013b32:	4b04      	ldr	r3, [pc, #16]	@ (8013b44 <fn_080139F0+0x154>)
 8013b34:	50d0      	str	r0, [r2, r3]
 8013b36:	e7be      	b.n	8013ab6 <fn_080139F0+0xc6>
 8013b38:	030064c4 	.word	0x030064c4
 8013b3c:	00000754 	.word	0x00000754
 8013b40:	0000074c 	.word	0x0000074c
 8013b44:	00000de4 	.word	0x00000de4
 8013b48:	000008f4 	.word	0x000008f4
