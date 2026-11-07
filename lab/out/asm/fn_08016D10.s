fn_08016D10:
 8016d10:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8016d12:	46ce      	mov	lr, r9
 8016d14:	4647      	mov	r7, r8
 8016d16:	4e5e      	ldr	r6, [pc, #376]	@ (8016e90 <fn_08016D10+0x180>)
 8016d18:	4b5e      	ldr	r3, [pc, #376]	@ (8016e94 <fn_08016D10+0x184>)
 8016d1a:	6831      	ldr	r1, [r6, #0]
 8016d1c:	58ca      	ldr	r2, [r1, r3]
 8016d1e:	b580      	push	{r7, lr}
 8016d20:	2a00      	cmp	r2, #0
 8016d22:	dd25      	ble.n	8016d70 <fn_08016D10+0x60>
 8016d24:	3304      	adds	r3, #4
 8016d26:	58cc      	ldr	r4, [r1, r3]
 8016d28:	2380      	movs	r3, #128	@ 0x80
 8016d2a:	4698      	mov	r8, r3
 8016d2c:	4b5a      	ldr	r3, [pc, #360]	@ (8016e98 <fn_08016D10+0x188>)
 8016d2e:	2500      	movs	r5, #0
 8016d30:	271f      	movs	r7, #31
 8016d32:	4699      	mov	r9, r3
 8016d34:	2020      	movs	r0, #32
 8016d36:	5e23      	ldrsh	r3, [r4, r0]
 8016d38:	2b00      	cmp	r3, #0
 8016d3a:	d015      	beq.n	8016d68 <fn_08016D10+0x58>
 8016d3c:	4642      	mov	r2, r8
 8016d3e:	421a      	tst	r2, r3
 8016d40:	d004      	beq.n	8016d4c <fn_08016D10+0x3c>
 8016d42:	20f6      	movs	r0, #246	@ 0xf6
 8016d44:	0040      	lsls	r0, r0, #1
 8016d46:	580a      	ldr	r2, [r1, r0]
 8016d48:	3201      	adds	r2, #1
 8016d4a:	500a      	str	r2, [r1, r0]
 8016d4c:	003a      	movs	r2, r7
 8016d4e:	401a      	ands	r2, r3
 8016d50:	2a11      	cmp	r2, #17
 8016d52:	d807      	bhi.n	8016d64 <fn_08016D10+0x54>
 8016d54:	4648      	mov	r0, r9
 8016d56:	0092      	lsls	r2, r2, #2
 8016d58:	5882      	ldr	r2, [r0, r2]
 8016d5a:	4697      	mov	pc, r2
 8016d5c:	0020      	movs	r0, r4
 8016d5e:	f7f7 f88f 	bl	800de80 <fn_0800DE80>
 8016d62:	6831      	ldr	r1, [r6, #0]
 8016d64:	4b4b      	ldr	r3, [pc, #300]	@ (8016e94 <fn_08016D10+0x184>)
 8016d66:	58ca      	ldr	r2, [r1, r3]
 8016d68:	3501      	adds	r5, #1
 8016d6a:	3428      	adds	r4, #40	@ 0x28
 8016d6c:	4295      	cmp	r5, r2
 8016d6e:	dbe1      	blt.n	8016d34 <fn_08016D10+0x24>
 8016d70:	f7f0 f95c 	bl	800702c <fn_0800702C>
 8016d74:	f7fb fd44 	bl	8012800 <fn_08012800>
 8016d78:	4c48      	ldr	r4, [pc, #288]	@ (8016e9c <fn_08016D10+0x18c>)
 8016d7a:	4d49      	ldr	r5, [pc, #292]	@ (8016ea0 <fn_08016D10+0x190>)
 8016d7c:	6830      	ldr	r0, [r6, #0]
 8016d7e:	2214      	movs	r2, #20
 8016d80:	1900      	adds	r0, r0, r4
 8016d82:	2100      	movs	r1, #0
 8016d84:	3414      	adds	r4, #20
 8016d86:	f009 fe5b 	bl	8020a40 <fn_08020A40>
 8016d8a:	42ac      	cmp	r4, r5
 8016d8c:	d1f6      	bne.n	8016d7c <fn_08016D10+0x6c>
 8016d8e:	6832      	ldr	r2, [r6, #0]
 8016d90:	4b44      	ldr	r3, [pc, #272]	@ (8016ea4 <fn_08016D10+0x194>)
 8016d92:	58d1      	ldr	r1, [r2, r3]
 8016d94:	2900      	cmp	r1, #0
 8016d96:	dd1a      	ble.n	8016dce <fn_08016D10+0xbe>
 8016d98:	3304      	adds	r3, #4
 8016d9a:	58d4      	ldr	r4, [r2, r3]
 8016d9c:	4b42      	ldr	r3, [pc, #264]	@ (8016ea8 <fn_08016D10+0x198>)
 8016d9e:	4698      	mov	r8, r3
 8016da0:	2340      	movs	r3, #64	@ 0x40
 8016da2:	2500      	movs	r5, #0
 8016da4:	4699      	mov	r9, r3
 8016da6:	4643      	mov	r3, r8
 8016da8:	8be0      	ldrh	r0, [r4, #30]
 8016daa:	58d3      	ldr	r3, [r2, r3]
 8016dac:	0080      	lsls	r0, r0, #2
 8016dae:	181b      	adds	r3, r3, r0
 8016db0:	4648      	mov	r0, r9
 8016db2:	78db      	ldrb	r3, [r3, #3]
 8016db4:	4218      	tst	r0, r3
 8016db6:	d106      	bne.n	8016dc6 <fn_08016D10+0xb6>
 8016db8:	271a      	movs	r7, #26
 8016dba:	5fe0      	ldrsh	r0, [r4, r7]
 8016dbc:	09db      	lsrs	r3, r3, #7
 8016dbe:	021b      	lsls	r3, r3, #8
 8016dc0:	4043      	eors	r3, r0
 8016dc2:	2b30      	cmp	r3, #48	@ 0x30
 8016dc4:	d009      	beq.n	8016dda <fn_08016D10+0xca>
 8016dc6:	3501      	adds	r5, #1
 8016dc8:	3420      	adds	r4, #32
 8016dca:	428d      	cmp	r5, r1
 8016dcc:	dbeb      	blt.n	8016da6 <fn_08016D10+0x96>
 8016dce:	bcc0      	pop	{r6, r7}
 8016dd0:	46b9      	mov	r9, r7
 8016dd2:	46b0      	mov	r8, r6
 8016dd4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8016dd6:	bc01      	pop	{r0}
 8016dd8:	4700      	bx	r0
 8016dda:	23e0      	movs	r3, #224	@ 0xe0
 8016ddc:	011b      	lsls	r3, r3, #4
 8016dde:	58d3      	ldr	r3, [r2, r3]
 8016de0:	016a      	lsls	r2, r5, #5
 8016de2:	189b      	adds	r3, r3, r2
 8016de4:	8a9b      	ldrh	r3, [r3, #20]
 8016de6:	2200      	movs	r2, #0
 8016de8:	2103      	movs	r1, #3
 8016dea:	2010      	movs	r0, #16
 8016dec:	001f      	movs	r7, r3
 8016dee:	f006 fc9d 	bl	801d72c <fn_0801D72C>
 8016df2:	4b2e      	ldr	r3, [pc, #184]	@ (8016eac <fn_08016D10+0x19c>)
 8016df4:	60c7      	str	r7, [r0, #12]
 8016df6:	6083      	str	r3, [r0, #8]
 8016df8:	f001 fbea 	bl	80185d0 <fn_080185D0>
 8016dfc:	6832      	ldr	r2, [r6, #0]
 8016dfe:	4b29      	ldr	r3, [pc, #164]	@ (8016ea4 <fn_08016D10+0x194>)
 8016e00:	58d1      	ldr	r1, [r2, r3]
 8016e02:	e7e0      	b.n	8016dc6 <fn_08016D10+0xb6>
 8016e04:	0020      	movs	r0, r4
 8016e06:	f7f0 fd13 	bl	8007830 <fn_08007830>
 8016e0a:	6831      	ldr	r1, [r6, #0]
 8016e0c:	4b21      	ldr	r3, [pc, #132]	@ (8016e94 <fn_08016D10+0x184>)
 8016e0e:	58ca      	ldr	r2, [r1, r3]
 8016e10:	e7aa      	b.n	8016d68 <fn_08016D10+0x58>
 8016e12:	2201      	movs	r2, #1
 8016e14:	210f      	movs	r1, #15
 8016e16:	0020      	movs	r0, r4
 8016e18:	f7f7 f884 	bl	800df24 <fn_0800DF24>
 8016e1c:	6831      	ldr	r1, [r6, #0]
 8016e1e:	4b1d      	ldr	r3, [pc, #116]	@ (8016e94 <fn_08016D10+0x184>)
 8016e20:	58ca      	ldr	r2, [r1, r3]
 8016e22:	e7a1      	b.n	8016d68 <fn_08016D10+0x58>
 8016e24:	2201      	movs	r2, #1
 8016e26:	2123      	movs	r1, #35	@ 0x23
 8016e28:	e7f5      	b.n	8016e16 <fn_08016D10+0x106>
 8016e2a:	0020      	movs	r0, r4
 8016e2c:	f7f0 fcda 	bl	80077e4 <fn_080077E4>
 8016e30:	6831      	ldr	r1, [r6, #0]
 8016e32:	4b18      	ldr	r3, [pc, #96]	@ (8016e94 <fn_08016D10+0x184>)
 8016e34:	58ca      	ldr	r2, [r1, r3]
 8016e36:	e797      	b.n	8016d68 <fn_08016D10+0x58>
 8016e38:	2b1f      	cmp	r3, #31
 8016e3a:	dc93      	bgt.n	8016d64 <fn_08016D10+0x54>
 8016e3c:	22f6      	movs	r2, #246	@ 0xf6
 8016e3e:	0052      	lsls	r2, r2, #1
 8016e40:	588b      	ldr	r3, [r1, r2]
 8016e42:	3301      	adds	r3, #1
 8016e44:	508b      	str	r3, [r1, r2]
 8016e46:	4b13      	ldr	r3, [pc, #76]	@ (8016e94 <fn_08016D10+0x184>)
 8016e48:	58ca      	ldr	r2, [r1, r3]
 8016e4a:	e78d      	b.n	8016d68 <fn_08016D10+0x58>
 8016e4c:	0020      	movs	r0, r4
 8016e4e:	f7f7 f8a1 	bl	800df94 <fn_0800DF94>
 8016e52:	6831      	ldr	r1, [r6, #0]
 8016e54:	4b0f      	ldr	r3, [pc, #60]	@ (8016e94 <fn_08016D10+0x184>)
 8016e56:	58ca      	ldr	r2, [r1, r3]
 8016e58:	e786      	b.n	8016d68 <fn_08016D10+0x58>
 8016e5a:	2200      	movs	r2, #0
 8016e5c:	210f      	movs	r1, #15
 8016e5e:	0020      	movs	r0, r4
 8016e60:	f7f7 f860 	bl	800df24 <fn_0800DF24>
 8016e64:	2260      	movs	r2, #96	@ 0x60
 8016e66:	8c23      	ldrh	r3, [r4, #32]
 8016e68:	4313      	orrs	r3, r2
 8016e6a:	8423      	strh	r3, [r4, #32]
 8016e6c:	6831      	ldr	r1, [r6, #0]
 8016e6e:	4b09      	ldr	r3, [pc, #36]	@ (8016e94 <fn_08016D10+0x184>)
 8016e70:	58ca      	ldr	r2, [r1, r3]
 8016e72:	e779      	b.n	8016d68 <fn_08016D10+0x58>
 8016e74:	2200      	movs	r2, #0
 8016e76:	2123      	movs	r1, #35	@ 0x23
 8016e78:	e7cd      	b.n	8016e16 <fn_08016D10+0x106>
 8016e7a:	2200      	movs	r2, #0
 8016e7c:	210f      	movs	r1, #15
 8016e7e:	e7ca      	b.n	8016e16 <fn_08016D10+0x106>
 8016e80:	0020      	movs	r0, r4
 8016e82:	f7f7 f823 	bl	800decc <fn_0800DECC>
 8016e86:	6831      	ldr	r1, [r6, #0]
 8016e88:	4b02      	ldr	r3, [pc, #8]	@ (8016e94 <fn_08016D10+0x184>)
 8016e8a:	58ca      	ldr	r2, [r1, r3]
 8016e8c:	e76c      	b.n	8016d68 <fn_08016D10+0x58>
 8016e8e:	46c0      	nop			@ (mov r8, r8)
 8016e90:	030064c4 	.word	0x030064c4
 8016e94:	00000dec 	.word	0x00000dec
 8016e98:	0812ed18 	.word	0x0812ed18
 8016e9c:	0000109c 	.word	0x0000109c
 8016ea0:	000010ec 	.word	0x000010ec
 8016ea4:	00000dfc 	.word	0x00000dfc
 8016ea8:	00000e04 	.word	0x00000e04
 8016eac:	080144a1 	.word	0x080144a1
 8016eb0:	4708      	bx	r1
 8016eb2:	46c0      	nop			@ (mov r8, r8)
