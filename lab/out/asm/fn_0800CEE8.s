fn_0800CEE8:
 800cee8:	b5f0      	push	{r4, r5, r6, r7, lr}
 800ceea:	46c6      	mov	lr, r8
 800ceec:	0004      	movs	r4, r0
 800ceee:	b500      	push	{lr}
 800cef0:	2905      	cmp	r1, #5
 800cef2:	d038      	beq.n	800cf66 <fn_0800CEE8+0x7e>
 800cef4:	258c      	movs	r5, #140	@ 0x8c
 800cef6:	008b      	lsls	r3, r1, #2
 800cef8:	18c3      	adds	r3, r0, r3
 800cefa:	595d      	ldr	r5, [r3, r5]
 800cefc:	6fd8      	ldr	r0, [r3, #124]	@ 0x7c
 800cefe:	46ac      	mov	ip, r5
 800cf00:	42a8      	cmp	r0, r5
 800cf02:	d030      	beq.n	800cf66 <fn_0800CEE8+0x7e>
 800cf04:	26eb      	movs	r6, #235	@ 0xeb
 800cf06:	4d30      	ldr	r5, [pc, #192]	@ (800cfc8 <fn_0800CEE8+0xe0>)
 800cf08:	682d      	ldr	r5, [r5, #0]
 800cf0a:	00f6      	lsls	r6, r6, #3
 800cf0c:	002f      	movs	r7, r5
 800cf0e:	59ad      	ldr	r5, [r5, r6]
 800cf10:	2600      	movs	r6, #0
 800cf12:	46b0      	mov	r8, r6
 800cf14:	4488      	add	r8, r1
 800cf16:	4646      	mov	r6, r8
 800cf18:	00b6      	lsls	r6, r6, #2
 800cf1a:	19ad      	adds	r5, r5, r6
 800cf1c:	6c6d      	ldr	r5, [r5, #68]	@ 0x44
 800cf1e:	2a00      	cmp	r2, #0
 800cf20:	d11e      	bne.n	800cf60 <fn_0800CEE8+0x78>
 800cf22:	0fea      	lsrs	r2, r5, #31
 800cf24:	1952      	adds	r2, r2, r5
 800cf26:	1052      	asrs	r2, r2, #1
 800cf28:	26d6      	movs	r6, #214	@ 0xd6
 800cf2a:	5dbd      	ldrb	r5, [r7, r6]
 800cf2c:	3ed2      	subs	r6, #210	@ 0xd2
 800cf2e:	43b5      	bics	r5, r6
 800cf30:	d100      	bne.n	800cf34 <fn_0800CEE8+0x4c>
 800cf32:	0052      	lsls	r2, r2, #1
 800cf34:	1882      	adds	r2, r0, r2
 800cf36:	4562      	cmp	r2, ip
 800cf38:	dd00      	ble.n	800cf3c <fn_0800CEE8+0x54>
 800cf3a:	4662      	mov	r2, ip
 800cf3c:	67da      	str	r2, [r3, #124]	@ 0x7c
 800cf3e:	2800      	cmp	r0, #0
 800cf40:	d108      	bne.n	800cf54 <fn_0800CEE8+0x6c>
 800cf42:	2902      	cmp	r1, #2
 800cf44:	d029      	beq.n	800cf9a <fn_0800CEE8+0xb2>
 800cf46:	d81b      	bhi.n	800cf80 <fn_0800CEE8+0x98>
 800cf48:	2900      	cmp	r1, #0
 800cf4a:	d00e      	beq.n	800cf6a <fn_0800CEE8+0x82>
 800cf4c:	2353      	movs	r3, #83	@ 0x53
 800cf4e:	5ce3      	ldrb	r3, [r4, r3]
 800cf50:	2b01      	cmp	r3, #1
 800cf52:	d92d      	bls.n	800cfb0 <fn_0800CEE8+0xc8>
 800cf54:	2001      	movs	r0, #1
 800cf56:	bc80      	pop	{r7}
 800cf58:	46b8      	mov	r8, r7
 800cf5a:	bcf0      	pop	{r4, r5, r6, r7}
 800cf5c:	bc02      	pop	{r1}
 800cf5e:	4708      	bx	r1
 800cf60:	4355      	muls	r5, r2
 800cf62:	002a      	movs	r2, r5
 800cf64:	e7e0      	b.n	800cf28 <fn_0800CEE8+0x40>
 800cf66:	2000      	movs	r0, #0
 800cf68:	e7f5      	b.n	800cf56 <fn_0800CEE8+0x6e>
 800cf6a:	2353      	movs	r3, #83	@ 0x53
 800cf6c:	5ce3      	ldrb	r3, [r4, r3]
 800cf6e:	2b00      	cmp	r3, #0
 800cf70:	d1f0      	bne.n	800cf54 <fn_0800CEE8+0x6c>
 800cf72:	6e63      	ldr	r3, [r4, #100]	@ 0x64
 800cf74:	2b00      	cmp	r3, #0
 800cf76:	d022      	beq.n	800cfbe <fn_0800CEE8+0xd6>
 800cf78:	2354      	movs	r3, #84	@ 0x54
 800cf7a:	2203      	movs	r2, #3
 800cf7c:	54e2      	strb	r2, [r4, r3]
 800cf7e:	e7e9      	b.n	800cf54 <fn_0800CEE8+0x6c>
 800cf80:	2903      	cmp	r1, #3
 800cf82:	d1e7      	bne.n	800cf54 <fn_0800CEE8+0x6c>
 800cf84:	2353      	movs	r3, #83	@ 0x53
 800cf86:	5ce3      	ldrb	r3, [r4, r3]
 800cf88:	2b00      	cmp	r3, #0
 800cf8a:	d1e3      	bne.n	800cf54 <fn_0800CEE8+0x6c>
 800cf8c:	6ea3      	ldr	r3, [r4, #104]	@ 0x68
 800cf8e:	2b00      	cmp	r3, #0
 800cf90:	d0e0      	beq.n	800cf54 <fn_0800CEE8+0x6c>
 800cf92:	2354      	movs	r3, #84	@ 0x54
 800cf94:	2204      	movs	r2, #4
 800cf96:	54e2      	strb	r2, [r4, r3]
 800cf98:	e7dc      	b.n	800cf54 <fn_0800CEE8+0x6c>
 800cf9a:	2353      	movs	r3, #83	@ 0x53
 800cf9c:	5ce3      	ldrb	r3, [r4, r3]
 800cf9e:	2b01      	cmp	r3, #1
 800cfa0:	d8d8      	bhi.n	800cf54 <fn_0800CEE8+0x6c>
 800cfa2:	6ee3      	ldr	r3, [r4, #108]	@ 0x6c
 800cfa4:	2b00      	cmp	r3, #0
 800cfa6:	d0d5      	beq.n	800cf54 <fn_0800CEE8+0x6c>
 800cfa8:	2354      	movs	r3, #84	@ 0x54
 800cfaa:	2205      	movs	r2, #5
 800cfac:	54e2      	strb	r2, [r4, r3]
 800cfae:	e7d1      	b.n	800cf54 <fn_0800CEE8+0x6c>
 800cfb0:	6e23      	ldr	r3, [r4, #96]	@ 0x60
 800cfb2:	2b00      	cmp	r3, #0
 800cfb4:	d0ce      	beq.n	800cf54 <fn_0800CEE8+0x6c>
 800cfb6:	2354      	movs	r3, #84	@ 0x54
 800cfb8:	2202      	movs	r2, #2
 800cfba:	54e2      	strb	r2, [r4, r3]
 800cfbc:	e7ca      	b.n	800cf54 <fn_0800CEE8+0x6c>
 800cfbe:	2354      	movs	r3, #84	@ 0x54
 800cfc0:	2201      	movs	r2, #1
 800cfc2:	54e2      	strb	r2, [r4, r3]
 800cfc4:	e7c6      	b.n	800cf54 <fn_0800CEE8+0x6c>
 800cfc6:	46c0      	nop			@ (mov r8, r8)
 800cfc8:	030064c4 	.word	0x030064c4
