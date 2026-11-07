fn_08016C5C:
 8016c5c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8016c5e:	46ce      	mov	lr, r9
 8016c60:	4647      	mov	r7, r8
 8016c62:	4e5e      	ldr	r6, [pc, #376]	@ (8016ddc <fn_08016C5C+0x180>)
 8016c64:	4b5e      	ldr	r3, [pc, #376]	@ (8016de0 <fn_08016C5C+0x184>)
 8016c66:	6831      	ldr	r1, [r6, #0]
 8016c68:	58ca      	ldr	r2, [r1, r3]
 8016c6a:	b580      	push	{r7, lr}
 8016c6c:	2a00      	cmp	r2, #0
 8016c6e:	dd25      	ble.n	8016cbc <fn_08016C5C+0x60>
 8016c70:	3304      	adds	r3, #4
 8016c72:	58cc      	ldr	r4, [r1, r3]
 8016c74:	2380      	movs	r3, #128	@ 0x80
 8016c76:	4698      	mov	r8, r3
 8016c78:	4b5a      	ldr	r3, [pc, #360]	@ (8016de4 <fn_08016C5C+0x188>)
 8016c7a:	2500      	movs	r5, #0
 8016c7c:	271f      	movs	r7, #31
 8016c7e:	4699      	mov	r9, r3
 8016c80:	2020      	movs	r0, #32
 8016c82:	5e23      	ldrsh	r3, [r4, r0]
 8016c84:	2b00      	cmp	r3, #0
 8016c86:	d015      	beq.n	8016cb4 <fn_08016C5C+0x58>
 8016c88:	4642      	mov	r2, r8
 8016c8a:	421a      	tst	r2, r3
 8016c8c:	d004      	beq.n	8016c98 <fn_08016C5C+0x3c>
 8016c8e:	20f6      	movs	r0, #246	@ 0xf6
 8016c90:	0040      	lsls	r0, r0, #1
 8016c92:	580a      	ldr	r2, [r1, r0]
 8016c94:	3201      	adds	r2, #1
 8016c96:	500a      	str	r2, [r1, r0]
 8016c98:	003a      	movs	r2, r7
 8016c9a:	401a      	ands	r2, r3
 8016c9c:	2a11      	cmp	r2, #17
 8016c9e:	d807      	bhi.n	8016cb0 <fn_08016C5C+0x54>
 8016ca0:	4648      	mov	r0, r9
 8016ca2:	0092      	lsls	r2, r2, #2
 8016ca4:	5882      	ldr	r2, [r0, r2]
 8016ca6:	4697      	mov	pc, r2
 8016ca8:	0020      	movs	r0, r4
 8016caa:	f7f7 f8e9 	bl	800de80 <fn_0800DE80>
 8016cae:	6831      	ldr	r1, [r6, #0]
 8016cb0:	4b4b      	ldr	r3, [pc, #300]	@ (8016de0 <fn_08016C5C+0x184>)
 8016cb2:	58ca      	ldr	r2, [r1, r3]
 8016cb4:	3501      	adds	r5, #1
 8016cb6:	3428      	adds	r4, #40	@ 0x28
 8016cb8:	4295      	cmp	r5, r2
 8016cba:	dbe1      	blt.n	8016c80 <fn_08016C5C+0x24>
 8016cbc:	f7f0 f9b6 	bl	800702c <fn_0800702C>
 8016cc0:	f7fb fd9e 	bl	8012800 <fn_08012800>
 8016cc4:	4c48      	ldr	r4, [pc, #288]	@ (8016de8 <fn_08016C5C+0x18c>)
 8016cc6:	4d49      	ldr	r5, [pc, #292]	@ (8016dec <fn_08016C5C+0x190>)
 8016cc8:	6830      	ldr	r0, [r6, #0]
 8016cca:	2214      	movs	r2, #20
 8016ccc:	1900      	adds	r0, r0, r4
 8016cce:	2100      	movs	r1, #0
 8016cd0:	3414      	adds	r4, #20
 8016cd2:	f009 fe5d 	bl	8020990 <fn_08020990>
 8016cd6:	42ac      	cmp	r4, r5
 8016cd8:	d1f6      	bne.n	8016cc8 <fn_08016C5C+0x6c>
 8016cda:	6832      	ldr	r2, [r6, #0]
 8016cdc:	4b44      	ldr	r3, [pc, #272]	@ (8016df0 <fn_08016C5C+0x194>)
 8016cde:	58d1      	ldr	r1, [r2, r3]
 8016ce0:	2900      	cmp	r1, #0
 8016ce2:	dd1a      	ble.n	8016d1a <fn_08016C5C+0xbe>
 8016ce4:	3304      	adds	r3, #4
 8016ce6:	58d4      	ldr	r4, [r2, r3]
 8016ce8:	4b42      	ldr	r3, [pc, #264]	@ (8016df4 <fn_08016C5C+0x198>)
 8016cea:	4698      	mov	r8, r3
 8016cec:	2340      	movs	r3, #64	@ 0x40
 8016cee:	2500      	movs	r5, #0
 8016cf0:	4699      	mov	r9, r3
 8016cf2:	4643      	mov	r3, r8
 8016cf4:	8be0      	ldrh	r0, [r4, #30]
 8016cf6:	58d3      	ldr	r3, [r2, r3]
 8016cf8:	0080      	lsls	r0, r0, #2
 8016cfa:	181b      	adds	r3, r3, r0
 8016cfc:	4648      	mov	r0, r9
 8016cfe:	78db      	ldrb	r3, [r3, #3]
 8016d00:	4218      	tst	r0, r3
 8016d02:	d106      	bne.n	8016d12 <fn_08016C5C+0xb6>
 8016d04:	271a      	movs	r7, #26
 8016d06:	5fe0      	ldrsh	r0, [r4, r7]
 8016d08:	09db      	lsrs	r3, r3, #7
 8016d0a:	021b      	lsls	r3, r3, #8
 8016d0c:	4043      	eors	r3, r0
 8016d0e:	2b30      	cmp	r3, #48	@ 0x30
 8016d10:	d009      	beq.n	8016d26 <fn_08016C5C+0xca>
 8016d12:	3501      	adds	r5, #1
 8016d14:	3420      	adds	r4, #32
 8016d16:	428d      	cmp	r5, r1
 8016d18:	dbeb      	blt.n	8016cf2 <fn_08016C5C+0x96>
 8016d1a:	bcc0      	pop	{r6, r7}
 8016d1c:	46b9      	mov	r9, r7
 8016d1e:	46b0      	mov	r8, r6
 8016d20:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8016d22:	bc01      	pop	{r0}
 8016d24:	4700      	bx	r0
 8016d26:	23e0      	movs	r3, #224	@ 0xe0
 8016d28:	011b      	lsls	r3, r3, #4
 8016d2a:	58d3      	ldr	r3, [r2, r3]
 8016d2c:	016a      	lsls	r2, r5, #5
 8016d2e:	189b      	adds	r3, r3, r2
 8016d30:	8a9b      	ldrh	r3, [r3, #20]
 8016d32:	2200      	movs	r2, #0
 8016d34:	2103      	movs	r1, #3
 8016d36:	2010      	movs	r0, #16
 8016d38:	001f      	movs	r7, r3
 8016d3a:	f006 fc9f 	bl	801d67c <fn_0801D67C>
 8016d3e:	4b2e      	ldr	r3, [pc, #184]	@ (8016df8 <fn_08016C5C+0x19c>)
 8016d40:	60c7      	str	r7, [r0, #12]
 8016d42:	6083      	str	r3, [r0, #8]
 8016d44:	f001 fbea 	bl	801851c <fn_0801851C>
 8016d48:	6832      	ldr	r2, [r6, #0]
 8016d4a:	4b29      	ldr	r3, [pc, #164]	@ (8016df0 <fn_08016C5C+0x194>)
 8016d4c:	58d1      	ldr	r1, [r2, r3]
 8016d4e:	e7e0      	b.n	8016d12 <fn_08016C5C+0xb6>
 8016d50:	0020      	movs	r0, r4
 8016d52:	f7f0 fd6d 	bl	8007830 <fn_08007830>
 8016d56:	6831      	ldr	r1, [r6, #0]
 8016d58:	4b21      	ldr	r3, [pc, #132]	@ (8016de0 <fn_08016C5C+0x184>)
 8016d5a:	58ca      	ldr	r2, [r1, r3]
 8016d5c:	e7aa      	b.n	8016cb4 <fn_08016C5C+0x58>
 8016d5e:	2201      	movs	r2, #1
 8016d60:	210f      	movs	r1, #15
 8016d62:	0020      	movs	r0, r4
 8016d64:	f7f7 f8de 	bl	800df24 <fn_0800DF24>
 8016d68:	6831      	ldr	r1, [r6, #0]
 8016d6a:	4b1d      	ldr	r3, [pc, #116]	@ (8016de0 <fn_08016C5C+0x184>)
 8016d6c:	58ca      	ldr	r2, [r1, r3]
 8016d6e:	e7a1      	b.n	8016cb4 <fn_08016C5C+0x58>
 8016d70:	2201      	movs	r2, #1
 8016d72:	2123      	movs	r1, #35	@ 0x23
 8016d74:	e7f5      	b.n	8016d62 <fn_08016C5C+0x106>
 8016d76:	0020      	movs	r0, r4
 8016d78:	f7f0 fd34 	bl	80077e4 <fn_080077E4>
 8016d7c:	6831      	ldr	r1, [r6, #0]
 8016d7e:	4b18      	ldr	r3, [pc, #96]	@ (8016de0 <fn_08016C5C+0x184>)
 8016d80:	58ca      	ldr	r2, [r1, r3]
 8016d82:	e797      	b.n	8016cb4 <fn_08016C5C+0x58>
 8016d84:	2b1f      	cmp	r3, #31
 8016d86:	dc93      	bgt.n	8016cb0 <fn_08016C5C+0x54>
 8016d88:	22f6      	movs	r2, #246	@ 0xf6
 8016d8a:	0052      	lsls	r2, r2, #1
 8016d8c:	588b      	ldr	r3, [r1, r2]
 8016d8e:	3301      	adds	r3, #1
 8016d90:	508b      	str	r3, [r1, r2]
 8016d92:	4b13      	ldr	r3, [pc, #76]	@ (8016de0 <fn_08016C5C+0x184>)
 8016d94:	58ca      	ldr	r2, [r1, r3]
 8016d96:	e78d      	b.n	8016cb4 <fn_08016C5C+0x58>
 8016d98:	0020      	movs	r0, r4
 8016d9a:	f7f7 f8fb 	bl	800df94 <fn_0800DF94>
 8016d9e:	6831      	ldr	r1, [r6, #0]
 8016da0:	4b0f      	ldr	r3, [pc, #60]	@ (8016de0 <fn_08016C5C+0x184>)
 8016da2:	58ca      	ldr	r2, [r1, r3]
 8016da4:	e786      	b.n	8016cb4 <fn_08016C5C+0x58>
 8016da6:	2200      	movs	r2, #0
 8016da8:	210f      	movs	r1, #15
 8016daa:	0020      	movs	r0, r4
 8016dac:	f7f7 f8ba 	bl	800df24 <fn_0800DF24>
 8016db0:	2260      	movs	r2, #96	@ 0x60
 8016db2:	8c23      	ldrh	r3, [r4, #32]
 8016db4:	4313      	orrs	r3, r2
 8016db6:	8423      	strh	r3, [r4, #32]
 8016db8:	6831      	ldr	r1, [r6, #0]
 8016dba:	4b09      	ldr	r3, [pc, #36]	@ (8016de0 <fn_08016C5C+0x184>)
 8016dbc:	58ca      	ldr	r2, [r1, r3]
 8016dbe:	e779      	b.n	8016cb4 <fn_08016C5C+0x58>
 8016dc0:	2200      	movs	r2, #0
 8016dc2:	2123      	movs	r1, #35	@ 0x23
 8016dc4:	e7cd      	b.n	8016d62 <fn_08016C5C+0x106>
 8016dc6:	2200      	movs	r2, #0
 8016dc8:	210f      	movs	r1, #15
 8016dca:	e7ca      	b.n	8016d62 <fn_08016C5C+0x106>
 8016dcc:	0020      	movs	r0, r4
 8016dce:	f7f7 f87d 	bl	800decc <fn_0800DECC>
 8016dd2:	6831      	ldr	r1, [r6, #0]
 8016dd4:	4b02      	ldr	r3, [pc, #8]	@ (8016de0 <fn_08016C5C+0x184>)
 8016dd6:	58ca      	ldr	r2, [r1, r3]
 8016dd8:	e76c      	b.n	8016cb4 <fn_08016C5C+0x58>
 8016dda:	46c0      	nop			@ (mov r8, r8)
 8016ddc:	030064c4 	.word	0x030064c4	@ data_030064C4
 8016de0:	00000dec 	.word	0x00000dec
 8016de4:	0812ec44 	.word	0x0812ec44
 8016de8:	0000109c 	.word	0x0000109c
 8016dec:	000010ec 	.word	0x000010ec
 8016df0:	00000dfc 	.word	0x00000dfc
 8016df4:	00000e04 	.word	0x00000e04
 8016df8:	080143ed 	.word	0x080143ed	@ fn_080143EC
 8016dfc:	4708      	bx	r1
 8016dfe:	46c0      	nop			@ (mov r8, r8)
