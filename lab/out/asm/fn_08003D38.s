fn_08003D38:
 8003d38:	b5f0      	push	{r4, r5, r6, r7, lr}
 8003d3a:	46de      	mov	lr, fp
 8003d3c:	4645      	mov	r5, r8
 8003d3e:	4657      	mov	r7, sl
 8003d40:	464e      	mov	r6, r9
 8003d42:	b5e0      	push	{r5, r6, r7, lr}
 8003d44:	4bad      	ldr	r3, [pc, #692]	@ (8003ffc <fn_08003D38+0x2c4>)
 8003d46:	b087      	sub	sp, #28
 8003d48:	a903      	add	r1, sp, #12
 8003d4a:	6818      	ldr	r0, [r3, #0]
 8003d4c:	f019 fb44 	bl	801d3d8 <fn_0801D3D8>
 8003d50:	466a      	mov	r2, sp
 8003d52:	2300      	movs	r3, #0
 8003d54:	a803      	add	r0, sp, #12
 8003d56:	7513      	strb	r3, [r2, #20]
 8003d58:	f019 fbea 	bl	801d530 <fn_0801D530>
 8003d5c:	4ba8      	ldr	r3, [pc, #672]	@ (8004000 <fn_08003D38+0x2c8>)
 8003d5e:	6018      	str	r0, [r3, #0]
 8003d60:	4ba8      	ldr	r3, [pc, #672]	@ (8004004 <fn_08003D38+0x2cc>)
 8003d62:	0004      	movs	r4, r0
 8003d64:	681f      	ldr	r7, [r3, #0]
 8003d66:	4698      	mov	r8, r3
 8003d68:	f019 fc56 	bl	801d618 <fn_0801D618>
 8003d6c:	23c8      	movs	r3, #200	@ 0xc8
 8003d6e:	0005      	movs	r5, r0
 8003d70:	50f8      	str	r0, [r7, r3]
 8003d72:	0020      	movs	r0, r4
 8003d74:	f019 fc36 	bl	801d5e4 <fn_0801D5E4>
 8003d78:	23cc      	movs	r3, #204	@ 0xcc
 8003d7a:	50f8      	str	r0, [r7, r3]
 8003d7c:	3311      	adds	r3, #17
 8003d7e:	33ff      	adds	r3, #255	@ 0xff
 8003d80:	58fa      	ldr	r2, [r7, r3]
 8003d82:	3304      	adds	r3, #4
 8003d84:	0001      	movs	r1, r0
 8003d86:	4681      	mov	r9, r0
 8003d88:	50fa      	str	r2, [r7, r3]
 8003d8a:	0038      	movs	r0, r7
 8003d8c:	2900      	cmp	r1, #0
 8003d8e:	d104      	bne.n	8003d9a <fn_08003D38+0x62>
 8003d90:	489d      	ldr	r0, [pc, #628]	@ (8004008 <fn_08003D38+0x2d0>)
 8003d92:	f7fc fc09 	bl	80005a8 <fn_080005A8>
 8003d96:	4643      	mov	r3, r8
 8003d98:	6818      	ldr	r0, [r3, #0]
 8003d9a:	24f8      	movs	r4, #248	@ 0xf8
 8003d9c:	238d      	movs	r3, #141	@ 0x8d
 8003d9e:	2200      	movs	r2, #0
 8003da0:	7829      	ldrb	r1, [r5, #0]
 8003da2:	009b      	lsls	r3, r3, #2
 8003da4:	0064      	lsls	r4, r4, #1
 8003da6:	5101      	str	r1, [r0, r4]
 8003da8:	50c2      	str	r2, [r0, r3]
 8003daa:	000b      	movs	r3, r1
 8003dac:	3b68      	subs	r3, #104	@ 0x68
 8003dae:	2b07      	cmp	r3, #7
 8003db0:	d905      	bls.n	8003dbe <fn_08003D38+0x86>
 8003db2:	2904      	cmp	r1, #4
 8003db4:	d903      	bls.n	8003dbe <fn_08003D38+0x86>
 8003db6:	3b60      	subs	r3, #96	@ 0x60
 8003db8:	2b0e      	cmp	r3, #14
 8003dba:	d900      	bls.n	8003dbe <fn_08003D38+0x86>
 8003dbc:	e0e0      	b.n	8003f80 <fn_08003D38+0x248>
 8003dbe:	29c7      	cmp	r1, #199	@ 0xc7
 8003dc0:	dc1b      	bgt.n	8003dfa <fn_08003D38+0xc2>
 8003dc2:	296e      	cmp	r1, #110	@ 0x6e
 8003dc4:	dd03      	ble.n	8003dce <fn_08003D38+0x96>
 8003dc6:	238d      	movs	r3, #141	@ 0x8d
 8003dc8:	2201      	movs	r2, #1
 8003dca:	009b      	lsls	r3, r3, #2
 8003dcc:	50c2      	str	r2, [r0, r3]
 8003dce:	060c      	lsls	r4, r1, #24
 8003dd0:	464b      	mov	r3, r9
 8003dd2:	1624      	asrs	r4, r4, #24
 8003dd4:	2c63      	cmp	r4, #99	@ 0x63
 8003dd6:	dd18      	ble.n	8003e0a <fn_08003D38+0xd2>
 8003dd8:	2b08      	cmp	r3, #8
 8003dda:	d900      	bls.n	8003dde <fn_08003D38+0xa6>
 8003ddc:	e0d7      	b.n	8003f8e <fn_08003D38+0x256>
 8003dde:	2401      	movs	r4, #1
 8003de0:	4b89      	ldr	r3, [pc, #548]	@ (8004008 <fn_08003D38+0x2d0>)
 8003de2:	0018      	movs	r0, r3
 8003de4:	469b      	mov	fp, r3
 8003de6:	f7fc fbdf 	bl	80005a8 <fn_080005A8>
 8003dea:	78ab      	ldrb	r3, [r5, #2]
 8003dec:	572c      	ldrsb	r4, [r5, r4]
 8003dee:	9301      	str	r3, [sp, #4]
 8003df0:	78eb      	ldrb	r3, [r5, #3]
 8003df2:	3509      	adds	r5, #9
 8003df4:	469a      	mov	sl, r3
 8003df6:	002e      	movs	r6, r5
 8003df8:	e0be      	b.n	8003f78 <fn_08003D38+0x240>
 8003dfa:	39c8      	subs	r1, #200	@ 0xc8
 8003dfc:	1dee      	adds	r6, r5, #7
 8003dfe:	290e      	cmp	r1, #14
 8003e00:	d869      	bhi.n	8003ed6 <fn_08003D38+0x19e>
 8003e02:	4b82      	ldr	r3, [pc, #520]	@ (800400c <fn_08003D38+0x2d4>)
 8003e04:	0089      	lsls	r1, r1, #2
 8003e06:	585b      	ldr	r3, [r3, r1]
 8003e08:	469f      	mov	pc, r3
 8003e0a:	2b02      	cmp	r3, #2
 8003e0c:	d900      	bls.n	8003e10 <fn_08003D38+0xd8>
 8003e0e:	e0c8      	b.n	8003fa2 <fn_08003D38+0x26a>
 8003e10:	4b7d      	ldr	r3, [pc, #500]	@ (8004008 <fn_08003D38+0x2d0>)
 8003e12:	0018      	movs	r0, r3
 8003e14:	469b      	mov	fp, r3
 8003e16:	f7fc fbc7 	bl	80005a8 <fn_080005A8>
 8003e1a:	786b      	ldrb	r3, [r5, #1]
 8003e1c:	9301      	str	r3, [sp, #4]
 8003e1e:	78ab      	ldrb	r3, [r5, #2]
 8003e20:	1cee      	adds	r6, r5, #3
 8003e22:	469a      	mov	sl, r3
 8003e24:	e0a8      	b.n	8003f78 <fn_08003D38+0x240>
 8003e26:	238d      	movs	r3, #141	@ 0x8d
 8003e28:	2201      	movs	r2, #1
 8003e2a:	009b      	lsls	r3, r3, #2
 8003e2c:	50c2      	str	r2, [r0, r3]
 8003e2e:	002e      	movs	r6, r5
 8003e30:	230d      	movs	r3, #13
 8003e32:	3608      	adds	r6, #8
 8003e34:	4599      	cmp	r9, r3
 8003e36:	d351      	bcc.n	8003edc <fn_08003D38+0x1a4>
 8003e38:	2400      	movs	r4, #0
 8003e3a:	7873      	ldrb	r3, [r6, #1]
 8003e3c:	5734      	ldrsb	r4, [r6, r4]
 8003e3e:	9301      	str	r3, [sp, #4]
 8003e40:	78b3      	ldrb	r3, [r6, #2]
 8003e42:	469a      	mov	sl, r3
 8003e44:	1b73      	subs	r3, r6, r5
 8003e46:	3345      	adds	r3, #69	@ 0x45
 8003e48:	4599      	cmp	r9, r3
 8003e4a:	d202      	bcs.n	8003e52 <fn_08003D38+0x11a>
 8003e4c:	486e      	ldr	r0, [pc, #440]	@ (8004008 <fn_08003D38+0x2d0>)
 8003e4e:	f7fc fbab 	bl	80005a8 <fn_080005A8>
 8003e52:	4643      	mov	r3, r8
 8003e54:	681a      	ldr	r2, [r3, #0]
 8003e56:	23f8      	movs	r3, #248	@ 0xf8
 8003e58:	005b      	lsls	r3, r3, #1
 8003e5a:	58d3      	ldr	r3, [r2, r3]
 8003e5c:	2bc8      	cmp	r3, #200	@ 0xc8
 8003e5e:	d100      	bne.n	8003e62 <fn_08003D38+0x12a>
 8003e60:	e0b3      	b.n	8003fca <fn_08003D38+0x292>
 8003e62:	3645      	adds	r6, #69	@ 0x45
 8003e64:	1b75      	subs	r5, r6, r5
 8003e66:	3501      	adds	r5, #1
 8003e68:	45a9      	cmp	r9, r5
 8003e6a:	d200      	bcs.n	8003e6e <fn_08003D38+0x136>
 8003e6c:	e082      	b.n	8003f74 <fn_08003D38+0x23c>
 8003e6e:	4643      	mov	r3, r8
 8003e70:	681d      	ldr	r5, [r3, #0]
 8003e72:	7833      	ldrb	r3, [r6, #0]
 8003e74:	1e5a      	subs	r2, r3, #1
 8003e76:	4193      	sbcs	r3, r2
 8003e78:	4a65      	ldr	r2, [pc, #404]	@ (8004010 <fn_08003D38+0x2d8>)
 8003e7a:	54ab      	strb	r3, [r5, r2]
 8003e7c:	23d4      	movs	r3, #212	@ 0xd4
 8003e7e:	5ceb      	ldrb	r3, [r5, r3]
 8003e80:	3620      	adds	r6, #32
 8003e82:	2b03      	cmp	r3, #3
 8003e84:	d05b      	beq.n	8003f3e <fn_08003D38+0x206>
 8003e86:	1c23      	adds	r3, r4, #0
 8003e88:	2c04      	cmp	r4, #4
 8003e8a:	dd00      	ble.n	8003e8e <fn_08003D38+0x156>
 8003e8c:	2304      	movs	r3, #4
 8003e8e:	061b      	lsls	r3, r3, #24
 8003e90:	161b      	asrs	r3, r3, #24
 8003e92:	4699      	mov	r9, r3
 8003e94:	9b01      	ldr	r3, [sp, #4]
 8003e96:	2b00      	cmp	r3, #0
 8003e98:	dc00      	bgt.n	8003e9c <fn_08003D38+0x164>
 8003e9a:	2301      	movs	r3, #1
 8003e9c:	2294      	movs	r2, #148	@ 0x94
 8003e9e:	5caa      	ldrb	r2, [r5, r2]
 8003ea0:	2a03      	cmp	r2, #3
 8003ea2:	d100      	bne.n	8003ea6 <fn_08003D38+0x16e>
 8003ea4:	e096      	b.n	8003fd4 <fn_08003D38+0x29c>
 8003ea6:	2a00      	cmp	r2, #0
 8003ea8:	d01b      	beq.n	8003ee2 <fn_08003D38+0x1aa>
 8003eaa:	001d      	movs	r5, r3
 8003eac:	2b03      	cmp	r3, #3
 8003eae:	dd00      	ble.n	8003eb2 <fn_08003D38+0x17a>
 8003eb0:	2503      	movs	r5, #3
 8003eb2:	4651      	mov	r1, sl
 8003eb4:	2900      	cmp	r1, #0
 8003eb6:	d100      	bne.n	8003eba <fn_08003D38+0x182>
 8003eb8:	e097      	b.n	8003fea <fn_08003D38+0x2b2>
 8003eba:	2a02      	cmp	r2, #2
 8003ebc:	d01a      	beq.n	8003ef4 <fn_08003D38+0x1bc>
 8003ebe:	2301      	movs	r3, #1
 8003ec0:	2909      	cmp	r1, #9
 8003ec2:	dc00      	bgt.n	8003ec6 <fn_08003D38+0x18e>
 8003ec4:	e098      	b.n	8003ff8 <fn_08003D38+0x2c0>
 8003ec6:	061b      	lsls	r3, r3, #24
 8003ec8:	d014      	beq.n	8003ef4 <fn_08003D38+0x1bc>
 8003eca:	2309      	movs	r3, #9
 8003ecc:	469a      	mov	sl, r3
 8003ece:	e011      	b.n	8003ef4 <fn_08003D38+0x1bc>
 8003ed0:	78ab      	ldrb	r3, [r5, #2]
 8003ed2:	2b4d      	cmp	r3, #77	@ 0x4d
 8003ed4:	d0ab      	beq.n	8003e2e <fn_08003D38+0xf6>
 8003ed6:	230c      	movs	r3, #12
 8003ed8:	4599      	cmp	r9, r3
 8003eda:	d2ad      	bcs.n	8003e38 <fn_08003D38+0x100>
 8003edc:	4b4a      	ldr	r3, [pc, #296]	@ (8004008 <fn_08003D38+0x2d0>)
 8003ede:	469b      	mov	fp, r3
 8003ee0:	e06f      	b.n	8003fc2 <fn_08003D38+0x28a>
 8003ee2:	4653      	mov	r3, sl
 8003ee4:	2b00      	cmp	r3, #0
 8003ee6:	d100      	bne.n	8003eea <fn_08003D38+0x1b2>
 8003ee8:	e082      	b.n	8003ff0 <fn_08003D38+0x2b8>
 8003eea:	2b09      	cmp	r3, #9
 8003eec:	dd01      	ble.n	8003ef2 <fn_08003D38+0x1ba>
 8003eee:	2309      	movs	r3, #9
 8003ef0:	469a      	mov	sl, r3
 8003ef2:	2501      	movs	r5, #1
 8003ef4:	f002 fe26 	bl	8006b44 <fn_08006B44>
 8003ef8:	4643      	mov	r3, r8
 8003efa:	6819      	ldr	r1, [r3, #0]
 8003efc:	2301      	movs	r3, #1
 8003efe:	2c03      	cmp	r4, #3
 8003f00:	dc00      	bgt.n	8003f04 <fn_08003D38+0x1cc>
 8003f02:	2300      	movs	r3, #0
 8003f04:	4a43      	ldr	r2, [pc, #268]	@ (8004014 <fn_08003D38+0x2dc>)
 8003f06:	548b      	strb	r3, [r1, r2]
 8003f08:	23e4      	movs	r3, #228	@ 0xe4
 8003f0a:	2202      	movs	r2, #2
 8003f0c:	54ca      	strb	r2, [r1, r3]
 8003f0e:	4b42      	ldr	r3, [pc, #264]	@ (8004018 <fn_08003D38+0x2e0>)
 8003f10:	3a01      	subs	r2, #1
 8003f12:	54ca      	strb	r2, [r1, r3]
 8003f14:	780b      	ldrb	r3, [r1, #0]
 8003f16:	4393      	bics	r3, r2
 8003f18:	700b      	strb	r3, [r1, #0]
 8003f1a:	4643      	mov	r3, r8
 8003f1c:	4651      	mov	r1, sl
 8003f1e:	681b      	ldr	r3, [r3, #0]
 8003f20:	32d7      	adds	r2, #215	@ 0xd7
 8003f22:	509d      	str	r5, [r3, r2]
 8003f24:	3204      	adds	r2, #4
 8003f26:	5099      	str	r1, [r3, r2]
 8003f28:	4649      	mov	r1, r9
 8003f2a:	3a06      	subs	r2, #6
 8003f2c:	5499      	strb	r1, [r3, r2]
 8003f2e:	2100      	movs	r1, #0
 8003f30:	325b      	adds	r2, #91	@ 0x5b
 8003f32:	32ff      	adds	r2, #255	@ 0xff
 8003f34:	5099      	str	r1, [r3, r2]
 8003f36:	f7ff f895 	bl	8003064 <fn_08003064>
 8003f3a:	4643      	mov	r3, r8
 8003f3c:	681d      	ldr	r5, [r3, #0]
 8003f3e:	22c2      	movs	r2, #194	@ 0xc2
 8003f40:	2300      	movs	r3, #0
 8003f42:	0052      	lsls	r2, r2, #1
 8003f44:	50ab      	str	r3, [r5, r2]
 8003f46:	3ab4      	subs	r2, #180	@ 0xb4
 8003f48:	50be      	str	r6, [r7, r2]
 8003f4a:	3204      	adds	r2, #4
 8003f4c:	54ab      	strb	r3, [r5, r2]
 8003f4e:	4a32      	ldr	r2, [pc, #200]	@ (8004018 <fn_08003D38+0x2e0>)
 8003f50:	54ab      	strb	r3, [r5, r2]
 8003f52:	2201      	movs	r2, #1
 8003f54:	4b31      	ldr	r3, [pc, #196]	@ (800401c <fn_08003D38+0x2e4>)
 8003f56:	54ea      	strb	r2, [r5, r3]
 8003f58:	f021 fb54 	bl	8025604 <fn_08025604>
 8003f5c:	23ec      	movs	r3, #236	@ 0xec
 8003f5e:	005b      	lsls	r3, r3, #1
 8003f60:	50e8      	str	r0, [r5, r3]
 8003f62:	b007      	add	sp, #28
 8003f64:	bcf0      	pop	{r4, r5, r6, r7}
 8003f66:	46bb      	mov	fp, r7
 8003f68:	46b2      	mov	sl, r6
 8003f6a:	46a9      	mov	r9, r5
 8003f6c:	46a0      	mov	r8, r4
 8003f6e:	bcf0      	pop	{r4, r5, r6, r7}
 8003f70:	bc01      	pop	{r0}
 8003f72:	4700      	bx	r0
 8003f74:	4b24      	ldr	r3, [pc, #144]	@ (8004008 <fn_08003D38+0x2d0>)
 8003f76:	469b      	mov	fp, r3
 8003f78:	4658      	mov	r0, fp
 8003f7a:	f7fc fb15 	bl	80005a8 <fn_080005A8>
 8003f7e:	e776      	b.n	8003e6e <fn_08003D38+0x136>
 8003f80:	4827      	ldr	r0, [pc, #156]	@ (8004020 <fn_08003D38+0x2e8>)
 8003f82:	f7fc fb11 	bl	80005a8 <fn_080005A8>
 8003f86:	4643      	mov	r3, r8
 8003f88:	6818      	ldr	r0, [r3, #0]
 8003f8a:	5901      	ldr	r1, [r0, r4]
 8003f8c:	e717      	b.n	8003dbe <fn_08003D38+0x86>
 8003f8e:	2401      	movs	r4, #1
 8003f90:	78ab      	ldrb	r3, [r5, #2]
 8003f92:	572c      	ldrsb	r4, [r5, r4]
 8003f94:	9301      	str	r3, [sp, #4]
 8003f96:	78eb      	ldrb	r3, [r5, #3]
 8003f98:	3509      	adds	r5, #9
 8003f9a:	002e      	movs	r6, r5
 8003f9c:	469a      	mov	sl, r3
 8003f9e:	250a      	movs	r5, #10
 8003fa0:	e762      	b.n	8003e68 <fn_08003D38+0x130>
 8003fa2:	786b      	ldrb	r3, [r5, #1]
 8003fa4:	9301      	str	r3, [sp, #4]
 8003fa6:	78ab      	ldrb	r3, [r5, #2]
 8003fa8:	1cee      	adds	r6, r5, #3
 8003faa:	469a      	mov	sl, r3
 8003fac:	2504      	movs	r5, #4
 8003fae:	e75b      	b.n	8003e68 <fn_08003D38+0x130>
 8003fb0:	464b      	mov	r3, r9
 8003fb2:	2b07      	cmp	r3, #7
 8003fb4:	d900      	bls.n	8003fb8 <fn_08003D38+0x280>
 8003fb6:	e78e      	b.n	8003ed6 <fn_08003D38+0x19e>
 8003fb8:	4b13      	ldr	r3, [pc, #76]	@ (8004008 <fn_08003D38+0x2d0>)
 8003fba:	0018      	movs	r0, r3
 8003fbc:	469b      	mov	fp, r3
 8003fbe:	f7fc faf3 	bl	80005a8 <fn_080005A8>
 8003fc2:	4658      	mov	r0, fp
 8003fc4:	f7fc faf0 	bl	80005a8 <fn_080005A8>
 8003fc8:	e736      	b.n	8003e38 <fn_08003D38+0x100>
 8003fca:	3606      	adds	r6, #6
 8003fcc:	36ff      	adds	r6, #255	@ 0xff
 8003fce:	1b75      	subs	r5, r6, r5
 8003fd0:	3501      	adds	r5, #1
 8003fd2:	e749      	b.n	8003e68 <fn_08003D38+0x130>
 8003fd4:	001d      	movs	r5, r3
 8003fd6:	2b04      	cmp	r3, #4
 8003fd8:	dd00      	ble.n	8003fdc <fn_08003D38+0x2a4>
 8003fda:	2504      	movs	r5, #4
 8003fdc:	4653      	mov	r3, sl
 8003fde:	2b00      	cmp	r3, #0
 8003fe0:	d003      	beq.n	8003fea <fn_08003D38+0x2b2>
 8003fe2:	2b09      	cmp	r3, #9
 8003fe4:	dc00      	bgt.n	8003fe8 <fn_08003D38+0x2b0>
 8003fe6:	e785      	b.n	8003ef4 <fn_08003D38+0x1bc>
 8003fe8:	e76f      	b.n	8003eca <fn_08003D38+0x192>
 8003fea:	2301      	movs	r3, #1
 8003fec:	469a      	mov	sl, r3
 8003fee:	e781      	b.n	8003ef4 <fn_08003D38+0x1bc>
 8003ff0:	2301      	movs	r3, #1
 8003ff2:	2501      	movs	r5, #1
 8003ff4:	469a      	mov	sl, r3
 8003ff6:	e77d      	b.n	8003ef4 <fn_08003D38+0x1bc>
 8003ff8:	2300      	movs	r3, #0
 8003ffa:	e764      	b.n	8003ec6 <fn_08003D38+0x18e>
 8003ffc:	030064bc 	.word	0x030064bc
 8004000:	03006ba4 	.word	0x03006ba4
 8004004:	030064c4 	.word	0x030064c4
 8004008:	08149418 	.word	0x08149418
 800400c:	08025934 	.word	0x08025934
 8004010:	0000025d 	.word	0x0000025d
 8004014:	0000025a 	.word	0x0000025a
 8004018:	0000025b 	.word	0x0000025b
 800401c:	0000025e 	.word	0x0000025e
 8004020:	08149440 	.word	0x08149440
