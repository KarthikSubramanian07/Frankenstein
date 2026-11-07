fn_08019BF0:
 8019bf0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8019bf2:	0005      	movs	r5, r0
 8019bf4:	46c6      	mov	lr, r8
 8019bf6:	68c0      	ldr	r0, [r0, #12]
 8019bf8:	4698      	mov	r8, r3
 8019bfa:	1a43      	subs	r3, r0, r1
 8019bfc:	468c      	mov	ip, r1
 8019bfe:	17d9      	asrs	r1, r3, #31
 8019c00:	185b      	adds	r3, r3, r1
 8019c02:	404b      	eors	r3, r1
 8019c04:	6929      	ldr	r1, [r5, #16]
 8019c06:	1a8c      	subs	r4, r1, r2
 8019c08:	17e7      	asrs	r7, r4, #31
 8019c0a:	19e4      	adds	r4, r4, r7
 8019c0c:	407c      	eors	r4, r7
 8019c0e:	b500      	push	{lr}
 8019c10:	191e      	adds	r6, r3, r4
 8019c12:	42a3      	cmp	r3, r4
 8019c14:	dd00      	ble.n	8019c18 <fn_08019BF0+0x28>
 8019c16:	0023      	movs	r3, r4
 8019c18:	105b      	asrs	r3, r3, #1
 8019c1a:	1af7      	subs	r7, r6, r3
 8019c1c:	429e      	cmp	r6, r3
 8019c1e:	d035      	beq.n	8019c8c <fn_08019BF0+0x9c>
 8019c20:	2396      	movs	r3, #150	@ 0x96
 8019c22:	2400      	movs	r4, #0
 8019c24:	04db      	lsls	r3, r3, #19
 8019c26:	429f      	cmp	r7, r3
 8019c28:	dd05      	ble.n	8019c36 <fn_08019BF0+0x46>
 8019c2a:	0020      	movs	r0, r4
 8019c2c:	bc80      	pop	{r7}
 8019c2e:	46b8      	mov	r8, r7
 8019c30:	bcf0      	pop	{r4, r5, r6, r7}
 8019c32:	bc02      	pop	{r1}
 8019c34:	4708      	bx	r1
 8019c36:	0013      	movs	r3, r2
 8019c38:	4662      	mov	r2, ip
 8019c3a:	f00b fc91 	bl	8025560 <fn_08025560>
 8019c3e:	6a2b      	ldr	r3, [r5, #32]
 8019c40:	4283      	cmp	r3, r0
 8019c42:	4164      	adcs	r4, r4
 8019c44:	1b00      	subs	r0, r0, r4
 8019c46:	1ac0      	subs	r0, r0, r3
 8019c48:	0cc0      	lsrs	r0, r0, #19
 8019c4a:	4b16      	ldr	r3, [pc, #88]	@ (8019ca4 <fn_08019BF0+0xb4>)
 8019c4c:	0080      	lsls	r0, r0, #2
 8019c4e:	58c1      	ldr	r1, [r0, r3]
 8019c50:	20c0      	movs	r0, #192	@ 0xc0
 8019c52:	03c0      	lsls	r0, r0, #15
 8019c54:	f00b fcc2 	bl	80255dc <fn_080255DC>
 8019c58:	2380      	movs	r3, #128	@ 0x80
 8019c5a:	9a06      	ldr	r2, [sp, #24]
 8019c5c:	1400      	asrs	r0, r0, #16
 8019c5e:	1a1b      	subs	r3, r3, r0
 8019c60:	6013      	str	r3, [r2, #0]
 8019c62:	4b11      	ldr	r3, [pc, #68]	@ (8019ca8 <fn_08019BF0+0xb8>)
 8019c64:	681a      	ldr	r2, [r3, #0]
 8019c66:	4b11      	ldr	r3, [pc, #68]	@ (8019cac <fn_08019BF0+0xbc>)
 8019c68:	58d0      	ldr	r0, [r2, r3]
 8019c6a:	4b11      	ldr	r3, [pc, #68]	@ (8019cb0 <fn_08019BF0+0xc0>)
 8019c6c:	429f      	cmp	r7, r3
 8019c6e:	dd17      	ble.n	8019ca0 <fn_08019BF0+0xb0>
 8019c70:	2396      	movs	r3, #150	@ 0x96
 8019c72:	04db      	lsls	r3, r3, #19
 8019c74:	1bdb      	subs	r3, r3, r7
 8019c76:	141b      	asrs	r3, r3, #16
 8019c78:	2182      	movs	r1, #130	@ 0x82
 8019c7a:	4358      	muls	r0, r3
 8019c7c:	f00b fc88 	bl	8025590 <fn_08025590>
 8019c80:	4643      	mov	r3, r8
 8019c82:	17c4      	asrs	r4, r0, #31
 8019c84:	1a24      	subs	r4, r4, r0
 8019c86:	6018      	str	r0, [r3, #0]
 8019c88:	0fe4      	lsrs	r4, r4, #31
 8019c8a:	e7ce      	b.n	8019c2a <fn_08019BF0+0x3a>
 8019c8c:	4b06      	ldr	r3, [pc, #24]	@ (8019ca8 <fn_08019BF0+0xb8>)
 8019c8e:	681a      	ldr	r2, [r3, #0]
 8019c90:	4b06      	ldr	r3, [pc, #24]	@ (8019cac <fn_08019BF0+0xbc>)
 8019c92:	58d3      	ldr	r3, [r2, r3]
 8019c94:	4642      	mov	r2, r8
 8019c96:	17dc      	asrs	r4, r3, #31
 8019c98:	1ae4      	subs	r4, r4, r3
 8019c9a:	6013      	str	r3, [r2, #0]
 8019c9c:	0fe4      	lsrs	r4, r4, #31
 8019c9e:	e7c4      	b.n	8019c2a <fn_08019BF0+0x3a>
 8019ca0:	00c0      	lsls	r0, r0, #3
 8019ca2:	e7ed      	b.n	8019c80 <fn_08019BF0+0x90>
 8019ca4:	081397cc 	.word	0x081397cc
 8019ca8:	030064c4 	.word	0x030064c4
 8019cac:	00005630 	.word	0x00005630
 8019cb0:	009fffff 	.word	0x009fffff
