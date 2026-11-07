fn_08009A74:
 8009a74:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8009a76:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8009a78:	0004      	movs	r4, r0
 8009a7a:	2a00      	cmp	r2, #0
 8009a7c:	d03e      	beq.n	8009afc <fn_08009A74+0x88>
 8009a7e:	2120      	movs	r1, #32
 8009a80:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8009a82:	320c      	adds	r2, #12
 8009a84:	438b      	bics	r3, r1
 8009a86:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8009a88:	6901      	ldr	r1, [r0, #16]
 8009a8a:	ca0c      	ldmia	r2, {r2, r3}
 8009a8c:	68c0      	ldr	r0, [r0, #12]
 8009a8e:	f01b fdbf 	bl	8025610 <fn_08025610>
 8009a92:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009a94:	6ccb      	ldr	r3, [r1, #76]	@ 0x4c
 8009a96:	6220      	str	r0, [r4, #32]
 8009a98:	035b      	lsls	r3, r3, #13
 8009a9a:	d432      	bmi.n	8009b02 <fn_08009A74+0x8e>
 8009a9c:	2380      	movs	r3, #128	@ 0x80
 8009a9e:	051b      	lsls	r3, r3, #20
 8009aa0:	18c0      	adds	r0, r0, r3
 8009aa2:	6220      	str	r0, [r4, #32]
 8009aa4:	2209      	movs	r2, #9
 8009aa6:	0020      	movs	r0, r4
 8009aa8:	f008 fab8 	bl	801201c <fn_0801201C>
 8009aac:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009aae:	2209      	movs	r2, #9
 8009ab0:	0020      	movs	r0, r4
 8009ab2:	f008 fab3 	bl	801201c <fn_0801201C>
 8009ab6:	2380      	movs	r3, #128	@ 0x80
 8009ab8:	6a04      	ldr	r4, [r0, #32]
 8009aba:	051b      	lsls	r3, r3, #20
 8009abc:	18e4      	adds	r4, r4, r3
 8009abe:	4b16      	ldr	r3, [pc, #88]	@ (8009b18 <fn_08009A74+0xa4>)
 8009ac0:	681a      	ldr	r2, [r3, #0]
 8009ac2:	235a      	movs	r3, #90	@ 0x5a
 8009ac4:	6204      	str	r4, [r0, #32]
 8009ac6:	5cc1      	ldrb	r1, [r0, r3]
 8009ac8:	23ea      	movs	r3, #234	@ 0xea
 8009aca:	00db      	lsls	r3, r3, #3
 8009acc:	58d3      	ldr	r3, [r2, r3]
 8009ace:	225c      	movs	r2, #92	@ 0x5c
 8009ad0:	434a      	muls	r2, r1
 8009ad2:	189b      	adds	r3, r3, r2
 8009ad4:	6bda      	ldr	r2, [r3, #60]	@ 0x3c
 8009ad6:	2380      	movs	r3, #128	@ 0x80
 8009ad8:	0ce4      	lsrs	r4, r4, #19
 8009ada:	011b      	lsls	r3, r3, #4
 8009adc:	4e0f      	ldr	r6, [pc, #60]	@ (8009b1c <fn_08009A74+0xa8>)
 8009ade:	18e3      	adds	r3, r4, r3
 8009ae0:	009b      	lsls	r3, r3, #2
 8009ae2:	58f1      	ldr	r1, [r6, r3]
 8009ae4:	0005      	movs	r5, r0
 8009ae6:	0010      	movs	r0, r2
 8009ae8:	0017      	movs	r7, r2
 8009aea:	f01b fdcf 	bl	802568c <fn_0802568C>
 8009aee:	00a4      	lsls	r4, r4, #2
 8009af0:	63e8      	str	r0, [r5, #60]	@ 0x3c
 8009af2:	59a1      	ldr	r1, [r4, r6]
 8009af4:	0038      	movs	r0, r7
 8009af6:	f01b fdc9 	bl	802568c <fn_0802568C>
 8009afa:	6428      	str	r0, [r5, #64]	@ 0x40
 8009afc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8009afe:	bc01      	pop	{r0}
 8009b00:	4700      	bx	r0
 8009b02:	f7fc fffd 	bl	8006b00 <fn_08006B00>
 8009b06:	0005      	movs	r5, r0
 8009b08:	f7fc fffa 	bl	8006b00 <fn_08006B00>
 8009b0c:	6a23      	ldr	r3, [r4, #32]
 8009b0e:	1a28      	subs	r0, r5, r0
 8009b10:	0540      	lsls	r0, r0, #21
 8009b12:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009b14:	18c0      	adds	r0, r0, r3
 8009b16:	e7c1      	b.n	8009a9c <fn_08009A74+0x28>
 8009b18:	030064c4 	.word	0x030064c4
 8009b1c:	081398a0 	.word	0x081398a0
