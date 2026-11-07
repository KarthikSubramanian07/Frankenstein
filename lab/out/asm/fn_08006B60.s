fn_08006B60:
 8006b60:	b570      	push	{r4, r5, r6, lr}
 8006b62:	6b43      	ldr	r3, [r0, #52]	@ 0x34
 8006b64:	0004      	movs	r4, r0
 8006b66:	b082      	sub	sp, #8
 8006b68:	1c5a      	adds	r2, r3, #1
 8006b6a:	d026      	beq.n	8006bba <fn_08006B60+0x5a>
 8006b6c:	2b01      	cmp	r3, #1
 8006b6e:	d003      	beq.n	8006b78 <fn_08006B60+0x18>
 8006b70:	b002      	add	sp, #8
 8006b72:	bc70      	pop	{r4, r5, r6}
 8006b74:	bc01      	pop	{r0}
 8006b76:	4700      	bx	r0
 8006b78:	6982      	ldr	r2, [r0, #24]
 8006b7a:	69c1      	ldr	r1, [r0, #28]
 8006b7c:	6900      	ldr	r0, [r0, #16]
 8006b7e:	9301      	str	r3, [sp, #4]
 8006b80:	9300      	str	r3, [sp, #0]
 8006b82:	2300      	movs	r3, #0
 8006b84:	f003 fdbe 	bl	800a704 <fn_0800A704>
 8006b88:	4d70      	ldr	r5, [pc, #448]	@ (8006d4c <fn_08006B60+0x1ec>)
 8006b8a:	4b71      	ldr	r3, [pc, #452]	@ (8006d50 <fn_08006B60+0x1f0>)
 8006b8c:	682a      	ldr	r2, [r5, #0]
 8006b8e:	58d3      	ldr	r3, [r2, r3]
 8006b90:	0006      	movs	r6, r0
 8006b92:	075b      	lsls	r3, r3, #29
 8006b94:	d108      	bne.n	8006ba8 <fn_08006B60+0x48>
 8006b96:	7b23      	ldrb	r3, [r4, #12]
 8006b98:	2b07      	cmp	r3, #7
 8006b9a:	d060      	beq.n	8006c5e <fn_08006B60+0xfe>
 8006b9c:	2b0d      	cmp	r3, #13
 8006b9e:	d057      	beq.n	8006c50 <fn_08006B60+0xf0>
 8006ba0:	2116      	movs	r1, #22
 8006ba2:	6920      	ldr	r0, [r4, #16]
 8006ba4:	f00e fc82 	bl	80154ac <fn_080154AC>
 8006ba8:	2e02      	cmp	r6, #2
 8006baa:	d1e1      	bne.n	8006b70 <fn_08006B60+0x10>
 8006bac:	7b23      	ldrb	r3, [r4, #12]
 8006bae:	2b0d      	cmp	r3, #13
 8006bb0:	d8de      	bhi.n	8006b70 <fn_08006B60+0x10>
 8006bb2:	4a68      	ldr	r2, [pc, #416]	@ (8006d54 <fn_08006B60+0x1f4>)
 8006bb4:	009b      	lsls	r3, r3, #2
 8006bb6:	58d3      	ldr	r3, [r2, r3]
 8006bb8:	469f      	mov	pc, r3
 8006bba:	2224      	movs	r2, #36	@ 0x24
 8006bbc:	69c1      	ldr	r1, [r0, #28]
 8006bbe:	5c85      	ldrb	r5, [r0, r2]
 8006bc0:	6942      	ldr	r2, [r0, #20]
 8006bc2:	6900      	ldr	r0, [r0, #16]
 8006bc4:	9301      	str	r3, [sp, #4]
 8006bc6:	2301      	movs	r3, #1
 8006bc8:	9300      	str	r3, [sp, #0]
 8006bca:	002b      	movs	r3, r5
 8006bcc:	f003 fd9a 	bl	800a704 <fn_0800A704>
 8006bd0:	4d5e      	ldr	r5, [pc, #376]	@ (8006d4c <fn_08006B60+0x1ec>)
 8006bd2:	4b5f      	ldr	r3, [pc, #380]	@ (8006d50 <fn_08006B60+0x1f0>)
 8006bd4:	682a      	ldr	r2, [r5, #0]
 8006bd6:	58d3      	ldr	r3, [r2, r3]
 8006bd8:	0006      	movs	r6, r0
 8006bda:	075b      	lsls	r3, r3, #29
 8006bdc:	d108      	bne.n	8006bf0 <fn_08006B60+0x90>
 8006bde:	7b23      	ldrb	r3, [r4, #12]
 8006be0:	2b07      	cmp	r3, #7
 8006be2:	d021      	beq.n	8006c28 <fn_08006B60+0xc8>
 8006be4:	2b0d      	cmp	r3, #13
 8006be6:	d02b      	beq.n	8006c40 <fn_08006B60+0xe0>
 8006be8:	2116      	movs	r1, #22
 8006bea:	6920      	ldr	r0, [r4, #16]
 8006bec:	f00e fc5e 	bl	80154ac <fn_080154AC>
 8006bf0:	2e02      	cmp	r6, #2
 8006bf2:	d012      	beq.n	8006c1a <fn_08006B60+0xba>
 8006bf4:	2e01      	cmp	r6, #1
 8006bf6:	d1bb      	bne.n	8006b70 <fn_08006B60+0x10>
 8006bf8:	7b23      	ldrb	r3, [r4, #12]
 8006bfa:	2b07      	cmp	r3, #7
 8006bfc:	d009      	beq.n	8006c12 <fn_08006B60+0xb2>
 8006bfe:	d94a      	bls.n	8006c96 <fn_08006B60+0x136>
 8006c00:	3b0c      	subs	r3, #12
 8006c02:	061b      	lsls	r3, r3, #24
 8006c04:	0e1b      	lsrs	r3, r3, #24
 8006c06:	2b01      	cmp	r3, #1
 8006c08:	d8b2      	bhi.n	8006b70 <fn_08006B60+0x10>
 8006c0a:	4b53      	ldr	r3, [pc, #332]	@ (8006d58 <fn_08006B60+0x1f8>)
 8006c0c:	6a22      	ldr	r2, [r4, #32]
 8006c0e:	429a      	cmp	r2, r3
 8006c10:	dcae      	bgt.n	8006b70 <fn_08006B60+0x10>
 8006c12:	2380      	movs	r3, #128	@ 0x80
 8006c14:	019b      	lsls	r3, r3, #6
 8006c16:	61e3      	str	r3, [r4, #28]
 8006c18:	e7aa      	b.n	8006b70 <fn_08006B60+0x10>
 8006c1a:	7b23      	ldrb	r3, [r4, #12]
 8006c1c:	2b0d      	cmp	r3, #13
 8006c1e:	d8a7      	bhi.n	8006b70 <fn_08006B60+0x10>
 8006c20:	4a4e      	ldr	r2, [pc, #312]	@ (8006d5c <fn_08006B60+0x1fc>)
 8006c22:	009b      	lsls	r3, r3, #2
 8006c24:	58d3      	ldr	r3, [r2, r3]
 8006c26:	469f      	mov	pc, r3
 8006c28:	2802      	cmp	r0, #2
 8006c2a:	d1e3      	bne.n	8006bf4 <fn_08006B60+0x94>
 8006c2c:	2113      	movs	r1, #19
 8006c2e:	6920      	ldr	r0, [r4, #16]
 8006c30:	f00e fc3c 	bl	80154ac <fn_080154AC>
 8006c34:	2380      	movs	r3, #128	@ 0x80
 8006c36:	025b      	lsls	r3, r3, #9
 8006c38:	61e3      	str	r3, [r4, #28]
 8006c3a:	2301      	movs	r3, #1
 8006c3c:	6363      	str	r3, [r4, #52]	@ 0x34
 8006c3e:	e797      	b.n	8006b70 <fn_08006B60+0x10>
 8006c40:	2802      	cmp	r0, #2
 8006c42:	d1d7      	bne.n	8006bf4 <fn_08006B60+0x94>
 8006c44:	6a23      	ldr	r3, [r4, #32]
 8006c46:	4a44      	ldr	r2, [pc, #272]	@ (8006d58 <fn_08006B60+0x1f8>)
 8006c48:	4293      	cmp	r3, r2
 8006c4a:	dcf6      	bgt.n	8006c3a <fn_08006B60+0xda>
 8006c4c:	61e3      	str	r3, [r4, #28]
 8006c4e:	e7f4      	b.n	8006c3a <fn_08006B60+0xda>
 8006c50:	2802      	cmp	r0, #2
 8006c52:	d000      	beq.n	8006c56 <fn_08006B60+0xf6>
 8006c54:	e78c      	b.n	8006b70 <fn_08006B60+0x10>
 8006c56:	2301      	movs	r3, #1
 8006c58:	425b      	negs	r3, r3
 8006c5a:	6363      	str	r3, [r4, #52]	@ 0x34
 8006c5c:	e788      	b.n	8006b70 <fn_08006B60+0x10>
 8006c5e:	2802      	cmp	r0, #2
 8006c60:	d000      	beq.n	8006c64 <fn_08006B60+0x104>
 8006c62:	e785      	b.n	8006b70 <fn_08006B60+0x10>
 8006c64:	2113      	movs	r1, #19
 8006c66:	6920      	ldr	r0, [r4, #16]
 8006c68:	f00e fc20 	bl	80154ac <fn_080154AC>
 8006c6c:	e7f3      	b.n	8006c56 <fn_08006B60+0xf6>
 8006c6e:	6829      	ldr	r1, [r5, #0]
 8006c70:	4b3b      	ldr	r3, [pc, #236]	@ (8006d60 <fn_08006B60+0x200>)
 8006c72:	4a3c      	ldr	r2, [pc, #240]	@ (8006d64 <fn_08006B60+0x204>)
 8006c74:	18cb      	adds	r3, r1, r3
 8006c76:	1889      	adds	r1, r1, r2
 8006c78:	e003      	b.n	8006c82 <fn_08006B60+0x122>
 8006c7a:	3304      	adds	r3, #4
 8006c7c:	4299      	cmp	r1, r3
 8006c7e:	d100      	bne.n	8006c82 <fn_08006B60+0x122>
 8006c80:	e776      	b.n	8006b70 <fn_08006B60+0x10>
 8006c82:	681a      	ldr	r2, [r3, #0]
 8006c84:	4294      	cmp	r4, r2
 8006c86:	d1f8      	bne.n	8006c7a <fn_08006B60+0x11a>
 8006c88:	2200      	movs	r2, #0
 8006c8a:	6923      	ldr	r3, [r4, #16]
 8006c8c:	0020      	movs	r0, r4
 8006c8e:	615a      	str	r2, [r3, #20]
 8006c90:	f011 fc54 	bl	801853c <fn_0801853C>
 8006c94:	e76c      	b.n	8006b70 <fn_08006B60+0x10>
 8006c96:	3b04      	subs	r3, #4
 8006c98:	061b      	lsls	r3, r3, #24
 8006c9a:	0e1b      	lsrs	r3, r3, #24
 8006c9c:	2b01      	cmp	r3, #1
 8006c9e:	d900      	bls.n	8006ca2 <fn_08006B60+0x142>
 8006ca0:	e766      	b.n	8006b70 <fn_08006B60+0x10>
 8006ca2:	e7b6      	b.n	8006c12 <fn_08006B60+0xb2>
 8006ca4:	2127      	movs	r1, #39	@ 0x27
 8006ca6:	2201      	movs	r2, #1
 8006ca8:	2604      	movs	r6, #4
 8006caa:	6920      	ldr	r0, [r4, #16]
 8006cac:	6aa3      	ldr	r3, [r4, #40]	@ 0x28
 8006cae:	8403      	strh	r3, [r0, #32]
 8006cb0:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
 8006cb2:	401a      	ands	r2, r3
 8006cb4:	5c43      	ldrb	r3, [r0, r1]
 8006cb6:	0092      	lsls	r2, r2, #2
 8006cb8:	43b3      	bics	r3, r6
 8006cba:	4313      	orrs	r3, r2
 8006cbc:	5443      	strb	r3, [r0, r1]
 8006cbe:	2325      	movs	r3, #37	@ 0x25
 8006cc0:	8e22      	ldrh	r2, [r4, #48]	@ 0x30
 8006cc2:	6829      	ldr	r1, [r5, #0]
 8006cc4:	54c2      	strb	r2, [r0, r3]
 8006cc6:	4b26      	ldr	r3, [pc, #152]	@ (8006d60 <fn_08006B60+0x200>)
 8006cc8:	4a26      	ldr	r2, [pc, #152]	@ (8006d64 <fn_08006B60+0x204>)
 8006cca:	18cb      	adds	r3, r1, r3
 8006ccc:	1889      	adds	r1, r1, r2
 8006cce:	e003      	b.n	8006cd8 <fn_08006B60+0x178>
 8006cd0:	3304      	adds	r3, #4
 8006cd2:	428b      	cmp	r3, r1
 8006cd4:	d100      	bne.n	8006cd8 <fn_08006B60+0x178>
 8006cd6:	e74b      	b.n	8006b70 <fn_08006B60+0x10>
 8006cd8:	681a      	ldr	r2, [r3, #0]
 8006cda:	4294      	cmp	r4, r2
 8006cdc:	d1f8      	bne.n	8006cd0 <fn_08006B60+0x170>
 8006cde:	2300      	movs	r3, #0
 8006ce0:	6143      	str	r3, [r0, #20]
 8006ce2:	0020      	movs	r0, r4
 8006ce4:	f011 fc2a 	bl	801853c <fn_0801853C>
 8006ce8:	e742      	b.n	8006b70 <fn_08006B60+0x10>
 8006cea:	6829      	ldr	r1, [r5, #0]
 8006cec:	4b1c      	ldr	r3, [pc, #112]	@ (8006d60 <fn_08006B60+0x200>)
 8006cee:	4a1d      	ldr	r2, [pc, #116]	@ (8006d64 <fn_08006B60+0x204>)
 8006cf0:	18cb      	adds	r3, r1, r3
 8006cf2:	1889      	adds	r1, r1, r2
 8006cf4:	e003      	b.n	8006cfe <fn_08006B60+0x19e>
 8006cf6:	3304      	adds	r3, #4
 8006cf8:	428b      	cmp	r3, r1
 8006cfa:	d100      	bne.n	8006cfe <fn_08006B60+0x19e>
 8006cfc:	e738      	b.n	8006b70 <fn_08006B60+0x10>
 8006cfe:	681a      	ldr	r2, [r3, #0]
 8006d00:	4294      	cmp	r4, r2
 8006d02:	d1f8      	bne.n	8006cf6 <fn_08006B60+0x196>
 8006d04:	e7c0      	b.n	8006c88 <fn_08006B60+0x128>
 8006d06:	2127      	movs	r1, #39	@ 0x27
 8006d08:	2201      	movs	r2, #1
 8006d0a:	2604      	movs	r6, #4
 8006d0c:	6920      	ldr	r0, [r4, #16]
 8006d0e:	6aa3      	ldr	r3, [r4, #40]	@ 0x28
 8006d10:	8403      	strh	r3, [r0, #32]
 8006d12:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
 8006d14:	401a      	ands	r2, r3
 8006d16:	5c43      	ldrb	r3, [r0, r1]
 8006d18:	0092      	lsls	r2, r2, #2
 8006d1a:	43b3      	bics	r3, r6
 8006d1c:	4313      	orrs	r3, r2
 8006d1e:	5443      	strb	r3, [r0, r1]
 8006d20:	2325      	movs	r3, #37	@ 0x25
 8006d22:	8e22      	ldrh	r2, [r4, #48]	@ 0x30
 8006d24:	6829      	ldr	r1, [r5, #0]
 8006d26:	54c2      	strb	r2, [r0, r3]
 8006d28:	4b0d      	ldr	r3, [pc, #52]	@ (8006d60 <fn_08006B60+0x200>)
 8006d2a:	4a0e      	ldr	r2, [pc, #56]	@ (8006d64 <fn_08006B60+0x204>)
 8006d2c:	18cb      	adds	r3, r1, r3
 8006d2e:	1889      	adds	r1, r1, r2
 8006d30:	e003      	b.n	8006d3a <fn_08006B60+0x1da>
 8006d32:	3304      	adds	r3, #4
 8006d34:	428b      	cmp	r3, r1
 8006d36:	d100      	bne.n	8006d3a <fn_08006B60+0x1da>
 8006d38:	e71a      	b.n	8006b70 <fn_08006B60+0x10>
 8006d3a:	681a      	ldr	r2, [r3, #0]
 8006d3c:	4294      	cmp	r4, r2
 8006d3e:	d1f8      	bne.n	8006d32 <fn_08006B60+0x1d2>
 8006d40:	e7cd      	b.n	8006cde <fn_08006B60+0x17e>
 8006d42:	6920      	ldr	r0, [r4, #16]
 8006d44:	e7bb      	b.n	8006cbe <fn_08006B60+0x15e>
 8006d46:	6920      	ldr	r0, [r4, #16]
 8006d48:	e7ea      	b.n	8006d20 <fn_08006B60+0x1c0>
 8006d4a:	46c0      	nop			@ (mov r8, r8)
 8006d4c:	030064c4 	.word	0x030064c4
 8006d50:	000010ec 	.word	0x000010ec
 8006d54:	0812e48c 	.word	0x0812e48c
 8006d58:	0002ffff 	.word	0x0002ffff
 8006d5c:	0812e4c4 	.word	0x0812e4c4
 8006d60:	000007dc 	.word	0x000007dc
 8006d64:	0000085c 	.word	0x0000085c
