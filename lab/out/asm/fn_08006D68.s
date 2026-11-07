fn_08006D68:
 8006d68:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8006d6a:	000b      	movs	r3, r1
 8006d6c:	464e      	mov	r6, r9
 8006d6e:	4645      	mov	r5, r8
 8006d70:	46de      	mov	lr, fp
 8006d72:	4657      	mov	r7, sl
 8006d74:	3b05      	subs	r3, #5
 8006d76:	b5e0      	push	{r5, r6, r7, lr}
 8006d78:	4689      	mov	r9, r1
 8006d7a:	0006      	movs	r6, r0
 8006d7c:	2500      	movs	r5, #0
 8006d7e:	2b02      	cmp	r3, #2
 8006d80:	d800      	bhi.n	8006d84 <fn_08006D68+0x1c>
 8006d82:	e0a0      	b.n	8006ec6 <fn_08006D68+0x15e>
 8006d84:	464b      	mov	r3, r9
 8006d86:	4a5f      	ldr	r2, [pc, #380]	@ (8006f04 <fn_08006D68+0x19c>)
 8006d88:	009b      	lsls	r3, r3, #2
 8006d8a:	2401      	movs	r4, #1
 8006d8c:	189b      	adds	r3, r3, r2
 8006d8e:	469b      	mov	fp, r3
 8006d90:	4264      	negs	r4, r4
 8006d92:	0021      	movs	r1, r4
 8006d94:	0030      	movs	r0, r6
 8006d96:	f00e f975 	bl	8015084 <fn_08015084>
 8006d9a:	1e04      	subs	r4, r0, #0
 8006d9c:	db5c      	blt.n	8006e58 <fn_08006D68+0xf0>
 8006d9e:	22df      	movs	r2, #223	@ 0xdf
 8006da0:	4f59      	ldr	r7, [pc, #356]	@ (8006f08 <fn_08006D68+0x1a0>)
 8006da2:	6839      	ldr	r1, [r7, #0]
 8006da4:	0112      	lsls	r2, r2, #4
 8006da6:	588a      	ldr	r2, [r1, r2]
 8006da8:	4690      	mov	r8, r2
 8006daa:	00a3      	lsls	r3, r4, #2
 8006dac:	191b      	adds	r3, r3, r4
 8006dae:	00db      	lsls	r3, r3, #3
 8006db0:	4498      	add	r8, r3
 8006db2:	4641      	mov	r1, r8
 8006db4:	2001      	movs	r0, #1
 8006db6:	f00e fb03 	bl	80153c0 <fn_080153C0>
 8006dba:	4682      	mov	sl, r0
 8006dbc:	2800      	cmp	r0, #0
 8006dbe:	d1e8      	bne.n	8006d92 <fn_08006D68+0x2a>
 8006dc0:	2200      	movs	r2, #0
 8006dc2:	2103      	movs	r1, #3
 8006dc4:	2040      	movs	r0, #64	@ 0x40
 8006dc6:	f016 fc59 	bl	801d67c <fn_0801D67C>
 8006dca:	0005      	movs	r5, r0
 8006dcc:	2240      	movs	r2, #64	@ 0x40
 8006dce:	2100      	movs	r1, #0
 8006dd0:	f019 fdde 	bl	8020990 <fn_08020990>
 8006dd4:	0028      	movs	r0, r5
 8006dd6:	f011 fba1 	bl	801851c <fn_0801851C>
 8006dda:	4643      	mov	r3, r8
 8006ddc:	615d      	str	r5, [r3, #20]
 8006dde:	4b4b      	ldr	r3, [pc, #300]	@ (8006f0c <fn_08006D68+0x1a4>)
 8006de0:	60ab      	str	r3, [r5, #8]
 8006de2:	4643      	mov	r3, r8
 8006de4:	4652      	mov	r2, sl
 8006de6:	612b      	str	r3, [r5, #16]
 8006de8:	2324      	movs	r3, #36	@ 0x24
 8006dea:	54ea      	strb	r2, [r5, r3]
 8006dec:	464b      	mov	r3, r9
 8006dee:	2b07      	cmp	r3, #7
 8006df0:	d814      	bhi.n	8006e1c <fn_08006D68+0xb4>
 8006df2:	465b      	mov	r3, fp
 8006df4:	681b      	ldr	r3, [r3, #0]
 8006df6:	469f      	mov	pc, r3
 8006df8:	2324      	movs	r3, #36	@ 0x24
 8006dfa:	2201      	movs	r2, #1
 8006dfc:	54ea      	strb	r2, [r5, r3]
 8006dfe:	4643      	mov	r3, r8
 8006e00:	685b      	ldr	r3, [r3, #4]
 8006e02:	61ab      	str	r3, [r5, #24]
 8006e04:	4643      	mov	r3, r8
 8006e06:	681b      	ldr	r3, [r3, #0]
 8006e08:	2280      	movs	r2, #128	@ 0x80
 8006e0a:	0312      	lsls	r2, r2, #12
 8006e0c:	189b      	adds	r3, r3, r2
 8006e0e:	616b      	str	r3, [r5, #20]
 8006e10:	2301      	movs	r3, #1
 8006e12:	425b      	negs	r3, r3
 8006e14:	636b      	str	r3, [r5, #52]	@ 0x34
 8006e16:	2380      	movs	r3, #128	@ 0x80
 8006e18:	025b      	lsls	r3, r3, #9
 8006e1a:	61eb      	str	r3, [r5, #28]
 8006e1c:	4643      	mov	r3, r8
 8006e1e:	2222      	movs	r2, #34	@ 0x22
 8006e20:	5e9b      	ldrsh	r3, [r3, r2]
 8006e22:	63ab      	str	r3, [r5, #56]	@ 0x38
 8006e24:	464b      	mov	r3, r9
 8006e26:	6838      	ldr	r0, [r7, #0]
 8006e28:	732b      	strb	r3, [r5, #12]
 8006e2a:	4b39      	ldr	r3, [pc, #228]	@ (8006f10 <fn_08006D68+0x1a8>)
 8006e2c:	18c2      	adds	r2, r0, r3
 8006e2e:	2300      	movs	r3, #0
 8006e30:	e003      	b.n	8006e3a <fn_08006D68+0xd2>
 8006e32:	3301      	adds	r3, #1
 8006e34:	3204      	adds	r2, #4
 8006e36:	2b20      	cmp	r3, #32
 8006e38:	d007      	beq.n	8006e4a <fn_08006D68+0xe2>
 8006e3a:	6811      	ldr	r1, [r2, #0]
 8006e3c:	2900      	cmp	r1, #0
 8006e3e:	d1f8      	bne.n	8006e32 <fn_08006D68+0xca>
 8006e40:	33f7      	adds	r3, #247	@ 0xf7
 8006e42:	33ff      	adds	r3, #255	@ 0xff
 8006e44:	009b      	lsls	r3, r3, #2
 8006e46:	18c0      	adds	r0, r0, r3
 8006e48:	6045      	str	r5, [r0, #4]
 8006e4a:	0021      	movs	r1, r4
 8006e4c:	0030      	movs	r0, r6
 8006e4e:	f00e f919 	bl	8015084 <fn_08015084>
 8006e52:	2501      	movs	r5, #1
 8006e54:	1e04      	subs	r4, r0, #0
 8006e56:	daa2      	bge.n	8006d9e <fn_08006D68+0x36>
 8006e58:	0028      	movs	r0, r5
 8006e5a:	bcf0      	pop	{r4, r5, r6, r7}
 8006e5c:	46bb      	mov	fp, r7
 8006e5e:	46b2      	mov	sl, r6
 8006e60:	46a9      	mov	r9, r5
 8006e62:	46a0      	mov	r8, r4
 8006e64:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8006e66:	bc02      	pop	{r1}
 8006e68:	4708      	bx	r1
 8006e6a:	4643      	mov	r3, r8
 8006e6c:	464a      	mov	r2, r9
 8006e6e:	681b      	ldr	r3, [r3, #0]
 8006e70:	616b      	str	r3, [r5, #20]
 8006e72:	2a00      	cmp	r2, #0
 8006e74:	d0cc      	beq.n	8006e10 <fn_08006D68+0xa8>
 8006e76:	e7c7      	b.n	8006e08 <fn_08006D68+0xa0>
 8006e78:	4640      	mov	r0, r8
 8006e7a:	f00d feff 	bl	8014c7c <fn_08014C7C>
 8006e7e:	2301      	movs	r3, #1
 8006e80:	636b      	str	r3, [r5, #52]	@ 0x34
 8006e82:	2380      	movs	r3, #128	@ 0x80
 8006e84:	025b      	lsls	r3, r3, #9
 8006e86:	61a8      	str	r0, [r5, #24]
 8006e88:	61eb      	str	r3, [r5, #28]
 8006e8a:	e7c7      	b.n	8006e1c <fn_08006D68+0xb4>
 8006e8c:	4640      	mov	r0, r8
 8006e8e:	f00d fc0d 	bl	80146ac <fn_080146AC>
 8006e92:	6168      	str	r0, [r5, #20]
 8006e94:	e7bc      	b.n	8006e10 <fn_08006D68+0xa8>
 8006e96:	4640      	mov	r0, r8
 8006e98:	f00d fe9c 	bl	8014bd4 <fn_08014BD4>
 8006e9c:	6168      	str	r0, [r5, #20]
 8006e9e:	e7b7      	b.n	8006e10 <fn_08006D68+0xa8>
 8006ea0:	2324      	movs	r3, #36	@ 0x24
 8006ea2:	2201      	movs	r2, #1
 8006ea4:	54ea      	strb	r2, [r5, r3]
 8006ea6:	4643      	mov	r3, r8
 8006ea8:	685b      	ldr	r3, [r3, #4]
 8006eaa:	61ab      	str	r3, [r5, #24]
 8006eac:	4643      	mov	r3, r8
 8006eae:	2280      	movs	r2, #128	@ 0x80
 8006eb0:	681b      	ldr	r3, [r3, #0]
 8006eb2:	0312      	lsls	r2, r2, #12
 8006eb4:	189b      	adds	r3, r3, r2
 8006eb6:	616b      	str	r3, [r5, #20]
 8006eb8:	2301      	movs	r3, #1
 8006eba:	425b      	negs	r3, r3
 8006ebc:	636b      	str	r3, [r5, #52]	@ 0x34
 8006ebe:	2380      	movs	r3, #128	@ 0x80
 8006ec0:	029b      	lsls	r3, r3, #10
 8006ec2:	61eb      	str	r3, [r5, #28]
 8006ec4:	e7aa      	b.n	8006e1c <fn_08006D68+0xb4>
 8006ec6:	4b10      	ldr	r3, [pc, #64]	@ (8006f08 <fn_08006D68+0x1a0>)
 8006ec8:	4a12      	ldr	r2, [pc, #72]	@ (8006f14 <fn_08006D68+0x1ac>)
 8006eca:	681c      	ldr	r4, [r3, #0]
 8006ecc:	4b10      	ldr	r3, [pc, #64]	@ (8006f10 <fn_08006D68+0x1a8>)
 8006ece:	18e3      	adds	r3, r4, r3
 8006ed0:	18a4      	adds	r4, r4, r2
 8006ed2:	4a0e      	ldr	r2, [pc, #56]	@ (8006f0c <fn_08006D68+0x1a4>)
 8006ed4:	4694      	mov	ip, r2
 8006ed6:	e003      	b.n	8006ee0 <fn_08006D68+0x178>
 8006ed8:	3304      	adds	r3, #4
 8006eda:	429c      	cmp	r4, r3
 8006edc:	d100      	bne.n	8006ee0 <fn_08006D68+0x178>
 8006ede:	e751      	b.n	8006d84 <fn_08006D68+0x1c>
 8006ee0:	681a      	ldr	r2, [r3, #0]
 8006ee2:	2a00      	cmp	r2, #0
 8006ee4:	d0f8      	beq.n	8006ed8 <fn_08006D68+0x170>
 8006ee6:	201c      	movs	r0, #28
 8006ee8:	5e31      	ldrsh	r1, [r6, r0]
 8006eea:	6b90      	ldr	r0, [r2, #56]	@ 0x38
 8006eec:	4288      	cmp	r0, r1
 8006eee:	d1f3      	bne.n	8006ed8 <fn_08006D68+0x170>
 8006ef0:	6b51      	ldr	r1, [r2, #52]	@ 0x34
 8006ef2:	2900      	cmp	r1, #0
 8006ef4:	d1f0      	bne.n	8006ed8 <fn_08006D68+0x170>
 8006ef6:	6bd1      	ldr	r1, [r2, #60]	@ 0x3c
 8006ef8:	6351      	str	r1, [r2, #52]	@ 0x34
 8006efa:	4661      	mov	r1, ip
 8006efc:	2501      	movs	r5, #1
 8006efe:	6091      	str	r1, [r2, #8]
 8006f00:	e7ea      	b.n	8006ed8 <fn_08006D68+0x170>
 8006f02:	46c0      	nop			@ (mov r8, r8)
 8006f04:	0812e4fc 	.word	0x0812e4fc
 8006f08:	030064c4 	.word	0x030064c4
 8006f0c:	08006b61 	.word	0x08006b61
 8006f10:	000007dc 	.word	0x000007dc
 8006f14:	0000085c 	.word	0x0000085c
