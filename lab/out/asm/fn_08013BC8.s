fn_08013BC8:
 8013bc8:	23f4      	movs	r3, #244	@ 0xf4
 8013bca:	469c      	mov	ip, r3
 8013bcc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8013bce:	4646      	mov	r6, r8
 8013bd0:	46d6      	mov	lr, sl
 8013bd2:	464f      	mov	r7, r9
 8013bd4:	0004      	movs	r4, r0
 8013bd6:	4484      	add	ip, r0
 8013bd8:	0005      	movs	r5, r0
 8013bda:	46e0      	mov	r8, ip
 8013bdc:	b5c0      	push	{r6, r7, lr}
 8013bde:	34d4      	adds	r4, #212	@ 0xd4
 8013be0:	6822      	ldr	r2, [r4, #0]
 8013be2:	2a00      	cmp	r2, #0
 8013be4:	d006      	beq.n	8013bf4 <fn_08013BC8+0x2c>
 8013be6:	6863      	ldr	r3, [r4, #4]
 8013be8:	1c59      	adds	r1, r3, #1
 8013bea:	d003      	beq.n	8013bf4 <fn_08013BC8+0x2c>
 8013bec:	3b01      	subs	r3, #1
 8013bee:	6063      	str	r3, [r4, #4]
 8013bf0:	2b00      	cmp	r3, #0
 8013bf2:	d011      	beq.n	8013c18 <fn_08013BC8+0x50>
 8013bf4:	3410      	adds	r4, #16
 8013bf6:	4544      	cmp	r4, r8
 8013bf8:	d1f2      	bne.n	8013be0 <fn_08013BC8+0x18>
 8013bfa:	23dc      	movs	r3, #220	@ 0xdc
 8013bfc:	58ea      	ldr	r2, [r5, r3]
 8013bfe:	3310      	adds	r3, #16
 8013c00:	50ea      	str	r2, [r5, r3]
 8013c02:	3b0c      	subs	r3, #12
 8013c04:	58ea      	ldr	r2, [r5, r3]
 8013c06:	3310      	adds	r3, #16
 8013c08:	50ea      	str	r2, [r5, r3]
 8013c0a:	bce0      	pop	{r5, r6, r7}
 8013c0c:	46ba      	mov	sl, r7
 8013c0e:	46b1      	mov	r9, r6
 8013c10:	46a8      	mov	r8, r5
 8013c12:	bcf0      	pop	{r4, r5, r6, r7}
 8013c14:	bc01      	pop	{r0}
 8013c16:	4700      	bx	r0
 8013c18:	4e1c      	ldr	r6, [pc, #112]	@ (8013c8c <fn_08013BC8+0xc4>)
 8013c1a:	8913      	ldrh	r3, [r2, #8]
 8013c1c:	6831      	ldr	r1, [r6, #0]
 8013c1e:	4a1c      	ldr	r2, [pc, #112]	@ (8013c90 <fn_08013BC8+0xc8>)
 8013c20:	5c88      	ldrb	r0, [r1, r2]
 8013c22:	4682      	mov	sl, r0
 8013c24:	2001      	movs	r0, #1
 8013c26:	5488      	strb	r0, [r1, r2]
 8013c28:	4a1a      	ldr	r2, [pc, #104]	@ (8013c94 <fn_08013BC8+0xcc>)
 8013c2a:	4f1b      	ldr	r7, [pc, #108]	@ (8013c98 <fn_08013BC8+0xd0>)
 8013c2c:	4691      	mov	r9, r2
 8013c2e:	e01a      	b.n	8013c66 <fn_08013BC8+0x9e>
 8013c30:	6831      	ldr	r1, [r6, #0]
 8013c32:	009a      	lsls	r2, r3, #2
 8013c34:	18d2      	adds	r2, r2, r3
 8013c36:	59cb      	ldr	r3, [r1, r7]
 8013c38:	0052      	lsls	r2, r2, #1
 8013c3a:	189b      	adds	r3, r3, r2
 8013c3c:	6023      	str	r3, [r4, #0]
 8013c3e:	2204      	movs	r2, #4
 8013c40:	5e99      	ldrsh	r1, [r3, r2]
 8013c42:	6061      	str	r1, [r4, #4]
 8013c44:	88da      	ldrh	r2, [r3, #6]
 8013c46:	2a00      	cmp	r2, #0
 8013c48:	d00a      	beq.n	8013c60 <fn_08013BC8+0x98>
 8013c4a:	464b      	mov	r3, r9
 8013c4c:	0092      	lsls	r2, r2, #2
 8013c4e:	58d3      	ldr	r3, [r2, r3]
 8013c50:	0021      	movs	r1, r4
 8013c52:	0028      	movs	r0, r5
 8013c54:	f000 f824 	bl	8013ca0 <fn_08013BC8+0xd8>
 8013c58:	6823      	ldr	r3, [r4, #0]
 8013c5a:	2b00      	cmp	r3, #0
 8013c5c:	d006      	beq.n	8013c6c <fn_08013BC8+0xa4>
 8013c5e:	6861      	ldr	r1, [r4, #4]
 8013c60:	891b      	ldrh	r3, [r3, #8]
 8013c62:	2900      	cmp	r1, #0
 8013c64:	d102      	bne.n	8013c6c <fn_08013BC8+0xa4>
 8013c66:	2b00      	cmp	r3, #0
 8013c68:	d1e2      	bne.n	8013c30 <fn_08013BC8+0x68>
 8013c6a:	6023      	str	r3, [r4, #0]
 8013c6c:	4653      	mov	r3, sl
 8013c6e:	2b00      	cmp	r3, #0
 8013c70:	d1c0      	bne.n	8013bf4 <fn_08013BC8+0x2c>
 8013c72:	6833      	ldr	r3, [r6, #0]
 8013c74:	4a09      	ldr	r2, [pc, #36]	@ (8013c9c <fn_08013BC8+0xd4>)
 8013c76:	589a      	ldr	r2, [r3, r2]
 8013c78:	2a00      	cmp	r2, #0
 8013c7a:	d103      	bne.n	8013c84 <fn_08013BC8+0xbc>
 8013c7c:	2100      	movs	r1, #0
 8013c7e:	4a04      	ldr	r2, [pc, #16]	@ (8013c90 <fn_08013BC8+0xc8>)
 8013c80:	5499      	strb	r1, [r3, r2]
 8013c82:	e7b7      	b.n	8013bf4 <fn_08013BC8+0x2c>
 8013c84:	f7fd fa3a 	bl	80110fc <fn_080110FC>
 8013c88:	6833      	ldr	r3, [r6, #0]
 8013c8a:	e7f7      	b.n	8013c7c <fn_08013BC8+0xb4>
 8013c8c:	030064c4 	.word	0x030064c4
 8013c90:	00000c58 	.word	0x00000c58
 8013c94:	08025b98 	.word	0x08025b98
 8013c98:	0000074c 	.word	0x0000074c
 8013c9c:	00000c5c 	.word	0x00000c5c
 8013ca0:	4718      	bx	r3
 8013ca2:	46c0      	nop			@ (mov r8, r8)
