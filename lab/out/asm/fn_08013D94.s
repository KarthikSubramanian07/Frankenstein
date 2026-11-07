fn_08013D94:
 8013d94:	b5f0      	push	{r4, r5, r6, r7, lr}
 8013d96:	46de      	mov	lr, fp
 8013d98:	4645      	mov	r5, r8
 8013d9a:	4657      	mov	r7, sl
 8013d9c:	464e      	mov	r6, r9
 8013d9e:	22f6      	movs	r2, #246	@ 0xf6
 8013da0:	2400      	movs	r4, #0
 8013da2:	b5e0      	push	{r5, r6, r7, lr}
 8013da4:	000d      	movs	r5, r1
 8013da6:	21b4      	movs	r1, #180	@ 0xb4
 8013da8:	4eea      	ldr	r6, [pc, #936]	@ (8014154 <fn_08013D94+0x3c0>)
 8013daa:	6833      	ldr	r3, [r6, #0]
 8013dac:	0052      	lsls	r2, r2, #1
 8013dae:	b087      	sub	sp, #28
 8013db0:	509c      	str	r4, [r3, r2]
 8013db2:	3a04      	subs	r2, #4
 8013db4:	509c      	str	r4, [r3, r2]
 8013db6:	3a04      	subs	r2, #4
 8013db8:	509c      	str	r4, [r3, r2]
 8013dba:	322c      	adds	r2, #44	@ 0x2c
 8013dbc:	5099      	str	r1, [r3, r2]
 8013dbe:	3a80      	subs	r2, #128	@ 0x80
 8013dc0:	509c      	str	r4, [r3, r2]
 8013dc2:	3204      	adds	r2, #4
 8013dc4:	509c      	str	r4, [r3, r2]
 8013dc6:	3a08      	subs	r2, #8
 8013dc8:	509c      	str	r4, [r3, r2]
 8013dca:	39b3      	subs	r1, #179	@ 0xb3
 8013dcc:	3a9c      	subs	r2, #156	@ 0x9c
 8013dce:	5099      	str	r1, [r3, r2]
 8013dd0:	4680      	mov	r8, r0
 8013dd2:	f006 fed5 	bl	801ab80 <fn_0801AB80>
 8013dd6:	f005 fa8f 	bl	80192f8 <fn_080192F8>
 8013dda:	2103      	movs	r1, #3
 8013ddc:	2002      	movs	r0, #2
 8013dde:	f009 fdb9 	bl	801d954 <fn_0801D954>
 8013de2:	4fdd      	ldr	r7, [pc, #884]	@ (8014158 <fn_08013D94+0x3c4>)
 8013de4:	6833      	ldr	r3, [r6, #0]
 8013de6:	59d8      	ldr	r0, [r3, r7]
 8013de8:	f009 fc56 	bl	801d698 <fn_0801D698>
 8013dec:	2288      	movs	r2, #136	@ 0x88
 8013dee:	6833      	ldr	r3, [r6, #0]
 8013df0:	0112      	lsls	r2, r2, #4
 8013df2:	51dc      	str	r4, [r3, r7]
 8013df4:	509c      	str	r4, [r3, r2]
 8013df6:	4ad9      	ldr	r2, [pc, #868]	@ (801415c <fn_08013D94+0x3c8>)
 8013df8:	509c      	str	r4, [r3, r2]
 8013dfa:	4ad9      	ldr	r2, [pc, #868]	@ (8014160 <fn_08013D94+0x3cc>)
 8013dfc:	5898      	ldr	r0, [r3, r2]
 8013dfe:	f004 ff23 	bl	8018c48 <fn_08018C48>
 8013e02:	6831      	ldr	r1, [r6, #0]
 8013e04:	4ad7      	ldr	r2, [pc, #860]	@ (8014164 <fn_08013D94+0x3d0>)
 8013e06:	588b      	ldr	r3, [r1, r2]
 8013e08:	3301      	adds	r3, #1
 8013e0a:	d002      	beq.n	8013e12 <fn_08013D94+0x7e>
 8013e0c:	2301      	movs	r3, #1
 8013e0e:	425b      	negs	r3, r3
 8013e10:	508b      	str	r3, [r1, r2]
 8013e12:	f004 fbcd 	bl	80185b0 <fn_080185B0>
 8013e16:	2394      	movs	r3, #148	@ 0x94
 8013e18:	6832      	ldr	r2, [r6, #0]
 8013e1a:	5cd3      	ldrb	r3, [r2, r3]
 8013e1c:	2b02      	cmp	r3, #2
 8013e1e:	d100      	bne.n	8013e22 <fn_08013D94+0x8e>
 8013e20:	e238      	b.n	8014294 <fn_08013D94+0x500>
 8013e22:	ac03      	add	r4, sp, #12
 8013e24:	4643      	mov	r3, r8
 8013e26:	2109      	movs	r1, #9
 8013e28:	0020      	movs	r0, r4
 8013e2a:	4acf      	ldr	r2, [pc, #828]	@ (8014168 <fn_08013D94+0x3d4>)
 8013e2c:	9500      	str	r5, [sp, #0]
 8013e2e:	f7f1 fb13 	bl	8005458 <fn_08005458>
 8013e32:	0020      	movs	r0, r4
 8013e34:	f009 fb7c 	bl	801d530 <fn_0801D530>
 8013e38:	2700      	movs	r7, #0
 8013e3a:	6834      	ldr	r4, [r6, #0]
 8013e3c:	4bcb      	ldr	r3, [pc, #812]	@ (801416c <fn_08013D94+0x3d8>)
 8013e3e:	4680      	mov	r8, r0
 8013e40:	50e7      	str	r7, [r4, r3]
 8013e42:	2307      	movs	r3, #7
 8013e44:	4443      	add	r3, r8
 8013e46:	0018      	movs	r0, r3
 8013e48:	469a      	mov	sl, r3
 8013e4a:	f009 fbcb 	bl	801d5e4 <fn_0801D5E4>
 8013e4e:	211a      	movs	r1, #26
 8013e50:	f011 fc38 	bl	80256c4 <fn_080256C4>
 8013e54:	4dc6      	ldr	r5, [pc, #792]	@ (8014170 <fn_08013D94+0x3dc>)
 8013e56:	2300      	movs	r3, #0
 8013e58:	2202      	movs	r2, #2
 8013e5a:	2128      	movs	r1, #40	@ 0x28
 8013e5c:	5160      	str	r0, [r4, r5]
 8013e5e:	f009 fce7 	bl	801d830 <fn_0801D830>
 8013e62:	23df      	movs	r3, #223	@ 0xdf
 8013e64:	011b      	lsls	r3, r3, #4
 8013e66:	50e0      	str	r0, [r4, r3]
 8013e68:	6834      	ldr	r4, [r6, #0]
 8013e6a:	5960      	ldr	r0, [r4, r5]
 8013e6c:	2200      	movs	r2, #0
 8013e6e:	2102      	movs	r1, #2
 8013e70:	0040      	lsls	r0, r0, #1
 8013e72:	4699      	mov	r9, r3
 8013e74:	f009 fc5a 	bl	801d72c <fn_0801D72C>
 8013e78:	4bbe      	ldr	r3, [pc, #760]	@ (8014174 <fn_08013D94+0x3e0>)
 8013e7a:	50e0      	str	r0, [r4, r3]
 8013e7c:	6834      	ldr	r4, [r6, #0]
 8013e7e:	4bbe      	ldr	r3, [pc, #760]	@ (8014178 <fn_08013D94+0x3e4>)
 8013e80:	50e7      	str	r7, [r4, r3]
 8013e82:	5963      	ldr	r3, [r4, r5]
 8013e84:	2b00      	cmp	r3, #0
 8013e86:	dd46      	ble.n	8013f16 <fn_08013D94+0x182>
 8013e88:	4650      	mov	r0, sl
 8013e8a:	f009 fbc5 	bl	801d618 <fn_0801D618>
 8013e8e:	2324      	movs	r3, #36	@ 0x24
 8013e90:	469b      	mov	fp, r3
 8013e92:	3301      	adds	r3, #1
 8013e94:	0005      	movs	r5, r0
 8013e96:	469a      	mov	sl, r3
 8013e98:	464a      	mov	r2, r9
 8013e9a:	00bb      	lsls	r3, r7, #2
 8013e9c:	58a4      	ldr	r4, [r4, r2]
 8013e9e:	19db      	adds	r3, r3, r7
 8013ea0:	00db      	lsls	r3, r3, #3
 8013ea2:	18e4      	adds	r4, r4, r3
 8013ea4:	786b      	ldrb	r3, [r5, #1]
 8013ea6:	782a      	ldrb	r2, [r5, #0]
 8013ea8:	021b      	lsls	r3, r3, #8
 8013eaa:	4313      	orrs	r3, r2
 8013eac:	041b      	lsls	r3, r3, #16
 8013eae:	6023      	str	r3, [r4, #0]
 8013eb0:	78eb      	ldrb	r3, [r5, #3]
 8013eb2:	78aa      	ldrb	r2, [r5, #2]
 8013eb4:	021b      	lsls	r3, r3, #8
 8013eb6:	4313      	orrs	r3, r2
 8013eb8:	041b      	lsls	r3, r3, #16
 8013eba:	6063      	str	r3, [r4, #4]
 8013ebc:	1d28      	adds	r0, r5, #4
 8013ebe:	f005 f903 	bl	80190c8 <fn_080190C8>
 8013ec2:	465b      	mov	r3, fp
 8013ec4:	54e0      	strb	r0, [r4, r3]
 8013ec6:	0028      	movs	r0, r5
 8013ec8:	300c      	adds	r0, #12
 8013eca:	f005 f8fd 	bl	80190c8 <fn_080190C8>
 8013ece:	4653      	mov	r3, sl
 8013ed0:	54e0      	strb	r0, [r4, r3]
 8013ed2:	2326      	movs	r3, #38	@ 0x26
 8013ed4:	7d2a      	ldrb	r2, [r5, #20]
 8013ed6:	54e2      	strb	r2, [r4, r3]
 8013ed8:	7deb      	ldrb	r3, [r5, #23]
 8013eda:	7daa      	ldrb	r2, [r5, #22]
 8013edc:	021b      	lsls	r3, r3, #8
 8013ede:	4313      	orrs	r3, r2
 8013ee0:	8423      	strh	r3, [r4, #32]
 8013ee2:	0020      	movs	r0, r4
 8013ee4:	f001 fb5e 	bl	80155a4 <fn_080155A4>
 8013ee8:	2227      	movs	r2, #39	@ 0x27
 8013eea:	2301      	movs	r3, #1
 8013eec:	2104      	movs	r1, #4
 8013eee:	4003      	ands	r3, r0
 8013ef0:	5ca0      	ldrb	r0, [r4, r2]
 8013ef2:	009b      	lsls	r3, r3, #2
 8013ef4:	4388      	bics	r0, r1
 8013ef6:	4318      	orrs	r0, r3
 8013ef8:	54a0      	strb	r0, [r4, r2]
 8013efa:	7e6b      	ldrb	r3, [r5, #25]
 8013efc:	7e2a      	ldrb	r2, [r5, #24]
 8013efe:	021b      	lsls	r3, r3, #8
 8013f00:	4313      	orrs	r3, r2
 8013f02:	8463      	strh	r3, [r4, #34]	@ 0x22
 8013f04:	2300      	movs	r3, #0
 8013f06:	60e3      	str	r3, [r4, #12]
 8013f08:	6834      	ldr	r4, [r6, #0]
 8013f0a:	4b99      	ldr	r3, [pc, #612]	@ (8014170 <fn_08013D94+0x3dc>)
 8013f0c:	58e3      	ldr	r3, [r4, r3]
 8013f0e:	3701      	adds	r7, #1
 8013f10:	351a      	adds	r5, #26
 8013f12:	429f      	cmp	r7, r3
 8013f14:	dbc0      	blt.n	8013e98 <fn_08013D94+0x104>
 8013f16:	4643      	mov	r3, r8
 8013f18:	1c9f      	adds	r7, r3, #2
 8013f1a:	0038      	movs	r0, r7
 8013f1c:	f009 fb62 	bl	801d5e4 <fn_0801D5E4>
 8013f20:	4b96      	ldr	r3, [pc, #600]	@ (801417c <fn_08013D94+0x3e8>)
 8013f22:	0945      	lsrs	r5, r0, #5
 8013f24:	50e5      	str	r5, [r4, r3]
 8013f26:	0038      	movs	r0, r7
 8013f28:	469a      	mov	sl, r3
 8013f2a:	f009 fb75 	bl	801d618 <fn_0801D618>
 8013f2e:	23e0      	movs	r3, #224	@ 0xe0
 8013f30:	011b      	lsls	r3, r3, #4
 8013f32:	2202      	movs	r2, #2
 8013f34:	50e0      	str	r0, [r4, r3]
 8013f36:	2104      	movs	r1, #4
 8013f38:	0028      	movs	r0, r5
 8013f3a:	4699      	mov	r9, r3
 8013f3c:	2300      	movs	r3, #0
 8013f3e:	f009 fc77 	bl	801d830 <fn_0801D830>
 8013f42:	4b8f      	ldr	r3, [pc, #572]	@ (8014180 <fn_08013D94+0x3ec>)
 8013f44:	50e0      	str	r0, [r4, r3]
 8013f46:	4643      	mov	r3, r8
 8013f48:	1cdc      	adds	r4, r3, #3
 8013f4a:	0020      	movs	r0, r4
 8013f4c:	f009 fb4a 	bl	801d5e4 <fn_0801D5E4>
 8013f50:	210c      	movs	r1, #12
 8013f52:	f011 fbb7 	bl	80256c4 <fn_080256C4>
 8013f56:	6835      	ldr	r5, [r6, #0]
 8013f58:	4b8a      	ldr	r3, [pc, #552]	@ (8014184 <fn_08013D94+0x3f0>)
 8013f5a:	0007      	movs	r7, r0
 8013f5c:	50e8      	str	r0, [r5, r3]
 8013f5e:	0020      	movs	r0, r4
 8013f60:	f009 fb5a 	bl	801d618 <fn_0801D618>
 8013f64:	4b88      	ldr	r3, [pc, #544]	@ (8014188 <fn_08013D94+0x3f4>)
 8013f66:	50e8      	str	r0, [r5, r3]
 8013f68:	4653      	mov	r3, sl
 8013f6a:	58e9      	ldr	r1, [r5, r3]
 8013f6c:	2900      	cmp	r1, #0
 8013f6e:	dc00      	bgt.n	8013f72 <fn_08013D94+0x1de>
 8013f70:	e1aa      	b.n	80142c8 <fn_08013D94+0x534>
 8013f72:	464b      	mov	r3, r9
 8013f74:	2400      	movs	r4, #0
 8013f76:	58eb      	ldr	r3, [r5, r3]
 8013f78:	0149      	lsls	r1, r1, #5
 8013f7a:	3314      	adds	r3, #20
 8013f7c:	18c9      	adds	r1, r1, r3
 8013f7e:	2006      	movs	r0, #6
 8013f80:	5e1a      	ldrsh	r2, [r3, r0]
 8013f82:	2a00      	cmp	r2, #0
 8013f84:	d007      	beq.n	8013f96 <fn_08013D94+0x202>
 8013f86:	881a      	ldrh	r2, [r3, #0]
 8013f88:	4880      	ldr	r0, [pc, #512]	@ (801418c <fn_08013D94+0x3f8>)
 8013f8a:	1810      	adds	r0, r2, r0
 8013f8c:	2800      	cmp	r0, #0
 8013f8e:	d002      	beq.n	8013f96 <fn_08013D94+0x202>
 8013f90:	42a2      	cmp	r2, r4
 8013f92:	d300      	bcc.n	8013f96 <fn_08013D94+0x202>
 8013f94:	1c54      	adds	r4, r2, #1
 8013f96:	3320      	adds	r3, #32
 8013f98:	4299      	cmp	r1, r3
 8013f9a:	d1f0      	bne.n	8013f7e <fn_08013D94+0x1ea>
 8013f9c:	23e1      	movs	r3, #225	@ 0xe1
 8013f9e:	011b      	lsls	r3, r3, #4
 8013fa0:	50ec      	str	r4, [r5, r3]
 8013fa2:	2300      	movs	r3, #0
 8013fa4:	4a7a      	ldr	r2, [pc, #488]	@ (8014190 <fn_08013D94+0x3fc>)
 8013fa6:	50ab      	str	r3, [r5, r2]
 8013fa8:	2c00      	cmp	r4, #0
 8013faa:	d013      	beq.n	8013fd4 <fn_08013D94+0x240>
 8013fac:	0067      	lsls	r7, r4, #1
 8013fae:	193f      	adds	r7, r7, r4
 8013fb0:	00bf      	lsls	r7, r7, #2
 8013fb2:	2200      	movs	r2, #0
 8013fb4:	2102      	movs	r1, #2
 8013fb6:	0038      	movs	r0, r7
 8013fb8:	f009 fbb8 	bl	801d72c <fn_0801D72C>
 8013fbc:	4a74      	ldr	r2, [pc, #464]	@ (8014190 <fn_08013D94+0x3fc>)
 8013fbe:	6833      	ldr	r3, [r6, #0]
 8013fc0:	50a8      	str	r0, [r5, r2]
 8013fc2:	5898      	ldr	r0, [r3, r2]
 8013fc4:	4a70      	ldr	r2, [pc, #448]	@ (8014188 <fn_08013D94+0x3f4>)
 8013fc6:	5899      	ldr	r1, [r3, r2]
 8013fc8:	003a      	movs	r2, r7
 8013fca:	f00c fc15 	bl	80207f8 <fn_080207F8>
 8013fce:	6835      	ldr	r5, [r6, #0]
 8013fd0:	4b6c      	ldr	r3, [pc, #432]	@ (8014184 <fn_08013D94+0x3f0>)
 8013fd2:	58ef      	ldr	r7, [r5, r3]
 8013fd4:	2f00      	cmp	r7, #0
 8013fd6:	dd1e      	ble.n	8014016 <fn_08013D94+0x282>
 8013fd8:	2300      	movs	r3, #0
 8013fda:	4699      	mov	r9, r3
 8013fdc:	4b69      	ldr	r3, [pc, #420]	@ (8014184 <fn_08013D94+0x3f0>)
 8013fde:	2400      	movs	r4, #0
 8013fe0:	469a      	mov	sl, r3
 8013fe2:	4f69      	ldr	r7, [pc, #420]	@ (8014188 <fn_08013D94+0x3f4>)
 8013fe4:	59eb      	ldr	r3, [r5, r7]
 8013fe6:	191b      	adds	r3, r3, r4
 8013fe8:	8918      	ldrh	r0, [r3, #8]
 8013fea:	f004 fe2d 	bl	8018c48 <fn_08018C48>
 8013fee:	6833      	ldr	r3, [r6, #0]
 8013ff0:	59db      	ldr	r3, [r3, r7]
 8013ff2:	191b      	adds	r3, r3, r4
 8013ff4:	8898      	ldrh	r0, [r3, #4]
 8013ff6:	f004 fe27 	bl	8018c48 <fn_08018C48>
 8013ffa:	6833      	ldr	r3, [r6, #0]
 8013ffc:	59db      	ldr	r3, [r3, r7]
 8013ffe:	191b      	adds	r3, r3, r4
 8014000:	88d8      	ldrh	r0, [r3, #6]
 8014002:	f004 fe21 	bl	8018c48 <fn_08018C48>
 8014006:	2301      	movs	r3, #1
 8014008:	4499      	add	r9, r3
 801400a:	4653      	mov	r3, sl
 801400c:	6835      	ldr	r5, [r6, #0]
 801400e:	58eb      	ldr	r3, [r5, r3]
 8014010:	340c      	adds	r4, #12
 8014012:	4599      	cmp	r9, r3
 8014014:	dbe6      	blt.n	8013fe4 <fn_08013D94+0x250>
 8014016:	4640      	mov	r0, r8
 8014018:	3009      	adds	r0, #9
 801401a:	f009 fafd 	bl	801d618 <fn_0801D618>
 801401e:	2200      	movs	r2, #0
 8014020:	5e83      	ldrsh	r3, [r0, r2]
 8014022:	4f5c      	ldr	r7, [pc, #368]	@ (8014194 <fn_08013D94+0x400>)
 8014024:	4a5c      	ldr	r2, [pc, #368]	@ (8014198 <fn_08013D94+0x404>)
 8014026:	041b      	lsls	r3, r3, #16
 8014028:	51e8      	str	r0, [r5, r7]
 801402a:	50ab      	str	r3, [r5, r2]
 801402c:	2202      	movs	r2, #2
 801402e:	5e83      	ldrsh	r3, [r0, r2]
 8014030:	4a5a      	ldr	r2, [pc, #360]	@ (801419c <fn_08013D94+0x408>)
 8014032:	041b      	lsls	r3, r3, #16
 8014034:	50ab      	str	r3, [r5, r2]
 8014036:	8883      	ldrh	r3, [r0, #4]
 8014038:	4a59      	ldr	r2, [pc, #356]	@ (80141a0 <fn_08013D94+0x40c>)
 801403a:	88c0      	ldrh	r0, [r0, #6]
 801403c:	50ab      	str	r3, [r5, r2]
 801403e:	4a59      	ldr	r2, [pc, #356]	@ (80141a4 <fn_08013D94+0x410>)
 8014040:	2104      	movs	r1, #4
 8014042:	50a8      	str	r0, [r5, r2]
 8014044:	2202      	movs	r2, #2
 8014046:	4358      	muls	r0, r3
 8014048:	2300      	movs	r3, #0
 801404a:	f009 fbf1 	bl	801d830 <fn_0801D830>
 801404e:	23e3      	movs	r3, #227	@ 0xe3
 8014050:	22e2      	movs	r2, #226	@ 0xe2
 8014052:	6834      	ldr	r4, [r6, #0]
 8014054:	011b      	lsls	r3, r3, #4
 8014056:	50e8      	str	r0, [r5, r3]
 8014058:	59e3      	ldr	r3, [r4, r7]
 801405a:	0112      	lsls	r2, r2, #4
 801405c:	3308      	adds	r3, #8
 801405e:	50a3      	str	r3, [r4, r2]
 8014060:	4643      	mov	r3, r8
 8014062:	1d5f      	adds	r7, r3, #5
 8014064:	0038      	movs	r0, r7
 8014066:	f009 fabd 	bl	801d5e4 <fn_0801D5E4>
 801406a:	4b4f      	ldr	r3, [pc, #316]	@ (80141a8 <fn_08013D94+0x414>)
 801406c:	0885      	lsrs	r5, r0, #2
 801406e:	50e5      	str	r5, [r4, r3]
 8014070:	0038      	movs	r0, r7
 8014072:	f009 fad1 	bl	801d618 <fn_0801D618>
 8014076:	4b4d      	ldr	r3, [pc, #308]	@ (80141ac <fn_08013D94+0x418>)
 8014078:	50e0      	str	r0, [r4, r3]
 801407a:	2d00      	cmp	r5, #0
 801407c:	d100      	bne.n	8014080 <fn_08013D94+0x2ec>
 801407e:	e0ff      	b.n	8014280 <fn_08013D94+0x4ec>
 8014080:	2800      	cmp	r0, #0
 8014082:	d100      	bne.n	8014086 <fn_08013D94+0x2f2>
 8014084:	e0fc      	b.n	8014280 <fn_08013D94+0x4ec>
 8014086:	4643      	mov	r3, r8
 8014088:	1d9d      	adds	r5, r3, #6
 801408a:	0028      	movs	r0, r5
 801408c:	f009 faaa 	bl	801d5e4 <fn_0801D5E4>
 8014090:	4b47      	ldr	r3, [pc, #284]	@ (80141b0 <fn_08013D94+0x41c>)
 8014092:	4699      	mov	r9, r3
 8014094:	211c      	movs	r1, #28
 8014096:	0007      	movs	r7, r0
 8014098:	f011 fb14 	bl	80256c4 <fn_080256C4>
 801409c:	464b      	mov	r3, r9
 801409e:	6018      	str	r0, [r3, #0]
 80140a0:	0028      	movs	r0, r5
 80140a2:	f009 fab9 	bl	801d618 <fn_0801D618>
 80140a6:	4b43      	ldr	r3, [pc, #268]	@ (80141b4 <fn_08013D94+0x420>)
 80140a8:	6018      	str	r0, [r3, #0]
 80140aa:	2800      	cmp	r0, #0
 80140ac:	d100      	bne.n	80140b0 <fn_08013D94+0x31c>
 80140ae:	e0de      	b.n	801426e <fn_08013D94+0x4da>
 80140b0:	2f1b      	cmp	r7, #27
 80140b2:	d800      	bhi.n	80140b6 <fn_08013D94+0x322>
 80140b4:	e0db      	b.n	801426e <fn_08013D94+0x4da>
 80140b6:	4643      	mov	r3, r8
 80140b8:	1d1d      	adds	r5, r3, #4
 80140ba:	0028      	movs	r0, r5
 80140bc:	f009 fa92 	bl	801d5e4 <fn_0801D5E4>
 80140c0:	0007      	movs	r7, r0
 80140c2:	0028      	movs	r0, r5
 80140c4:	f009 faa8 	bl	801d618 <fn_0801D618>
 80140c8:	4b3b      	ldr	r3, [pc, #236]	@ (80141b8 <fn_08013D94+0x424>)
 80140ca:	50e0      	str	r0, [r4, r3]
 80140cc:	2f13      	cmp	r7, #19
 80140ce:	d800      	bhi.n	80140d2 <fn_08013D94+0x33e>
 80140d0:	e0ec      	b.n	80142ac <fn_08013D94+0x518>
 80140d2:	4b27      	ldr	r3, [pc, #156]	@ (8014170 <fn_08013D94+0x3dc>)
 80140d4:	58e5      	ldr	r5, [r4, r3]
 80140d6:	2d00      	cmp	r5, #0
 80140d8:	dd19      	ble.n	801410e <fn_08013D94+0x37a>
 80140da:	4640      	mov	r0, r8
 80140dc:	300a      	adds	r0, #10
 80140de:	f009 fa9b 	bl	801d618 <fn_0801D618>
 80140e2:	23df      	movs	r3, #223	@ 0xdf
 80140e4:	1c6f      	adds	r7, r5, #1
 80140e6:	00ad      	lsls	r5, r5, #2
 80140e8:	46ac      	mov	ip, r5
 80140ea:	0002      	movs	r2, r0
 80140ec:	011b      	lsls	r3, r3, #4
 80140ee:	58e1      	ldr	r1, [r4, r3]
 80140f0:	00bf      	lsls	r7, r7, #2
 80140f2:	3118      	adds	r1, #24
 80140f4:	4484      	add	ip, r0
 80140f6:	6815      	ldr	r5, [r2, #0]
 80140f8:	006b      	lsls	r3, r5, #1
 80140fa:	19db      	adds	r3, r3, r7
 80140fc:	18c3      	adds	r3, r0, r3
 80140fe:	600b      	str	r3, [r1, #0]
 8014100:	6853      	ldr	r3, [r2, #4]
 8014102:	3204      	adds	r2, #4
 8014104:	1b5b      	subs	r3, r3, r5
 8014106:	80cb      	strh	r3, [r1, #6]
 8014108:	3128      	adds	r1, #40	@ 0x28
 801410a:	4594      	cmp	ip, r2
 801410c:	d1f3      	bne.n	80140f6 <fn_08013D94+0x362>
 801410e:	4645      	mov	r5, r8
 8014110:	4b14      	ldr	r3, [pc, #80]	@ (8014164 <fn_08013D94+0x3d0>)
 8014112:	3508      	adds	r5, #8
 8014114:	50e5      	str	r5, [r4, r3]
 8014116:	0028      	movs	r0, r5
 8014118:	f009 fa64 	bl	801d5e4 <fn_0801D5E4>
 801411c:	2300      	movs	r3, #0
 801411e:	2800      	cmp	r0, #0
 8014120:	d003      	beq.n	801412a <fn_08013D94+0x396>
 8014122:	0028      	movs	r0, r5
 8014124:	f009 fa78 	bl	801d618 <fn_0801D618>
 8014128:	0003      	movs	r3, r0
 801412a:	4a24      	ldr	r2, [pc, #144]	@ (80141bc <fn_08013D94+0x428>)
 801412c:	50a3      	str	r3, [r4, r2]
 801412e:	4b24      	ldr	r3, [pc, #144]	@ (80141c0 <fn_08013D94+0x42c>)
 8014130:	2100      	movs	r1, #0
 8014132:	18e0      	adds	r0, r4, r3
 8014134:	220a      	movs	r2, #10
 8014136:	f00c fc83 	bl	8020a40 <fn_08020A40>
 801413a:	23e0      	movs	r3, #224	@ 0xe0
 801413c:	2200      	movs	r2, #0
 801413e:	50e2      	str	r2, [r4, r3]
 8014140:	4644      	mov	r4, r8
 8014142:	f7fb fe4f 	bl	800fde4 <fn_0800FDE4>
 8014146:	1c60      	adds	r0, r4, #1
 8014148:	f009 fa4c 	bl	801d5e4 <fn_0801D5E4>
 801414c:	210a      	movs	r1, #10
 801414e:	4680      	mov	r8, r0
 8014150:	e038      	b.n	80141c4 <fn_08013D94+0x430>
 8014152:	46c0      	nop			@ (mov r8, r8)
 8014154:	030064c4 	.word	0x030064c4
 8014158:	00000878 	.word	0x00000878
 801415c:	0000087c 	.word	0x0000087c
 8014160:	000041b4 	.word	0x000041b4
 8014164:	00000e34 	.word	0x00000e34
 8014168:	08149350 	.word	0x08149350
 801416c:	000010ec 	.word	0x000010ec
 8014170:	00000dec 	.word	0x00000dec
 8014174:	0000085c 	.word	0x0000085c
 8014178:	00000864 	.word	0x00000864
 801417c:	00000dfc 	.word	0x00000dfc
 8014180:	00000e04 	.word	0x00000e04
 8014184:	00000e08 	.word	0x00000e08
 8014188:	00000e0c 	.word	0x00000e0c
 801418c:	ffff0001 	.word	0xffff0001
 8014190:	00000e14 	.word	0x00000e14
 8014194:	00000e24 	.word	0x00000e24
 8014198:	00000e28 	.word	0x00000e28
 801419c:	00000e2c 	.word	0x00000e2c
 80141a0:	00000e18 	.word	0x00000e18
 80141a4:	00000e1c 	.word	0x00000e1c
 80141a8:	00000df4 	.word	0x00000df4
 80141ac:	00000df8 	.word	0x00000df8
 80141b0:	030065dc 	.word	0x030065dc
 80141b4:	030065e0 	.word	0x030065e0
 80141b8:	00000de8 	.word	0x00000de8
 80141bc:	00000e38 	.word	0x00000e38
 80141c0:	00000e3c 	.word	0x00000e3c
 80141c4:	f011 fa7e 	bl	80256c4 <fn_080256C4>
 80141c8:	0007      	movs	r7, r0
 80141ca:	1c60      	adds	r0, r4, #1
 80141cc:	f009 fa24 	bl	801d618 <fn_0801D618>
 80141d0:	4681      	mov	r9, r0
 80141d2:	2800      	cmp	r0, #0
 80141d4:	d066      	beq.n	80142a4 <fn_08013D94+0x510>
 80141d6:	4643      	mov	r3, r8
 80141d8:	2b09      	cmp	r3, #9
 80141da:	d963      	bls.n	80142a4 <fn_08013D94+0x510>
 80141dc:	2300      	movs	r3, #0
 80141de:	2164      	movs	r1, #100	@ 0x64
 80141e0:	2202      	movs	r2, #2
 80141e2:	0038      	movs	r0, r7
 80141e4:	6834      	ldr	r4, [r6, #0]
 80141e6:	f009 fb23 	bl	801d830 <fn_0801D830>
 80141ea:	4d3b      	ldr	r5, [pc, #236]	@ (80142d8 <fn_08013D94+0x544>)
 80141ec:	4b3b      	ldr	r3, [pc, #236]	@ (80142dc <fn_08013D94+0x548>)
 80141ee:	6831      	ldr	r1, [r6, #0]
 80141f0:	5160      	str	r0, [r4, r5]
 80141f2:	50cf      	str	r7, [r1, r3]
 80141f4:	4643      	mov	r3, r8
 80141f6:	2b09      	cmp	r3, #9
 80141f8:	d920      	bls.n	801423c <fn_08013D94+0x4a8>
 80141fa:	2064      	movs	r0, #100	@ 0x64
 80141fc:	2200      	movs	r2, #0
 80141fe:	2489      	movs	r4, #137	@ 0x89
 8014200:	4378      	muls	r0, r7
 8014202:	594b      	ldr	r3, [r1, r5]
 8014204:	189b      	adds	r3, r3, r2
 8014206:	335a      	adds	r3, #90	@ 0x5a
 8014208:	3264      	adds	r2, #100	@ 0x64
 801420a:	701c      	strb	r4, [r3, #0]
 801420c:	4290      	cmp	r0, r2
 801420e:	d1f8      	bne.n	8014202 <fn_08013D94+0x46e>
 8014210:	464c      	mov	r4, r9
 8014212:	00bd      	lsls	r5, r7, #2
 8014214:	19ed      	adds	r5, r5, r7
 8014216:	006d      	lsls	r5, r5, #1
 8014218:	1965      	adds	r5, r4, r5
 801421a:	79e0      	ldrb	r0, [r4, #7]
 801421c:	79a3      	ldrb	r3, [r4, #6]
 801421e:	0200      	lsls	r0, r0, #8
 8014220:	4318      	orrs	r0, r3
 8014222:	0400      	lsls	r0, r0, #16
 8014224:	1400      	asrs	r0, r0, #16
 8014226:	f7fd fcf9 	bl	8011c1c <fn_08011C1C>
 801422a:	2800      	cmp	r0, #0
 801422c:	d002      	beq.n	8014234 <fn_08013D94+0x4a0>
 801422e:	0020      	movs	r0, r4
 8014230:	f7fd fd0a 	bl	8011c48 <fn_08011C48>
 8014234:	340a      	adds	r4, #10
 8014236:	42a5      	cmp	r5, r4
 8014238:	d1ef      	bne.n	801421a <fn_08013D94+0x486>
 801423a:	6831      	ldr	r1, [r6, #0]
 801423c:	4b28      	ldr	r3, [pc, #160]	@ (80142e0 <fn_08013D94+0x54c>)
 801423e:	5ccb      	ldrb	r3, [r1, r3]
 8014240:	2b00      	cmp	r3, #0
 8014242:	d003      	beq.n	801424c <fn_08013D94+0x4b8>
 8014244:	23e0      	movs	r3, #224	@ 0xe0
 8014246:	58cb      	ldr	r3, [r1, r3]
 8014248:	2b00      	cmp	r3, #0
 801424a:	d037      	beq.n	80142bc <fn_08013D94+0x528>
 801424c:	2394      	movs	r3, #148	@ 0x94
 801424e:	5ccb      	ldrb	r3, [r1, r3]
 8014250:	2b02      	cmp	r3, #2
 8014252:	d030      	beq.n	80142b6 <fn_08013D94+0x522>
 8014254:	f002 fd5c 	bl	8016d10 <fn_08016D10>
 8014258:	f7fb fdc6 	bl	800fde8 <fn_0800FDE8>
 801425c:	b007      	add	sp, #28
 801425e:	bcf0      	pop	{r4, r5, r6, r7}
 8014260:	46bb      	mov	fp, r7
 8014262:	46b2      	mov	sl, r6
 8014264:	46a9      	mov	r9, r5
 8014266:	46a0      	mov	r8, r4
 8014268:	bcf0      	pop	{r4, r5, r6, r7}
 801426a:	bc01      	pop	{r0}
 801426c:	4700      	bx	r0
 801426e:	4b1d      	ldr	r3, [pc, #116]	@ (80142e4 <fn_08013D94+0x550>)
 8014270:	58e3      	ldr	r3, [r4, r3]
 8014272:	2b01      	cmp	r3, #1
 8014274:	d009      	beq.n	801428a <fn_08013D94+0x4f6>
 8014276:	481c      	ldr	r0, [pc, #112]	@ (80142e8 <fn_08013D94+0x554>)
 8014278:	f7ec f996 	bl	80005a8 <fn_080005A8>
 801427c:	6834      	ldr	r4, [r6, #0]
 801427e:	e71a      	b.n	80140b6 <fn_08013D94+0x322>
 8014280:	481a      	ldr	r0, [pc, #104]	@ (80142ec <fn_08013D94+0x558>)
 8014282:	f7ec f991 	bl	80005a8 <fn_080005A8>
 8014286:	6834      	ldr	r4, [r6, #0]
 8014288:	e6fd      	b.n	8014086 <fn_08013D94+0x2f2>
 801428a:	4819      	ldr	r0, [pc, #100]	@ (80142f0 <fn_08013D94+0x55c>)
 801428c:	f7f1 f8ca 	bl	8005424 <fn_08005424>
 8014290:	6834      	ldr	r4, [r6, #0]
 8014292:	e710      	b.n	80140b6 <fn_08013D94+0x322>
 8014294:	ac03      	add	r4, sp, #12
 8014296:	002b      	movs	r3, r5
 8014298:	2109      	movs	r1, #9
 801429a:	0020      	movs	r0, r4
 801429c:	4a15      	ldr	r2, [pc, #84]	@ (80142f4 <fn_08013D94+0x560>)
 801429e:	f7f1 f8db 	bl	8005458 <fn_08005458>
 80142a2:	e5c6      	b.n	8013e32 <fn_08013D94+0x9e>
 80142a4:	4814      	ldr	r0, [pc, #80]	@ (80142f8 <fn_08013D94+0x564>)
 80142a6:	f7ec f97f 	bl	80005a8 <fn_080005A8>
 80142aa:	e797      	b.n	80141dc <fn_08013D94+0x448>
 80142ac:	4813      	ldr	r0, [pc, #76]	@ (80142fc <fn_08013D94+0x568>)
 80142ae:	f7ec f97b 	bl	80005a8 <fn_080005A8>
 80142b2:	6834      	ldr	r4, [r6, #0]
 80142b4:	e70d      	b.n	80140d2 <fn_08013D94+0x33e>
 80142b6:	f7f5 ff73 	bl	800a1a0 <fn_0800A1A0>
 80142ba:	e7cb      	b.n	8014254 <fn_08013D94+0x4c0>
 80142bc:	2102      	movs	r1, #2
 80142be:	4810      	ldr	r0, [pc, #64]	@ (8014300 <fn_08013D94+0x56c>)
 80142c0:	f7ec f972 	bl	80005a8 <fn_080005A8>
 80142c4:	6831      	ldr	r1, [r6, #0]
 80142c6:	e7c1      	b.n	801424c <fn_08013D94+0x4b8>
 80142c8:	22e1      	movs	r2, #225	@ 0xe1
 80142ca:	2300      	movs	r3, #0
 80142cc:	0112      	lsls	r2, r2, #4
 80142ce:	50ab      	str	r3, [r5, r2]
 80142d0:	4a0c      	ldr	r2, [pc, #48]	@ (8014304 <fn_08013D94+0x570>)
 80142d2:	50ab      	str	r3, [r5, r2]
 80142d4:	e67e      	b.n	8013fd4 <fn_08013D94+0x240>
 80142d6:	46c0      	nop			@ (mov r8, r8)
 80142d8:	00000e48 	.word	0x00000e48
 80142dc:	00000e4c 	.word	0x00000e4c
 80142e0:	0000025d 	.word	0x0000025d
 80142e4:	00000df4 	.word	0x00000df4
 80142e8:	0814a0d8 	.word	0x0814a0d8
 80142ec:	0814a078 	.word	0x0814a078
 80142f0:	0814a0a4 	.word	0x0814a0a4
 80142f4:	08149340 	.word	0x08149340
 80142f8:	0814a118 	.word	0x0814a118
 80142fc:	0814a0f8 	.word	0x0814a0f8
 8014300:	0814a13c 	.word	0x0814a13c
 8014304:	00000e14 	.word	0x00000e14
