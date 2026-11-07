fn_080169CC:
 80169cc:	b570      	push	{r4, r5, r6, lr}
 80169ce:	0005      	movs	r5, r0
 80169d0:	6800      	ldr	r0, [r0, #0]
 80169d2:	6ac4      	ldr	r4, [r0, #44]	@ 0x2c
 80169d4:	6942      	ldr	r2, [r0, #20]
 80169d6:	6823      	ldr	r3, [r4, #0]
 80169d8:	429a      	cmp	r2, r3
 80169da:	d124      	bne.n	8016a26 <fn_080169CC+0x5a>
 80169dc:	2220      	movs	r2, #32
 80169de:	5ea3      	ldrsh	r3, [r4, r2]
 80169e0:	2b1f      	cmp	r3, #31
 80169e2:	dc23      	bgt.n	8016a2c <fn_080169CC+0x60>
 80169e4:	3b04      	subs	r3, #4
 80169e6:	041b      	lsls	r3, r3, #16
 80169e8:	0c1b      	lsrs	r3, r3, #16
 80169ea:	2b0c      	cmp	r3, #12
 80169ec:	d81b      	bhi.n	8016a26 <fn_080169CC+0x5a>
 80169ee:	4a59      	ldr	r2, [pc, #356]	@ (8016b54 <fn_080169CC+0x188>)
 80169f0:	009b      	lsls	r3, r3, #2
 80169f2:	58d3      	ldr	r3, [r2, r3]
 80169f4:	469f      	mov	pc, r3
 80169f6:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
 80169f8:	2b00      	cmp	r3, #0
 80169fa:	d15b      	bne.n	8016ab4 <fn_080169CC+0xe8>
 80169fc:	4b56      	ldr	r3, [pc, #344]	@ (8016b58 <fn_080169CC+0x18c>)
 80169fe:	681a      	ldr	r2, [r3, #0]
 8016a00:	4b56      	ldr	r3, [pc, #344]	@ (8016b5c <fn_080169CC+0x190>)
 8016a02:	58d3      	ldr	r3, [r2, r3]
 8016a04:	06db      	lsls	r3, r3, #27
 8016a06:	d100      	bne.n	8016a0a <fn_080169CC+0x3e>
 8016a08:	e097      	b.n	8016b3a <fn_080169CC+0x16e>
 8016a0a:	2220      	movs	r2, #32
 8016a0c:	5ea3      	ldrsh	r3, [r4, r2]
 8016a0e:	2280      	movs	r2, #128	@ 0x80
 8016a10:	421a      	tst	r2, r3
 8016a12:	d008      	beq.n	8016a26 <fn_080169CC+0x5a>
 8016a14:	20b4      	movs	r0, #180	@ 0xb4
 8016a16:	5829      	ldr	r1, [r5, r0]
 8016a18:	3101      	adds	r1, #1
 8016a1a:	5029      	str	r1, [r5, r0]
 8016a1c:	4393      	bics	r3, r2
 8016a1e:	2b1f      	cmp	r3, #31
 8016a20:	dc00      	bgt.n	8016a24 <fn_080169CC+0x58>
 8016a22:	2300      	movs	r3, #0
 8016a24:	8423      	strh	r3, [r4, #32]
 8016a26:	bc70      	pop	{r4, r5, r6}
 8016a28:	bc01      	pop	{r0}
 8016a2a:	4700      	bx	r0
 8016a2c:	065a      	lsls	r2, r3, #25
 8016a2e:	0f92      	lsrs	r2, r2, #30
 8016a30:	2a02      	cmp	r2, #2
 8016a32:	d014      	beq.n	8016a5e <fn_080169CC+0x92>
 8016a34:	2a03      	cmp	r2, #3
 8016a36:	d0de      	beq.n	80169f6 <fn_080169CC+0x2a>
 8016a38:	2a01      	cmp	r2, #1
 8016a3a:	d1e8      	bne.n	8016a0e <fn_080169CC+0x42>
 8016a3c:	6c2a      	ldr	r2, [r5, #64]	@ 0x40
 8016a3e:	2a00      	cmp	r2, #0
 8016a40:	d11e      	bne.n	8016a80 <fn_080169CC+0xb4>
 8016a42:	4a45      	ldr	r2, [pc, #276]	@ (8016b58 <fn_080169CC+0x18c>)
 8016a44:	6811      	ldr	r1, [r2, #0]
 8016a46:	4a45      	ldr	r2, [pc, #276]	@ (8016b5c <fn_080169CC+0x190>)
 8016a48:	588a      	ldr	r2, [r1, r2]
 8016a4a:	06d2      	lsls	r2, r2, #27
 8016a4c:	d118      	bne.n	8016a80 <fn_080169CC+0xb4>
 8016a4e:	2305      	movs	r3, #5
 8016a50:	2200      	movs	r2, #0
 8016a52:	2100      	movs	r1, #0
 8016a54:	f7f6 ffb2 	bl	800d9bc <fn_0800D9BC>
 8016a58:	2220      	movs	r2, #32
 8016a5a:	5ea3      	ldrsh	r3, [r4, r2]
 8016a5c:	e7d7      	b.n	8016a0e <fn_080169CC+0x42>
 8016a5e:	6c2a      	ldr	r2, [r5, #64]	@ 0x40
 8016a60:	2a00      	cmp	r2, #0
 8016a62:	d10d      	bne.n	8016a80 <fn_080169CC+0xb4>
 8016a64:	4a3c      	ldr	r2, [pc, #240]	@ (8016b58 <fn_080169CC+0x18c>)
 8016a66:	6811      	ldr	r1, [r2, #0]
 8016a68:	4a3c      	ldr	r2, [pc, #240]	@ (8016b5c <fn_080169CC+0x190>)
 8016a6a:	588a      	ldr	r2, [r1, r2]
 8016a6c:	06d2      	lsls	r2, r2, #27
 8016a6e:	d107      	bne.n	8016a80 <fn_080169CC+0xb4>
 8016a70:	230a      	movs	r3, #10
 8016a72:	2200      	movs	r2, #0
 8016a74:	2100      	movs	r1, #0
 8016a76:	f7f6 ffa1 	bl	800d9bc <fn_0800D9BC>
 8016a7a:	2220      	movs	r2, #32
 8016a7c:	5ea3      	ldrsh	r3, [r4, r2]
 8016a7e:	e7c6      	b.n	8016a0e <fn_080169CC+0x42>
 8016a80:	2280      	movs	r2, #128	@ 0x80
 8016a82:	421a      	tst	r2, r3
 8016a84:	d0cf      	beq.n	8016a26 <fn_080169CC+0x5a>
 8016a86:	20b4      	movs	r0, #180	@ 0xb4
 8016a88:	5829      	ldr	r1, [r5, r0]
 8016a8a:	4393      	bics	r3, r2
 8016a8c:	3101      	adds	r1, #1
 8016a8e:	5029      	str	r1, [r5, r0]
 8016a90:	8423      	strh	r3, [r4, #32]
 8016a92:	e7c8      	b.n	8016a26 <fn_080169CC+0x5a>
 8016a94:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
 8016a96:	2b00      	cmp	r3, #0
 8016a98:	d156      	bne.n	8016b48 <fn_080169CC+0x17c>
 8016a9a:	4b2f      	ldr	r3, [pc, #188]	@ (8016b58 <fn_080169CC+0x18c>)
 8016a9c:	681a      	ldr	r2, [r3, #0]
 8016a9e:	4b2f      	ldr	r3, [pc, #188]	@ (8016b5c <fn_080169CC+0x190>)
 8016aa0:	58d3      	ldr	r3, [r2, r3]
 8016aa2:	06db      	lsls	r3, r3, #27
 8016aa4:	d1bf      	bne.n	8016a26 <fn_080169CC+0x5a>
 8016aa6:	2314      	movs	r3, #20
 8016aa8:	2200      	movs	r2, #0
 8016aaa:	2100      	movs	r1, #0
 8016aac:	6828      	ldr	r0, [r5, #0]
 8016aae:	f7f6 ff85 	bl	800d9bc <fn_0800D9BC>
 8016ab2:	e7b8      	b.n	8016a26 <fn_080169CC+0x5a>
 8016ab4:	f7f0 f824 	bl	8006b00 <fn_08006B00>
 8016ab8:	2804      	cmp	r0, #4
 8016aba:	dd9f      	ble.n	80169fc <fn_080169CC+0x30>
 8016abc:	e7a5      	b.n	8016a0a <fn_080169CC+0x3e>
 8016abe:	4b26      	ldr	r3, [pc, #152]	@ (8016b58 <fn_080169CC+0x18c>)
 8016ac0:	681a      	ldr	r2, [r3, #0]
 8016ac2:	4b26      	ldr	r3, [pc, #152]	@ (8016b5c <fn_080169CC+0x190>)
 8016ac4:	58d3      	ldr	r3, [r2, r3]
 8016ac6:	06db      	lsls	r3, r3, #27
 8016ac8:	d104      	bne.n	8016ad4 <fn_080169CC+0x108>
 8016aca:	21c2      	movs	r1, #194	@ 0xc2
 8016acc:	0049      	lsls	r1, r1, #1
 8016ace:	5853      	ldr	r3, [r2, r1]
 8016ad0:	3b02      	subs	r3, #2
 8016ad2:	5053      	str	r3, [r2, r1]
 8016ad4:	2314      	movs	r3, #20
 8016ad6:	2200      	movs	r2, #0
 8016ad8:	2100      	movs	r1, #0
 8016ada:	f7f6 ff6f 	bl	800d9bc <fn_0800D9BC>
 8016ade:	6aab      	ldr	r3, [r5, #40]	@ 0x28
 8016ae0:	2b0a      	cmp	r3, #10
 8016ae2:	dca0      	bgt.n	8016a26 <fn_080169CC+0x5a>
 8016ae4:	f7ec fbf0 	bl	80032c8 <fn_080032C8>
 8016ae8:	e79d      	b.n	8016a26 <fn_080169CC+0x5a>
 8016aea:	22b4      	movs	r2, #180	@ 0xb4
 8016aec:	58ab      	ldr	r3, [r5, r2]
 8016aee:	3301      	adds	r3, #1
 8016af0:	50ab      	str	r3, [r5, r2]
 8016af2:	2300      	movs	r3, #0
 8016af4:	8423      	strh	r3, [r4, #32]
 8016af6:	e796      	b.n	8016a26 <fn_080169CC+0x5a>
 8016af8:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
 8016afa:	2b00      	cmp	r3, #0
 8016afc:	d193      	bne.n	8016a26 <fn_080169CC+0x5a>
 8016afe:	4b16      	ldr	r3, [pc, #88]	@ (8016b58 <fn_080169CC+0x18c>)
 8016b00:	681a      	ldr	r2, [r3, #0]
 8016b02:	4b16      	ldr	r3, [pc, #88]	@ (8016b5c <fn_080169CC+0x190>)
 8016b04:	58d3      	ldr	r3, [r2, r3]
 8016b06:	06db      	lsls	r3, r3, #27
 8016b08:	d000      	beq.n	8016b0c <fn_080169CC+0x140>
 8016b0a:	e78c      	b.n	8016a26 <fn_080169CC+0x5a>
 8016b0c:	2305      	movs	r3, #5
 8016b0e:	2200      	movs	r2, #0
 8016b10:	2100      	movs	r1, #0
 8016b12:	f7f6 ff53 	bl	800d9bc <fn_0800D9BC>
 8016b16:	e786      	b.n	8016a26 <fn_080169CC+0x5a>
 8016b18:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
 8016b1a:	2b00      	cmp	r3, #0
 8016b1c:	d000      	beq.n	8016b20 <fn_080169CC+0x154>
 8016b1e:	e782      	b.n	8016a26 <fn_080169CC+0x5a>
 8016b20:	4b0d      	ldr	r3, [pc, #52]	@ (8016b58 <fn_080169CC+0x18c>)
 8016b22:	681a      	ldr	r2, [r3, #0]
 8016b24:	4b0d      	ldr	r3, [pc, #52]	@ (8016b5c <fn_080169CC+0x190>)
 8016b26:	58d3      	ldr	r3, [r2, r3]
 8016b28:	06db      	lsls	r3, r3, #27
 8016b2a:	d000      	beq.n	8016b2e <fn_080169CC+0x162>
 8016b2c:	e77b      	b.n	8016a26 <fn_080169CC+0x5a>
 8016b2e:	230a      	movs	r3, #10
 8016b30:	2200      	movs	r2, #0
 8016b32:	2100      	movs	r1, #0
 8016b34:	f7f6 ff42 	bl	800d9bc <fn_0800D9BC>
 8016b38:	e775      	b.n	8016a26 <fn_080169CC+0x5a>
 8016b3a:	2314      	movs	r3, #20
 8016b3c:	2200      	movs	r2, #0
 8016b3e:	2100      	movs	r1, #0
 8016b40:	6828      	ldr	r0, [r5, #0]
 8016b42:	f7f6 ff3b 	bl	800d9bc <fn_0800D9BC>
 8016b46:	e760      	b.n	8016a0a <fn_080169CC+0x3e>
 8016b48:	f7ef ffda 	bl	8006b00 <fn_08006B00>
 8016b4c:	2804      	cmp	r0, #4
 8016b4e:	dd00      	ble.n	8016b52 <fn_080169CC+0x186>
 8016b50:	e769      	b.n	8016a26 <fn_080169CC+0x5a>
 8016b52:	e7a2      	b.n	8016a9a <fn_080169CC+0xce>
 8016b54:	0812ece4 	.word	0x0812ece4
 8016b58:	030064c4 	.word	0x030064c4
 8016b5c:	000010ec 	.word	0x000010ec
