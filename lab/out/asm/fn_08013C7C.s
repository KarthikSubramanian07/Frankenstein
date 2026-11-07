fn_08013C7C:
 8013c7c:	23f4      	movs	r3, #244	@ 0xf4
 8013c7e:	469c      	mov	ip, r3
 8013c80:	b5f0      	push	{r4, r5, r6, r7, lr}
 8013c82:	4646      	mov	r6, r8
 8013c84:	46d6      	mov	lr, sl
 8013c86:	464f      	mov	r7, r9
 8013c88:	0004      	movs	r4, r0
 8013c8a:	4484      	add	ip, r0
 8013c8c:	0005      	movs	r5, r0
 8013c8e:	46e0      	mov	r8, ip
 8013c90:	b5c0      	push	{r6, r7, lr}
 8013c92:	34d4      	adds	r4, #212	@ 0xd4
 8013c94:	6822      	ldr	r2, [r4, #0]
 8013c96:	2a00      	cmp	r2, #0
 8013c98:	d006      	beq.n	8013ca8 <fn_08013C7C+0x2c>
 8013c9a:	6863      	ldr	r3, [r4, #4]
 8013c9c:	1c59      	adds	r1, r3, #1
 8013c9e:	d003      	beq.n	8013ca8 <fn_08013C7C+0x2c>
 8013ca0:	3b01      	subs	r3, #1
 8013ca2:	6063      	str	r3, [r4, #4]
 8013ca4:	2b00      	cmp	r3, #0
 8013ca6:	d011      	beq.n	8013ccc <fn_08013C7C+0x50>
 8013ca8:	3410      	adds	r4, #16
 8013caa:	4544      	cmp	r4, r8
 8013cac:	d1f2      	bne.n	8013c94 <fn_08013C7C+0x18>
 8013cae:	23dc      	movs	r3, #220	@ 0xdc
 8013cb0:	58ea      	ldr	r2, [r5, r3]
 8013cb2:	3310      	adds	r3, #16
 8013cb4:	50ea      	str	r2, [r5, r3]
 8013cb6:	3b0c      	subs	r3, #12
 8013cb8:	58ea      	ldr	r2, [r5, r3]
 8013cba:	3310      	adds	r3, #16
 8013cbc:	50ea      	str	r2, [r5, r3]
 8013cbe:	bce0      	pop	{r5, r6, r7}
 8013cc0:	46ba      	mov	sl, r7
 8013cc2:	46b1      	mov	r9, r6
 8013cc4:	46a8      	mov	r8, r5
 8013cc6:	bcf0      	pop	{r4, r5, r6, r7}
 8013cc8:	bc01      	pop	{r0}
 8013cca:	4700      	bx	r0
 8013ccc:	4e1c      	ldr	r6, [pc, #112]	@ (8013d40 <fn_08013C7C+0xc4>)
 8013cce:	8913      	ldrh	r3, [r2, #8]
 8013cd0:	6831      	ldr	r1, [r6, #0]
 8013cd2:	4a1c      	ldr	r2, [pc, #112]	@ (8013d44 <fn_08013C7C+0xc8>)
 8013cd4:	5c88      	ldrb	r0, [r1, r2]
 8013cd6:	4682      	mov	sl, r0
 8013cd8:	2001      	movs	r0, #1
 8013cda:	5488      	strb	r0, [r1, r2]
 8013cdc:	4a1a      	ldr	r2, [pc, #104]	@ (8013d48 <fn_08013C7C+0xcc>)
 8013cde:	4f1b      	ldr	r7, [pc, #108]	@ (8013d4c <fn_08013C7C+0xd0>)
 8013ce0:	4691      	mov	r9, r2
 8013ce2:	e01a      	b.n	8013d1a <fn_08013C7C+0x9e>
 8013ce4:	6831      	ldr	r1, [r6, #0]
 8013ce6:	009a      	lsls	r2, r3, #2
 8013ce8:	18d2      	adds	r2, r2, r3
 8013cea:	59cb      	ldr	r3, [r1, r7]
 8013cec:	0052      	lsls	r2, r2, #1
 8013cee:	189b      	adds	r3, r3, r2
 8013cf0:	6023      	str	r3, [r4, #0]
 8013cf2:	2204      	movs	r2, #4
 8013cf4:	5e99      	ldrsh	r1, [r3, r2]
 8013cf6:	6061      	str	r1, [r4, #4]
 8013cf8:	88da      	ldrh	r2, [r3, #6]
 8013cfa:	2a00      	cmp	r2, #0
 8013cfc:	d00a      	beq.n	8013d14 <fn_08013C7C+0x98>
 8013cfe:	464b      	mov	r3, r9
 8013d00:	0092      	lsls	r2, r2, #2
 8013d02:	58d3      	ldr	r3, [r2, r3]
 8013d04:	0021      	movs	r1, r4
 8013d06:	0028      	movs	r0, r5
 8013d08:	f000 f824 	bl	8013d54 <fn_08013C7C+0xd8>
 8013d0c:	6823      	ldr	r3, [r4, #0]
 8013d0e:	2b00      	cmp	r3, #0
 8013d10:	d006      	beq.n	8013d20 <fn_08013C7C+0xa4>
 8013d12:	6861      	ldr	r1, [r4, #4]
 8013d14:	891b      	ldrh	r3, [r3, #8]
 8013d16:	2900      	cmp	r1, #0
 8013d18:	d102      	bne.n	8013d20 <fn_08013C7C+0xa4>
 8013d1a:	2b00      	cmp	r3, #0
 8013d1c:	d1e2      	bne.n	8013ce4 <fn_08013C7C+0x68>
 8013d1e:	6023      	str	r3, [r4, #0]
 8013d20:	4653      	mov	r3, sl
 8013d22:	2b00      	cmp	r3, #0
 8013d24:	d1c0      	bne.n	8013ca8 <fn_08013C7C+0x2c>
 8013d26:	6833      	ldr	r3, [r6, #0]
 8013d28:	4a09      	ldr	r2, [pc, #36]	@ (8013d50 <fn_08013C7C+0xd4>)
 8013d2a:	589a      	ldr	r2, [r3, r2]
 8013d2c:	2a00      	cmp	r2, #0
 8013d2e:	d103      	bne.n	8013d38 <fn_08013C7C+0xbc>
 8013d30:	2100      	movs	r1, #0
 8013d32:	4a04      	ldr	r2, [pc, #16]	@ (8013d44 <fn_08013C7C+0xc8>)
 8013d34:	5499      	strb	r1, [r3, r2]
 8013d36:	e7b7      	b.n	8013ca8 <fn_08013C7C+0x2c>
 8013d38:	f7fd f9e0 	bl	80110fc <fn_080110FC>
 8013d3c:	6833      	ldr	r3, [r6, #0]
 8013d3e:	e7f7      	b.n	8013d30 <fn_08013C7C+0xb4>
 8013d40:	030064c4 	.word	0x030064c4
 8013d44:	00000c58 	.word	0x00000c58
 8013d48:	08025c48 	.word	0x08025c48
 8013d4c:	0000074c 	.word	0x0000074c
 8013d50:	00000c5c 	.word	0x00000c5c
 8013d54:	4718      	bx	r3
 8013d56:	46c0      	nop			@ (mov r8, r8)
