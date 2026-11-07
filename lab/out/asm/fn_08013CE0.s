fn_08013CE0:
 8013ce0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8013ce2:	46de      	mov	lr, fp
 8013ce4:	4645      	mov	r5, r8
 8013ce6:	4657      	mov	r7, sl
 8013ce8:	464e      	mov	r6, r9
 8013cea:	22f6      	movs	r2, #246	@ 0xf6
 8013cec:	2400      	movs	r4, #0
 8013cee:	b5e0      	push	{r5, r6, r7, lr}
 8013cf0:	000d      	movs	r5, r1
 8013cf2:	21b4      	movs	r1, #180	@ 0xb4
 8013cf4:	4eea      	ldr	r6, [pc, #936]	@ (80140a0 <fn_08013CE0+0x3c0>)
 8013cf6:	6833      	ldr	r3, [r6, #0]
 8013cf8:	0052      	lsls	r2, r2, #1
 8013cfa:	b087      	sub	sp, #28
 8013cfc:	509c      	str	r4, [r3, r2]
 8013cfe:	3a04      	subs	r2, #4
 8013d00:	509c      	str	r4, [r3, r2]
 8013d02:	3a04      	subs	r2, #4
 8013d04:	509c      	str	r4, [r3, r2]
 8013d06:	322c      	adds	r2, #44	@ 0x2c
 8013d08:	5099      	str	r1, [r3, r2]
 8013d0a:	3a80      	subs	r2, #128	@ 0x80
 8013d0c:	509c      	str	r4, [r3, r2]
 8013d0e:	3204      	adds	r2, #4
 8013d10:	509c      	str	r4, [r3, r2]
 8013d12:	3a08      	subs	r2, #8
 8013d14:	509c      	str	r4, [r3, r2]
 8013d16:	39b3      	subs	r1, #179	@ 0xb3
 8013d18:	3a9c      	subs	r2, #156	@ 0x9c
 8013d1a:	5099      	str	r1, [r3, r2]
 8013d1c:	4680      	mov	r8, r0
 8013d1e:	f006 fed5 	bl	801aacc <fn_0801AACC>
 8013d22:	f005 fa8f 	bl	8019244 <fn_08019244>
 8013d26:	2103      	movs	r1, #3
 8013d28:	2002      	movs	r0, #2
 8013d2a:	f009 fdbb 	bl	801d8a4 <fn_0801D8A4>
 8013d2e:	4fdd      	ldr	r7, [pc, #884]	@ (80140a4 <fn_08013CE0+0x3c4>)
 8013d30:	6833      	ldr	r3, [r6, #0]
 8013d32:	59d8      	ldr	r0, [r3, r7]
 8013d34:	f009 fc58 	bl	801d5e8 <fn_0801D5E8>
 8013d38:	2288      	movs	r2, #136	@ 0x88
 8013d3a:	6833      	ldr	r3, [r6, #0]
 8013d3c:	0112      	lsls	r2, r2, #4
 8013d3e:	51dc      	str	r4, [r3, r7]
 8013d40:	509c      	str	r4, [r3, r2]
 8013d42:	4ad9      	ldr	r2, [pc, #868]	@ (80140a8 <fn_08013CE0+0x3c8>)
 8013d44:	509c      	str	r4, [r3, r2]
 8013d46:	4ad9      	ldr	r2, [pc, #868]	@ (80140ac <fn_08013CE0+0x3cc>)
 8013d48:	5898      	ldr	r0, [r3, r2]
 8013d4a:	f004 ff23 	bl	8018b94 <fn_08018B94>
 8013d4e:	6831      	ldr	r1, [r6, #0]
 8013d50:	4ad7      	ldr	r2, [pc, #860]	@ (80140b0 <fn_08013CE0+0x3d0>)
 8013d52:	588b      	ldr	r3, [r1, r2]
 8013d54:	3301      	adds	r3, #1
 8013d56:	d002      	beq.n	8013d5e <fn_08013CE0+0x7e>
 8013d58:	2301      	movs	r3, #1
 8013d5a:	425b      	negs	r3, r3
 8013d5c:	508b      	str	r3, [r1, r2]
 8013d5e:	f004 fbcd 	bl	80184fc <fn_080184FC>
 8013d62:	2394      	movs	r3, #148	@ 0x94
 8013d64:	6832      	ldr	r2, [r6, #0]
 8013d66:	5cd3      	ldrb	r3, [r2, r3]
 8013d68:	2b02      	cmp	r3, #2
 8013d6a:	d100      	bne.n	8013d6e <fn_08013CE0+0x8e>
 8013d6c:	e238      	b.n	80141e0 <fn_08013CE0+0x500>
 8013d6e:	ac03      	add	r4, sp, #12
 8013d70:	4643      	mov	r3, r8
 8013d72:	2109      	movs	r1, #9
 8013d74:	0020      	movs	r0, r4
 8013d76:	4acf      	ldr	r2, [pc, #828]	@ (80140b4 <fn_08013CE0+0x3d4>)
 8013d78:	9500      	str	r5, [sp, #0]
 8013d7a:	f7f1 fb6d 	bl	8005458 <fn_08005458>
 8013d7e:	0020      	movs	r0, r4
 8013d80:	f009 fb7e 	bl	801d480 <fn_0801D480>
 8013d84:	2700      	movs	r7, #0
 8013d86:	6834      	ldr	r4, [r6, #0]
 8013d88:	4bcb      	ldr	r3, [pc, #812]	@ (80140b8 <fn_08013CE0+0x3d8>)
 8013d8a:	4680      	mov	r8, r0
 8013d8c:	50e7      	str	r7, [r4, r3]
 8013d8e:	2307      	movs	r3, #7
 8013d90:	4443      	add	r3, r8
 8013d92:	0018      	movs	r0, r3
 8013d94:	469a      	mov	sl, r3
 8013d96:	f009 fbcd 	bl	801d534 <fn_0801D534>
 8013d9a:	211a      	movs	r1, #26
 8013d9c:	f011 fc3a 	bl	8025614 <fn_08025614>
 8013da0:	4dc6      	ldr	r5, [pc, #792]	@ (80140bc <fn_08013CE0+0x3dc>)
 8013da2:	2300      	movs	r3, #0
 8013da4:	2202      	movs	r2, #2
 8013da6:	2128      	movs	r1, #40	@ 0x28
 8013da8:	5160      	str	r0, [r4, r5]
 8013daa:	f009 fce9 	bl	801d780 <fn_0801D780>
 8013dae:	23df      	movs	r3, #223	@ 0xdf
 8013db0:	011b      	lsls	r3, r3, #4
 8013db2:	50e0      	str	r0, [r4, r3]
 8013db4:	6834      	ldr	r4, [r6, #0]
 8013db6:	5960      	ldr	r0, [r4, r5]
 8013db8:	2200      	movs	r2, #0
 8013dba:	2102      	movs	r1, #2
 8013dbc:	0040      	lsls	r0, r0, #1
 8013dbe:	4699      	mov	r9, r3
 8013dc0:	f009 fc5c 	bl	801d67c <fn_0801D67C>
 8013dc4:	4bbe      	ldr	r3, [pc, #760]	@ (80140c0 <fn_08013CE0+0x3e0>)
 8013dc6:	50e0      	str	r0, [r4, r3]
 8013dc8:	6834      	ldr	r4, [r6, #0]
 8013dca:	4bbe      	ldr	r3, [pc, #760]	@ (80140c4 <fn_08013CE0+0x3e4>)
 8013dcc:	50e7      	str	r7, [r4, r3]
 8013dce:	5963      	ldr	r3, [r4, r5]
 8013dd0:	2b00      	cmp	r3, #0
 8013dd2:	dd46      	ble.n	8013e62 <fn_08013CE0+0x182>
 8013dd4:	4650      	mov	r0, sl
 8013dd6:	f009 fbc7 	bl	801d568 <fn_0801D568>
 8013dda:	2324      	movs	r3, #36	@ 0x24
 8013ddc:	469b      	mov	fp, r3
 8013dde:	3301      	adds	r3, #1
 8013de0:	0005      	movs	r5, r0
 8013de2:	469a      	mov	sl, r3
 8013de4:	464a      	mov	r2, r9
 8013de6:	00bb      	lsls	r3, r7, #2
 8013de8:	58a4      	ldr	r4, [r4, r2]
 8013dea:	19db      	adds	r3, r3, r7
 8013dec:	00db      	lsls	r3, r3, #3
 8013dee:	18e4      	adds	r4, r4, r3
 8013df0:	786b      	ldrb	r3, [r5, #1]
 8013df2:	782a      	ldrb	r2, [r5, #0]
 8013df4:	021b      	lsls	r3, r3, #8
 8013df6:	4313      	orrs	r3, r2
 8013df8:	041b      	lsls	r3, r3, #16
 8013dfa:	6023      	str	r3, [r4, #0]
 8013dfc:	78eb      	ldrb	r3, [r5, #3]
 8013dfe:	78aa      	ldrb	r2, [r5, #2]
 8013e00:	021b      	lsls	r3, r3, #8
 8013e02:	4313      	orrs	r3, r2
 8013e04:	041b      	lsls	r3, r3, #16
 8013e06:	6063      	str	r3, [r4, #4]
 8013e08:	1d28      	adds	r0, r5, #4
 8013e0a:	f005 f903 	bl	8019014 <fn_08019014>
 8013e0e:	465b      	mov	r3, fp
 8013e10:	54e0      	strb	r0, [r4, r3]
 8013e12:	0028      	movs	r0, r5
 8013e14:	300c      	adds	r0, #12
 8013e16:	f005 f8fd 	bl	8019014 <fn_08019014>
 8013e1a:	4653      	mov	r3, sl
 8013e1c:	54e0      	strb	r0, [r4, r3]
 8013e1e:	2326      	movs	r3, #38	@ 0x26
 8013e20:	7d2a      	ldrb	r2, [r5, #20]
 8013e22:	54e2      	strb	r2, [r4, r3]
 8013e24:	7deb      	ldrb	r3, [r5, #23]
 8013e26:	7daa      	ldrb	r2, [r5, #22]
 8013e28:	021b      	lsls	r3, r3, #8
 8013e2a:	4313      	orrs	r3, r2
 8013e2c:	8423      	strh	r3, [r4, #32]
 8013e2e:	0020      	movs	r0, r4
 8013e30:	f001 fb5e 	bl	80154f0 <fn_080154F0>
 8013e34:	2227      	movs	r2, #39	@ 0x27
 8013e36:	2301      	movs	r3, #1
 8013e38:	2104      	movs	r1, #4
 8013e3a:	4003      	ands	r3, r0
 8013e3c:	5ca0      	ldrb	r0, [r4, r2]
 8013e3e:	009b      	lsls	r3, r3, #2
 8013e40:	4388      	bics	r0, r1
 8013e42:	4318      	orrs	r0, r3
 8013e44:	54a0      	strb	r0, [r4, r2]
 8013e46:	7e6b      	ldrb	r3, [r5, #25]
 8013e48:	7e2a      	ldrb	r2, [r5, #24]
 8013e4a:	021b      	lsls	r3, r3, #8
 8013e4c:	4313      	orrs	r3, r2
 8013e4e:	8463      	strh	r3, [r4, #34]	@ 0x22
 8013e50:	2300      	movs	r3, #0
 8013e52:	60e3      	str	r3, [r4, #12]
 8013e54:	6834      	ldr	r4, [r6, #0]
 8013e56:	4b99      	ldr	r3, [pc, #612]	@ (80140bc <fn_08013CE0+0x3dc>)
 8013e58:	58e3      	ldr	r3, [r4, r3]
 8013e5a:	3701      	adds	r7, #1
 8013e5c:	351a      	adds	r5, #26
 8013e5e:	429f      	cmp	r7, r3
 8013e60:	dbc0      	blt.n	8013de4 <fn_08013CE0+0x104>
 8013e62:	4643      	mov	r3, r8
 8013e64:	1c9f      	adds	r7, r3, #2
 8013e66:	0038      	movs	r0, r7
 8013e68:	f009 fb64 	bl	801d534 <fn_0801D534>
 8013e6c:	4b96      	ldr	r3, [pc, #600]	@ (80140c8 <fn_08013CE0+0x3e8>)
 8013e6e:	0945      	lsrs	r5, r0, #5
 8013e70:	50e5      	str	r5, [r4, r3]
 8013e72:	0038      	movs	r0, r7
 8013e74:	469a      	mov	sl, r3
 8013e76:	f009 fb77 	bl	801d568 <fn_0801D568>
 8013e7a:	23e0      	movs	r3, #224	@ 0xe0
 8013e7c:	011b      	lsls	r3, r3, #4
 8013e7e:	2202      	movs	r2, #2
 8013e80:	50e0      	str	r0, [r4, r3]
 8013e82:	2104      	movs	r1, #4
 8013e84:	0028      	movs	r0, r5
 8013e86:	4699      	mov	r9, r3
 8013e88:	2300      	movs	r3, #0
 8013e8a:	f009 fc79 	bl	801d780 <fn_0801D780>
 8013e8e:	4b8f      	ldr	r3, [pc, #572]	@ (80140cc <fn_08013CE0+0x3ec>)
 8013e90:	50e0      	str	r0, [r4, r3]
 8013e92:	4643      	mov	r3, r8
 8013e94:	1cdc      	adds	r4, r3, #3
 8013e96:	0020      	movs	r0, r4
 8013e98:	f009 fb4c 	bl	801d534 <fn_0801D534>
 8013e9c:	210c      	movs	r1, #12
 8013e9e:	f011 fbb9 	bl	8025614 <fn_08025614>
 8013ea2:	6835      	ldr	r5, [r6, #0]
 8013ea4:	4b8a      	ldr	r3, [pc, #552]	@ (80140d0 <fn_08013CE0+0x3f0>)
 8013ea6:	0007      	movs	r7, r0
 8013ea8:	50e8      	str	r0, [r5, r3]
 8013eaa:	0020      	movs	r0, r4
 8013eac:	f009 fb5c 	bl	801d568 <fn_0801D568>
 8013eb0:	4b88      	ldr	r3, [pc, #544]	@ (80140d4 <fn_08013CE0+0x3f4>)
 8013eb2:	50e8      	str	r0, [r5, r3]
 8013eb4:	4653      	mov	r3, sl
 8013eb6:	58e9      	ldr	r1, [r5, r3]
 8013eb8:	2900      	cmp	r1, #0
 8013eba:	dc00      	bgt.n	8013ebe <fn_08013CE0+0x1de>
 8013ebc:	e1aa      	b.n	8014214 <fn_08013CE0+0x534>
 8013ebe:	464b      	mov	r3, r9
 8013ec0:	2400      	movs	r4, #0
 8013ec2:	58eb      	ldr	r3, [r5, r3]
 8013ec4:	0149      	lsls	r1, r1, #5
 8013ec6:	3314      	adds	r3, #20
 8013ec8:	18c9      	adds	r1, r1, r3
 8013eca:	2006      	movs	r0, #6
 8013ecc:	5e1a      	ldrsh	r2, [r3, r0]
 8013ece:	2a00      	cmp	r2, #0
 8013ed0:	d007      	beq.n	8013ee2 <fn_08013CE0+0x202>
 8013ed2:	881a      	ldrh	r2, [r3, #0]
 8013ed4:	4880      	ldr	r0, [pc, #512]	@ (80140d8 <fn_08013CE0+0x3f8>)
 8013ed6:	1810      	adds	r0, r2, r0
 8013ed8:	2800      	cmp	r0, #0
 8013eda:	d002      	beq.n	8013ee2 <fn_08013CE0+0x202>
 8013edc:	42a2      	cmp	r2, r4
 8013ede:	d300      	bcc.n	8013ee2 <fn_08013CE0+0x202>
 8013ee0:	1c54      	adds	r4, r2, #1
 8013ee2:	3320      	adds	r3, #32
 8013ee4:	4299      	cmp	r1, r3
 8013ee6:	d1f0      	bne.n	8013eca <fn_08013CE0+0x1ea>
 8013ee8:	23e1      	movs	r3, #225	@ 0xe1
 8013eea:	011b      	lsls	r3, r3, #4
 8013eec:	50ec      	str	r4, [r5, r3]
 8013eee:	2300      	movs	r3, #0
 8013ef0:	4a7a      	ldr	r2, [pc, #488]	@ (80140dc <fn_08013CE0+0x3fc>)
 8013ef2:	50ab      	str	r3, [r5, r2]
 8013ef4:	2c00      	cmp	r4, #0
 8013ef6:	d013      	beq.n	8013f20 <fn_08013CE0+0x240>
 8013ef8:	0067      	lsls	r7, r4, #1
 8013efa:	193f      	adds	r7, r7, r4
 8013efc:	00bf      	lsls	r7, r7, #2
 8013efe:	2200      	movs	r2, #0
 8013f00:	2102      	movs	r1, #2
 8013f02:	0038      	movs	r0, r7
 8013f04:	f009 fbba 	bl	801d67c <fn_0801D67C>
 8013f08:	4a74      	ldr	r2, [pc, #464]	@ (80140dc <fn_08013CE0+0x3fc>)
 8013f0a:	6833      	ldr	r3, [r6, #0]
 8013f0c:	50a8      	str	r0, [r5, r2]
 8013f0e:	5898      	ldr	r0, [r3, r2]
 8013f10:	4a70      	ldr	r2, [pc, #448]	@ (80140d4 <fn_08013CE0+0x3f4>)
 8013f12:	5899      	ldr	r1, [r3, r2]
 8013f14:	003a      	movs	r2, r7
 8013f16:	f00c fc17 	bl	8020748 <fn_08020748>
 8013f1a:	6835      	ldr	r5, [r6, #0]
 8013f1c:	4b6c      	ldr	r3, [pc, #432]	@ (80140d0 <fn_08013CE0+0x3f0>)
 8013f1e:	58ef      	ldr	r7, [r5, r3]
 8013f20:	2f00      	cmp	r7, #0
 8013f22:	dd1e      	ble.n	8013f62 <fn_08013CE0+0x282>
 8013f24:	2300      	movs	r3, #0
 8013f26:	4699      	mov	r9, r3
 8013f28:	4b69      	ldr	r3, [pc, #420]	@ (80140d0 <fn_08013CE0+0x3f0>)
 8013f2a:	2400      	movs	r4, #0
 8013f2c:	469a      	mov	sl, r3
 8013f2e:	4f69      	ldr	r7, [pc, #420]	@ (80140d4 <fn_08013CE0+0x3f4>)
 8013f30:	59eb      	ldr	r3, [r5, r7]
 8013f32:	191b      	adds	r3, r3, r4
 8013f34:	8918      	ldrh	r0, [r3, #8]
 8013f36:	f004 fe2d 	bl	8018b94 <fn_08018B94>
 8013f3a:	6833      	ldr	r3, [r6, #0]
 8013f3c:	59db      	ldr	r3, [r3, r7]
 8013f3e:	191b      	adds	r3, r3, r4
 8013f40:	8898      	ldrh	r0, [r3, #4]
 8013f42:	f004 fe27 	bl	8018b94 <fn_08018B94>
 8013f46:	6833      	ldr	r3, [r6, #0]
 8013f48:	59db      	ldr	r3, [r3, r7]
 8013f4a:	191b      	adds	r3, r3, r4
 8013f4c:	88d8      	ldrh	r0, [r3, #6]
 8013f4e:	f004 fe21 	bl	8018b94 <fn_08018B94>
 8013f52:	2301      	movs	r3, #1
 8013f54:	4499      	add	r9, r3
 8013f56:	4653      	mov	r3, sl
 8013f58:	6835      	ldr	r5, [r6, #0]
 8013f5a:	58eb      	ldr	r3, [r5, r3]
 8013f5c:	340c      	adds	r4, #12
 8013f5e:	4599      	cmp	r9, r3
 8013f60:	dbe6      	blt.n	8013f30 <fn_08013CE0+0x250>
 8013f62:	4640      	mov	r0, r8
 8013f64:	3009      	adds	r0, #9
 8013f66:	f009 faff 	bl	801d568 <fn_0801D568>
 8013f6a:	2200      	movs	r2, #0
 8013f6c:	5e83      	ldrsh	r3, [r0, r2]
 8013f6e:	4f5c      	ldr	r7, [pc, #368]	@ (80140e0 <fn_08013CE0+0x400>)
 8013f70:	4a5c      	ldr	r2, [pc, #368]	@ (80140e4 <fn_08013CE0+0x404>)
 8013f72:	041b      	lsls	r3, r3, #16
 8013f74:	51e8      	str	r0, [r5, r7]
 8013f76:	50ab      	str	r3, [r5, r2]
 8013f78:	2202      	movs	r2, #2
 8013f7a:	5e83      	ldrsh	r3, [r0, r2]
 8013f7c:	4a5a      	ldr	r2, [pc, #360]	@ (80140e8 <fn_08013CE0+0x408>)
 8013f7e:	041b      	lsls	r3, r3, #16
 8013f80:	50ab      	str	r3, [r5, r2]
 8013f82:	8883      	ldrh	r3, [r0, #4]
 8013f84:	4a59      	ldr	r2, [pc, #356]	@ (80140ec <fn_08013CE0+0x40c>)
 8013f86:	88c0      	ldrh	r0, [r0, #6]
 8013f88:	50ab      	str	r3, [r5, r2]
 8013f8a:	4a59      	ldr	r2, [pc, #356]	@ (80140f0 <fn_08013CE0+0x410>)
 8013f8c:	2104      	movs	r1, #4
 8013f8e:	50a8      	str	r0, [r5, r2]
 8013f90:	2202      	movs	r2, #2
 8013f92:	4358      	muls	r0, r3
 8013f94:	2300      	movs	r3, #0
 8013f96:	f009 fbf3 	bl	801d780 <fn_0801D780>
 8013f9a:	23e3      	movs	r3, #227	@ 0xe3
 8013f9c:	22e2      	movs	r2, #226	@ 0xe2
 8013f9e:	6834      	ldr	r4, [r6, #0]
 8013fa0:	011b      	lsls	r3, r3, #4
 8013fa2:	50e8      	str	r0, [r5, r3]
 8013fa4:	59e3      	ldr	r3, [r4, r7]
 8013fa6:	0112      	lsls	r2, r2, #4
 8013fa8:	3308      	adds	r3, #8
 8013faa:	50a3      	str	r3, [r4, r2]
 8013fac:	4643      	mov	r3, r8
 8013fae:	1d5f      	adds	r7, r3, #5
 8013fb0:	0038      	movs	r0, r7
 8013fb2:	f009 fabf 	bl	801d534 <fn_0801D534>
 8013fb6:	4b4f      	ldr	r3, [pc, #316]	@ (80140f4 <fn_08013CE0+0x414>)
 8013fb8:	0885      	lsrs	r5, r0, #2
 8013fba:	50e5      	str	r5, [r4, r3]
 8013fbc:	0038      	movs	r0, r7
 8013fbe:	f009 fad3 	bl	801d568 <fn_0801D568>
 8013fc2:	4b4d      	ldr	r3, [pc, #308]	@ (80140f8 <fn_08013CE0+0x418>)
 8013fc4:	50e0      	str	r0, [r4, r3]
 8013fc6:	2d00      	cmp	r5, #0
 8013fc8:	d100      	bne.n	8013fcc <fn_08013CE0+0x2ec>
 8013fca:	e0ff      	b.n	80141cc <fn_08013CE0+0x4ec>
 8013fcc:	2800      	cmp	r0, #0
 8013fce:	d100      	bne.n	8013fd2 <fn_08013CE0+0x2f2>
 8013fd0:	e0fc      	b.n	80141cc <fn_08013CE0+0x4ec>
 8013fd2:	4643      	mov	r3, r8
 8013fd4:	1d9d      	adds	r5, r3, #6
 8013fd6:	0028      	movs	r0, r5
 8013fd8:	f009 faac 	bl	801d534 <fn_0801D534>
 8013fdc:	4b47      	ldr	r3, [pc, #284]	@ (80140fc <fn_08013CE0+0x41c>)
 8013fde:	4699      	mov	r9, r3
 8013fe0:	211c      	movs	r1, #28
 8013fe2:	0007      	movs	r7, r0
 8013fe4:	f011 fb16 	bl	8025614 <fn_08025614>
 8013fe8:	464b      	mov	r3, r9
 8013fea:	6018      	str	r0, [r3, #0]
 8013fec:	0028      	movs	r0, r5
 8013fee:	f009 fabb 	bl	801d568 <fn_0801D568>
 8013ff2:	4b43      	ldr	r3, [pc, #268]	@ (8014100 <fn_08013CE0+0x420>)
 8013ff4:	6018      	str	r0, [r3, #0]
 8013ff6:	2800      	cmp	r0, #0
 8013ff8:	d100      	bne.n	8013ffc <fn_08013CE0+0x31c>
 8013ffa:	e0de      	b.n	80141ba <fn_08013CE0+0x4da>
 8013ffc:	2f1b      	cmp	r7, #27
 8013ffe:	d800      	bhi.n	8014002 <fn_08013CE0+0x322>
 8014000:	e0db      	b.n	80141ba <fn_08013CE0+0x4da>
 8014002:	4643      	mov	r3, r8
 8014004:	1d1d      	adds	r5, r3, #4
 8014006:	0028      	movs	r0, r5
 8014008:	f009 fa94 	bl	801d534 <fn_0801D534>
 801400c:	0007      	movs	r7, r0
 801400e:	0028      	movs	r0, r5
 8014010:	f009 faaa 	bl	801d568 <fn_0801D568>
 8014014:	4b3b      	ldr	r3, [pc, #236]	@ (8014104 <fn_08013CE0+0x424>)
 8014016:	50e0      	str	r0, [r4, r3]
 8014018:	2f13      	cmp	r7, #19
 801401a:	d800      	bhi.n	801401e <fn_08013CE0+0x33e>
 801401c:	e0ec      	b.n	80141f8 <fn_08013CE0+0x518>
 801401e:	4b27      	ldr	r3, [pc, #156]	@ (80140bc <fn_08013CE0+0x3dc>)
 8014020:	58e5      	ldr	r5, [r4, r3]
 8014022:	2d00      	cmp	r5, #0
 8014024:	dd19      	ble.n	801405a <fn_08013CE0+0x37a>
 8014026:	4640      	mov	r0, r8
 8014028:	300a      	adds	r0, #10
 801402a:	f009 fa9d 	bl	801d568 <fn_0801D568>
 801402e:	23df      	movs	r3, #223	@ 0xdf
 8014030:	1c6f      	adds	r7, r5, #1
 8014032:	00ad      	lsls	r5, r5, #2
 8014034:	46ac      	mov	ip, r5
 8014036:	0002      	movs	r2, r0
 8014038:	011b      	lsls	r3, r3, #4
 801403a:	58e1      	ldr	r1, [r4, r3]
 801403c:	00bf      	lsls	r7, r7, #2
 801403e:	3118      	adds	r1, #24
 8014040:	4484      	add	ip, r0
 8014042:	6815      	ldr	r5, [r2, #0]
 8014044:	006b      	lsls	r3, r5, #1
 8014046:	19db      	adds	r3, r3, r7
 8014048:	18c3      	adds	r3, r0, r3
 801404a:	600b      	str	r3, [r1, #0]
 801404c:	6853      	ldr	r3, [r2, #4]
 801404e:	3204      	adds	r2, #4
 8014050:	1b5b      	subs	r3, r3, r5
 8014052:	80cb      	strh	r3, [r1, #6]
 8014054:	3128      	adds	r1, #40	@ 0x28
 8014056:	4594      	cmp	ip, r2
 8014058:	d1f3      	bne.n	8014042 <fn_08013CE0+0x362>
 801405a:	4645      	mov	r5, r8
 801405c:	4b14      	ldr	r3, [pc, #80]	@ (80140b0 <fn_08013CE0+0x3d0>)
 801405e:	3508      	adds	r5, #8
 8014060:	50e5      	str	r5, [r4, r3]
 8014062:	0028      	movs	r0, r5
 8014064:	f009 fa66 	bl	801d534 <fn_0801D534>
 8014068:	2300      	movs	r3, #0
 801406a:	2800      	cmp	r0, #0
 801406c:	d003      	beq.n	8014076 <fn_08013CE0+0x396>
 801406e:	0028      	movs	r0, r5
 8014070:	f009 fa7a 	bl	801d568 <fn_0801D568>
 8014074:	0003      	movs	r3, r0
 8014076:	4a24      	ldr	r2, [pc, #144]	@ (8014108 <fn_08013CE0+0x428>)
 8014078:	50a3      	str	r3, [r4, r2]
 801407a:	4b24      	ldr	r3, [pc, #144]	@ (801410c <fn_08013CE0+0x42c>)
 801407c:	2100      	movs	r1, #0
 801407e:	18e0      	adds	r0, r4, r3
 8014080:	220a      	movs	r2, #10
 8014082:	f00c fc85 	bl	8020990 <fn_08020990>
 8014086:	23e0      	movs	r3, #224	@ 0xe0
 8014088:	2200      	movs	r2, #0
 801408a:	50e2      	str	r2, [r4, r3]
 801408c:	4644      	mov	r4, r8
 801408e:	f7fb fea9 	bl	800fde4 <fn_0800FDE4>
 8014092:	1c60      	adds	r0, r4, #1
 8014094:	f009 fa4e 	bl	801d534 <fn_0801D534>
 8014098:	210a      	movs	r1, #10
 801409a:	4680      	mov	r8, r0
 801409c:	e038      	b.n	8014110 <fn_08013CE0+0x430>
 801409e:	46c0      	nop			@ (mov r8, r8)
 80140a0:	030064c4 	.word	0x030064c4	@ data_030064C4
 80140a4:	00000878 	.word	0x00000878
 80140a8:	0000087c 	.word	0x0000087c
 80140ac:	000041b4 	.word	0x000041b4
 80140b0:	00000e34 	.word	0x00000e34
 80140b4:	0814927c 	.word	0x0814927c
 80140b8:	000010ec 	.word	0x000010ec
 80140bc:	00000dec 	.word	0x00000dec
 80140c0:	0000085c 	.word	0x0000085c
 80140c4:	00000864 	.word	0x00000864
 80140c8:	00000dfc 	.word	0x00000dfc
 80140cc:	00000e04 	.word	0x00000e04
 80140d0:	00000e08 	.word	0x00000e08
 80140d4:	00000e0c 	.word	0x00000e0c
 80140d8:	ffff0001 	.word	0xffff0001
 80140dc:	00000e14 	.word	0x00000e14
 80140e0:	00000e24 	.word	0x00000e24
 80140e4:	00000e28 	.word	0x00000e28
 80140e8:	00000e2c 	.word	0x00000e2c
 80140ec:	00000e18 	.word	0x00000e18
 80140f0:	00000e1c 	.word	0x00000e1c
 80140f4:	00000df4 	.word	0x00000df4
 80140f8:	00000df8 	.word	0x00000df8
 80140fc:	030065dc 	.word	0x030065dc	@ data_030065DC
 8014100:	030065e0 	.word	0x030065e0	@ data_030065E0
 8014104:	00000de8 	.word	0x00000de8
 8014108:	00000e38 	.word	0x00000e38
 801410c:	00000e3c 	.word	0x00000e3c
 8014110:	f011 fa80 	bl	8025614 <fn_08025614>
 8014114:	0007      	movs	r7, r0
 8014116:	1c60      	adds	r0, r4, #1
 8014118:	f009 fa26 	bl	801d568 <fn_0801D568>
 801411c:	4681      	mov	r9, r0
 801411e:	2800      	cmp	r0, #0
 8014120:	d066      	beq.n	80141f0 <fn_08013CE0+0x510>
 8014122:	4643      	mov	r3, r8
 8014124:	2b09      	cmp	r3, #9
 8014126:	d963      	bls.n	80141f0 <fn_08013CE0+0x510>
 8014128:	2300      	movs	r3, #0
 801412a:	2164      	movs	r1, #100	@ 0x64
 801412c:	2202      	movs	r2, #2
 801412e:	0038      	movs	r0, r7
 8014130:	6834      	ldr	r4, [r6, #0]
 8014132:	f009 fb25 	bl	801d780 <fn_0801D780>
 8014136:	4d3b      	ldr	r5, [pc, #236]	@ (8014224 <fn_08013CE0+0x544>)
 8014138:	4b3b      	ldr	r3, [pc, #236]	@ (8014228 <fn_08013CE0+0x548>)
 801413a:	6831      	ldr	r1, [r6, #0]
 801413c:	5160      	str	r0, [r4, r5]
 801413e:	50cf      	str	r7, [r1, r3]
 8014140:	4643      	mov	r3, r8
 8014142:	2b09      	cmp	r3, #9
 8014144:	d920      	bls.n	8014188 <fn_08013CE0+0x4a8>
 8014146:	2064      	movs	r0, #100	@ 0x64
 8014148:	2200      	movs	r2, #0
 801414a:	2489      	movs	r4, #137	@ 0x89
 801414c:	4378      	muls	r0, r7
 801414e:	594b      	ldr	r3, [r1, r5]
 8014150:	189b      	adds	r3, r3, r2
 8014152:	335a      	adds	r3, #90	@ 0x5a
 8014154:	3264      	adds	r2, #100	@ 0x64
 8014156:	701c      	strb	r4, [r3, #0]
 8014158:	4290      	cmp	r0, r2
 801415a:	d1f8      	bne.n	801414e <fn_08013CE0+0x46e>
 801415c:	464c      	mov	r4, r9
 801415e:	00bd      	lsls	r5, r7, #2
 8014160:	19ed      	adds	r5, r5, r7
 8014162:	006d      	lsls	r5, r5, #1
 8014164:	1965      	adds	r5, r4, r5
 8014166:	79e0      	ldrb	r0, [r4, #7]
 8014168:	79a3      	ldrb	r3, [r4, #6]
 801416a:	0200      	lsls	r0, r0, #8
 801416c:	4318      	orrs	r0, r3
 801416e:	0400      	lsls	r0, r0, #16
 8014170:	1400      	asrs	r0, r0, #16
 8014172:	f7fd fd53 	bl	8011c1c <fn_08011C1C>
 8014176:	2800      	cmp	r0, #0
 8014178:	d002      	beq.n	8014180 <fn_08013CE0+0x4a0>
 801417a:	0020      	movs	r0, r4
 801417c:	f7fd fd64 	bl	8011c48 <fn_08011C48>
 8014180:	340a      	adds	r4, #10
 8014182:	42a5      	cmp	r5, r4
 8014184:	d1ef      	bne.n	8014166 <fn_08013CE0+0x486>
 8014186:	6831      	ldr	r1, [r6, #0]
 8014188:	4b28      	ldr	r3, [pc, #160]	@ (801422c <fn_08013CE0+0x54c>)
 801418a:	5ccb      	ldrb	r3, [r1, r3]
 801418c:	2b00      	cmp	r3, #0
 801418e:	d003      	beq.n	8014198 <fn_08013CE0+0x4b8>
 8014190:	23e0      	movs	r3, #224	@ 0xe0
 8014192:	58cb      	ldr	r3, [r1, r3]
 8014194:	2b00      	cmp	r3, #0
 8014196:	d037      	beq.n	8014208 <fn_08013CE0+0x528>
 8014198:	2394      	movs	r3, #148	@ 0x94
 801419a:	5ccb      	ldrb	r3, [r1, r3]
 801419c:	2b02      	cmp	r3, #2
 801419e:	d030      	beq.n	8014202 <fn_08013CE0+0x522>
 80141a0:	f002 fd5c 	bl	8016c5c <fn_08016C5C>
 80141a4:	f7fb fe20 	bl	800fde8 <fn_0800FDE8>
 80141a8:	b007      	add	sp, #28
 80141aa:	bcf0      	pop	{r4, r5, r6, r7}
 80141ac:	46bb      	mov	fp, r7
 80141ae:	46b2      	mov	sl, r6
 80141b0:	46a9      	mov	r9, r5
 80141b2:	46a0      	mov	r8, r4
 80141b4:	bcf0      	pop	{r4, r5, r6, r7}
 80141b6:	bc01      	pop	{r0}
 80141b8:	4700      	bx	r0
 80141ba:	4b1d      	ldr	r3, [pc, #116]	@ (8014230 <fn_08013CE0+0x550>)
 80141bc:	58e3      	ldr	r3, [r4, r3]
 80141be:	2b01      	cmp	r3, #1
 80141c0:	d009      	beq.n	80141d6 <fn_08013CE0+0x4f6>
 80141c2:	481c      	ldr	r0, [pc, #112]	@ (8014234 <fn_08013CE0+0x554>)
 80141c4:	f7ec f9f0 	bl	80005a8 <fn_080005A8>
 80141c8:	6834      	ldr	r4, [r6, #0]
 80141ca:	e71a      	b.n	8014002 <fn_08013CE0+0x322>
 80141cc:	481a      	ldr	r0, [pc, #104]	@ (8014238 <fn_08013CE0+0x558>)
 80141ce:	f7ec f9eb 	bl	80005a8 <fn_080005A8>
 80141d2:	6834      	ldr	r4, [r6, #0]
 80141d4:	e6fd      	b.n	8013fd2 <fn_08013CE0+0x2f2>
 80141d6:	4819      	ldr	r0, [pc, #100]	@ (801423c <fn_08013CE0+0x55c>)
 80141d8:	f7f1 f924 	bl	8005424 <fn_08005424>
 80141dc:	6834      	ldr	r4, [r6, #0]
 80141de:	e710      	b.n	8014002 <fn_08013CE0+0x322>
 80141e0:	ac03      	add	r4, sp, #12
 80141e2:	002b      	movs	r3, r5
 80141e4:	2109      	movs	r1, #9
 80141e6:	0020      	movs	r0, r4
 80141e8:	4a15      	ldr	r2, [pc, #84]	@ (8014240 <fn_08013CE0+0x560>)
 80141ea:	f7f1 f935 	bl	8005458 <fn_08005458>
 80141ee:	e5c6      	b.n	8013d7e <fn_08013CE0+0x9e>
 80141f0:	4814      	ldr	r0, [pc, #80]	@ (8014244 <fn_08013CE0+0x564>)
 80141f2:	f7ec f9d9 	bl	80005a8 <fn_080005A8>
 80141f6:	e797      	b.n	8014128 <fn_08013CE0+0x448>
 80141f8:	4813      	ldr	r0, [pc, #76]	@ (8014248 <fn_08013CE0+0x568>)
 80141fa:	f7ec f9d5 	bl	80005a8 <fn_080005A8>
 80141fe:	6834      	ldr	r4, [r6, #0]
 8014200:	e70d      	b.n	801401e <fn_08013CE0+0x33e>
 8014202:	f7f5 ffcd 	bl	800a1a0 <fn_0800A1A0>
 8014206:	e7cb      	b.n	80141a0 <fn_08013CE0+0x4c0>
 8014208:	2102      	movs	r1, #2
 801420a:	4810      	ldr	r0, [pc, #64]	@ (801424c <fn_08013CE0+0x56c>)
 801420c:	f7ec f9cc 	bl	80005a8 <fn_080005A8>
 8014210:	6831      	ldr	r1, [r6, #0]
 8014212:	e7c1      	b.n	8014198 <fn_08013CE0+0x4b8>
 8014214:	22e1      	movs	r2, #225	@ 0xe1
 8014216:	2300      	movs	r3, #0
 8014218:	0112      	lsls	r2, r2, #4
 801421a:	50ab      	str	r3, [r5, r2]
 801421c:	4a0c      	ldr	r2, [pc, #48]	@ (8014250 <fn_08013CE0+0x570>)
 801421e:	50ab      	str	r3, [r5, r2]
 8014220:	e67e      	b.n	8013f20 <fn_08013CE0+0x240>
 8014222:	46c0      	nop			@ (mov r8, r8)
 8014224:	00000e48 	.word	0x00000e48
 8014228:	00000e4c 	.word	0x00000e4c
 801422c:	0000025d 	.word	0x0000025d
 8014230:	00000df4 	.word	0x00000df4
 8014234:	0814a004 	.word	0x0814a004
 8014238:	08149fa4 	.word	0x08149fa4
 801423c:	08149fd0 	.word	0x08149fd0
 8014240:	0814926c 	.word	0x0814926c
 8014244:	0814a044 	.word	0x0814a044
 8014248:	0814a024 	.word	0x0814a024
 801424c:	0814a068 	.word	0x0814a068
 8014250:	00000e14 	.word	0x00000e14
