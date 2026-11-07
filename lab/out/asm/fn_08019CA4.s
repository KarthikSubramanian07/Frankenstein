fn_08019CA4:
 8019ca4:	b5f0      	push	{r4, r5, r6, r7, lr}
 8019ca6:	0005      	movs	r5, r0
 8019ca8:	46c6      	mov	lr, r8
 8019caa:	68c0      	ldr	r0, [r0, #12]
 8019cac:	4698      	mov	r8, r3
 8019cae:	1a43      	subs	r3, r0, r1
 8019cb0:	468c      	mov	ip, r1
 8019cb2:	17d9      	asrs	r1, r3, #31
 8019cb4:	185b      	adds	r3, r3, r1
 8019cb6:	404b      	eors	r3, r1
 8019cb8:	6929      	ldr	r1, [r5, #16]
 8019cba:	1a8c      	subs	r4, r1, r2
 8019cbc:	17e7      	asrs	r7, r4, #31
 8019cbe:	19e4      	adds	r4, r4, r7
 8019cc0:	407c      	eors	r4, r7
 8019cc2:	b500      	push	{lr}
 8019cc4:	191e      	adds	r6, r3, r4
 8019cc6:	42a3      	cmp	r3, r4
 8019cc8:	dd00      	ble.n	8019ccc <fn_08019CA4+0x28>
 8019cca:	0023      	movs	r3, r4
 8019ccc:	105b      	asrs	r3, r3, #1
 8019cce:	1af7      	subs	r7, r6, r3
 8019cd0:	429e      	cmp	r6, r3
 8019cd2:	d035      	beq.n	8019d40 <fn_08019CA4+0x9c>
 8019cd4:	2396      	movs	r3, #150	@ 0x96
 8019cd6:	2400      	movs	r4, #0
 8019cd8:	04db      	lsls	r3, r3, #19
 8019cda:	429f      	cmp	r7, r3
 8019cdc:	dd05      	ble.n	8019cea <fn_08019CA4+0x46>
 8019cde:	0020      	movs	r0, r4
 8019ce0:	bc80      	pop	{r7}
 8019ce2:	46b8      	mov	r8, r7
 8019ce4:	bcf0      	pop	{r4, r5, r6, r7}
 8019ce6:	bc02      	pop	{r1}
 8019ce8:	4708      	bx	r1
 8019cea:	0013      	movs	r3, r2
 8019cec:	4662      	mov	r2, ip
 8019cee:	f00b fc8f 	bl	8025610 <fn_08025610>
 8019cf2:	6a2b      	ldr	r3, [r5, #32]
 8019cf4:	4283      	cmp	r3, r0
 8019cf6:	4164      	adcs	r4, r4
 8019cf8:	1b00      	subs	r0, r0, r4
 8019cfa:	1ac0      	subs	r0, r0, r3
 8019cfc:	0cc0      	lsrs	r0, r0, #19
 8019cfe:	4b16      	ldr	r3, [pc, #88]	@ (8019d58 <fn_08019CA4+0xb4>)
 8019d00:	0080      	lsls	r0, r0, #2
 8019d02:	58c1      	ldr	r1, [r0, r3]
 8019d04:	20c0      	movs	r0, #192	@ 0xc0
 8019d06:	03c0      	lsls	r0, r0, #15
 8019d08:	f00b fcc0 	bl	802568c <fn_0802568C>
 8019d0c:	2380      	movs	r3, #128	@ 0x80
 8019d0e:	9a06      	ldr	r2, [sp, #24]
 8019d10:	1400      	asrs	r0, r0, #16
 8019d12:	1a1b      	subs	r3, r3, r0
 8019d14:	6013      	str	r3, [r2, #0]
 8019d16:	4b11      	ldr	r3, [pc, #68]	@ (8019d5c <fn_08019CA4+0xb8>)
 8019d18:	681a      	ldr	r2, [r3, #0]
 8019d1a:	4b11      	ldr	r3, [pc, #68]	@ (8019d60 <fn_08019CA4+0xbc>)
 8019d1c:	58d0      	ldr	r0, [r2, r3]
 8019d1e:	4b11      	ldr	r3, [pc, #68]	@ (8019d64 <fn_08019CA4+0xc0>)
 8019d20:	429f      	cmp	r7, r3
 8019d22:	dd17      	ble.n	8019d54 <fn_08019CA4+0xb0>
 8019d24:	2396      	movs	r3, #150	@ 0x96
 8019d26:	04db      	lsls	r3, r3, #19
 8019d28:	1bdb      	subs	r3, r3, r7
 8019d2a:	141b      	asrs	r3, r3, #16
 8019d2c:	2182      	movs	r1, #130	@ 0x82
 8019d2e:	4358      	muls	r0, r3
 8019d30:	f00b fc86 	bl	8025640 <fn_08025640>
 8019d34:	4643      	mov	r3, r8
 8019d36:	17c4      	asrs	r4, r0, #31
 8019d38:	1a24      	subs	r4, r4, r0
 8019d3a:	6018      	str	r0, [r3, #0]
 8019d3c:	0fe4      	lsrs	r4, r4, #31
 8019d3e:	e7ce      	b.n	8019cde <fn_08019CA4+0x3a>
 8019d40:	4b06      	ldr	r3, [pc, #24]	@ (8019d5c <fn_08019CA4+0xb8>)
 8019d42:	681a      	ldr	r2, [r3, #0]
 8019d44:	4b06      	ldr	r3, [pc, #24]	@ (8019d60 <fn_08019CA4+0xbc>)
 8019d46:	58d3      	ldr	r3, [r2, r3]
 8019d48:	4642      	mov	r2, r8
 8019d4a:	17dc      	asrs	r4, r3, #31
 8019d4c:	1ae4      	subs	r4, r4, r3
 8019d4e:	6013      	str	r3, [r2, #0]
 8019d50:	0fe4      	lsrs	r4, r4, #31
 8019d52:	e7c4      	b.n	8019cde <fn_08019CA4+0x3a>
 8019d54:	00c0      	lsls	r0, r0, #3
 8019d56:	e7ed      	b.n	8019d34 <fn_08019CA4+0x90>
 8019d58:	081398a0 	.word	0x081398a0
 8019d5c:	030064c4 	.word	0x030064c4
 8019d60:	00005630 	.word	0x00005630
 8019d64:	009fffff 	.word	0x009fffff
