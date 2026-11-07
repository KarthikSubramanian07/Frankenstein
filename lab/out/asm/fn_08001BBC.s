fn_08001BBC:
 8001bbc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001bbe:	46de      	mov	lr, fp
 8001bc0:	4657      	mov	r7, sl
 8001bc2:	464e      	mov	r6, r9
 8001bc4:	4645      	mov	r5, r8
 8001bc6:	b5e0      	push	{r5, r6, r7, lr}
 8001bc8:	4cca      	ldr	r4, [pc, #808]	@ (8001ef4 <fn_08001BBC+0x338>)
 8001bca:	6963      	ldr	r3, [r4, #20]
 8001bcc:	b083      	sub	sp, #12
 8001bce:	2b00      	cmp	r3, #0
 8001bd0:	d100      	bne.n	8001bd4 <fn_08001BBC+0x18>
 8001bd2:	e095      	b.n	8001d00 <fn_08001BBC+0x144>
 8001bd4:	6921      	ldr	r1, [r4, #16]
 8001bd6:	290f      	cmp	r1, #15
 8001bd8:	d003      	beq.n	8001be2 <fn_08001BBC+0x26>
 8001bda:	220f      	movs	r2, #15
 8001bdc:	48c6      	ldr	r0, [pc, #792]	@ (8001ef8 <fn_08001BBC+0x33c>)
 8001bde:	f7fe fce3 	bl	80005a8 <fn_080005A8>
 8001be2:	4dc6      	ldr	r5, [pc, #792]	@ (8001efc <fn_08001BBC+0x340>)
 8001be4:	4ec6      	ldr	r6, [pc, #792]	@ (8001f00 <fn_08001BBC+0x344>)
 8001be6:	2204      	movs	r2, #4
 8001be8:	0028      	movs	r0, r5
 8001bea:	49c6      	ldr	r1, [pc, #792]	@ (8001f04 <fn_08001BBC+0x348>)
 8001bec:	6834      	ldr	r4, [r6, #0]
 8001bee:	f01f fdc7 	bl	8021780 <fn_08021780>
 8001bf2:	2800      	cmp	r0, #0
 8001bf4:	d000      	beq.n	8001bf8 <fn_08001BBC+0x3c>
 8001bf6:	e282      	b.n	80020fe <fn_08001BBC+0x542>
 8001bf8:	686a      	ldr	r2, [r5, #4]
 8001bfa:	2a00      	cmp	r2, #0
 8001bfc:	d100      	bne.n	8001c00 <fn_08001BBC+0x44>
 8001bfe:	e2ab      	b.n	8002158 <fn_08001BBC+0x59c>
 8001c00:	002b      	movs	r3, r5
 8001c02:	68a9      	ldr	r1, [r5, #8]
 8001c04:	3b08      	subs	r3, #8
 8001c06:	185b      	adds	r3, r3, r1
 8001c08:	0111      	lsls	r1, r2, #4
 8001c0a:	4684      	mov	ip, r0
 8001c0c:	4680      	mov	r8, r0
 8001c0e:	4682      	mov	sl, r0
 8001c10:	0007      	movs	r7, r0
 8001c12:	185b      	adds	r3, r3, r1
 8001c14:	e00d      	b.n	8001c32 <fn_08001BBC+0x76>
 8001c16:	294d      	cmp	r1, #77	@ 0x4d
 8001c18:	d124      	bne.n	8001c64 <fn_08001BBC+0xa8>
 8001c1a:	7859      	ldrb	r1, [r3, #1]
 8001c1c:	2941      	cmp	r1, #65	@ 0x41
 8001c1e:	d039      	beq.n	8001c94 <fn_08001BBC+0xd8>
 8001c20:	2955      	cmp	r1, #85	@ 0x55
 8001c22:	d102      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c24:	7899      	ldrb	r1, [r3, #2]
 8001c26:	2952      	cmp	r1, #82	@ 0x52
 8001c28:	d05a      	beq.n	8001ce0 <fn_08001BBC+0x124>
 8001c2a:	3a01      	subs	r2, #1
 8001c2c:	3b10      	subs	r3, #16
 8001c2e:	2a00      	cmp	r2, #0
 8001c30:	d044      	beq.n	8001cbc <fn_08001BBC+0x100>
 8001c32:	7819      	ldrb	r1, [r3, #0]
 8001c34:	2945      	cmp	r1, #69	@ 0x45
 8001c36:	d1ee      	bne.n	8001c16 <fn_08001BBC+0x5a>
 8001c38:	7899      	ldrb	r1, [r3, #2]
 8001c3a:	294d      	cmp	r1, #77	@ 0x4d
 8001c3c:	d1f5      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c3e:	7919      	ldrb	r1, [r3, #4]
 8001c40:	2900      	cmp	r1, #0
 8001c42:	d1f2      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c44:	7859      	ldrb	r1, [r3, #1]
 8001c46:	2934      	cmp	r1, #52	@ 0x34
 8001c48:	d100      	bne.n	8001c4c <fn_08001BBC+0x90>
 8001c4a:	e195      	b.n	8001f78 <fn_08001BBC+0x3bc>
 8001c4c:	2933      	cmp	r1, #51	@ 0x33
 8001c4e:	d100      	bne.n	8001c52 <fn_08001BBC+0x96>
 8001c50:	e14e      	b.n	8001ef0 <fn_08001BBC+0x334>
 8001c52:	2932      	cmp	r1, #50	@ 0x32
 8001c54:	d100      	bne.n	8001c58 <fn_08001BBC+0x9c>
 8001c56:	e14b      	b.n	8001ef0 <fn_08001BBC+0x334>
 8001c58:	3931      	subs	r1, #49	@ 0x31
 8001c5a:	000d      	movs	r5, r1
 8001c5c:	4269      	negs	r1, r5
 8001c5e:	4169      	adcs	r1, r5
 8001c60:	448a      	add	sl, r1
 8001c62:	e7e2      	b.n	8001c2a <fn_08001BBC+0x6e>
 8001c64:	2957      	cmp	r1, #87	@ 0x57
 8001c66:	d1e0      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c68:	7859      	ldrb	r1, [r3, #1]
 8001c6a:	2946      	cmp	r1, #70	@ 0x46
 8001c6c:	d1dd      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c6e:	7899      	ldrb	r1, [r3, #2]
 8001c70:	2941      	cmp	r1, #65	@ 0x41
 8001c72:	d1da      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c74:	78d9      	ldrb	r1, [r3, #3]
 8001c76:	294c      	cmp	r1, #76	@ 0x4c
 8001c78:	d1d7      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c7a:	7919      	ldrb	r1, [r3, #4]
 8001c7c:	294c      	cmp	r1, #76	@ 0x4c
 8001c7e:	d1d4      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c80:	7959      	ldrb	r1, [r3, #5]
 8001c82:	2931      	cmp	r1, #49	@ 0x31
 8001c84:	d1d1      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c86:	7999      	ldrb	r1, [r3, #6]
 8001c88:	2900      	cmp	r1, #0
 8001c8a:	d1ce      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c8c:	2394      	movs	r3, #148	@ 0x94
 8001c8e:	4a9e      	ldr	r2, [pc, #632]	@ (8001f08 <fn_08001BBC+0x34c>)
 8001c90:	52e2      	strh	r2, [r4, r3]
 8001c92:	e03e      	b.n	8001d12 <fn_08001BBC+0x156>
 8001c94:	7899      	ldrb	r1, [r3, #2]
 8001c96:	2950      	cmp	r1, #80	@ 0x50
 8001c98:	d1c7      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001c9a:	7959      	ldrb	r1, [r3, #5]
 8001c9c:	2900      	cmp	r1, #0
 8001c9e:	d1c4      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001ca0:	3101      	adds	r1, #1
 8001ca2:	4689      	mov	r9, r1
 8001ca4:	78d9      	ldrb	r1, [r3, #3]
 8001ca6:	44c8      	add	r8, r9
 8001ca8:	2933      	cmp	r1, #51	@ 0x33
 8001caa:	d1be      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001cac:	7919      	ldrb	r1, [r3, #4]
 8001cae:	3931      	subs	r1, #49	@ 0x31
 8001cb0:	0609      	lsls	r1, r1, #24
 8001cb2:	0e09      	lsrs	r1, r1, #24
 8001cb4:	4549      	cmp	r1, r9
 8001cb6:	d8b8      	bhi.n	8001c2a <fn_08001BBC+0x6e>
 8001cb8:	44cc      	add	ip, r9
 8001cba:	e7b6      	b.n	8001c2a <fn_08001BBC+0x6e>
 8001cbc:	2104      	movs	r1, #4
 8001cbe:	2394      	movs	r3, #148	@ 0x94
 8001cc0:	54e1      	strb	r1, [r4, r3]
 8001cc2:	2198      	movs	r1, #152	@ 0x98
 8001cc4:	4645      	mov	r5, r8
 8001cc6:	0089      	lsls	r1, r1, #2
 8001cc8:	5462      	strb	r2, [r4, r1]
 8001cca:	2d1d      	cmp	r5, #29
 8001ccc:	dd1c      	ble.n	8001d08 <fn_08001BBC+0x14c>
 8001cce:	2002      	movs	r0, #2
 8001cd0:	54e0      	strb	r0, [r4, r3]
 8001cd2:	4660      	mov	r0, ip
 8001cd4:	2301      	movs	r3, #1
 8001cd6:	2801      	cmp	r0, #1
 8001cd8:	dc00      	bgt.n	8001cdc <fn_08001BBC+0x120>
 8001cda:	e21b      	b.n	8002114 <fn_08001BBC+0x558>
 8001cdc:	5463      	strb	r3, [r4, r1]
 8001cde:	e018      	b.n	8001d12 <fn_08001BBC+0x156>
 8001ce0:	78d9      	ldrb	r1, [r3, #3]
 8001ce2:	2941      	cmp	r1, #65	@ 0x41
 8001ce4:	d1a1      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001ce6:	7919      	ldrb	r1, [r3, #4]
 8001ce8:	294c      	cmp	r1, #76	@ 0x4c
 8001cea:	d19e      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001cec:	7959      	ldrb	r1, [r3, #5]
 8001cee:	2931      	cmp	r1, #49	@ 0x31
 8001cf0:	d19b      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001cf2:	7999      	ldrb	r1, [r3, #6]
 8001cf4:	2900      	cmp	r1, #0
 8001cf6:	d198      	bne.n	8001c2a <fn_08001BBC+0x6e>
 8001cf8:	2394      	movs	r3, #148	@ 0x94
 8001cfa:	4a84      	ldr	r2, [pc, #528]	@ (8001f0c <fn_08001BBC+0x350>)
 8001cfc:	52e2      	strh	r2, [r4, r3]
 8001cfe:	e008      	b.n	8001d12 <fn_08001BBC+0x156>
 8001d00:	4883      	ldr	r0, [pc, #524]	@ (8001f10 <fn_08001BBC+0x354>)
 8001d02:	f7fe fc51 	bl	80005a8 <fn_080005A8>
 8001d06:	e765      	b.n	8001bd4 <fn_08001BBC+0x18>
 8001d08:	2f08      	cmp	r7, #8
 8001d0a:	dc00      	bgt.n	8001d0e <fn_08001BBC+0x152>
 8001d0c:	e215      	b.n	800213a <fn_08001BBC+0x57e>
 8001d0e:	2203      	movs	r2, #3
 8001d10:	54e2      	strb	r2, [r4, r3]
 8001d12:	2794      	movs	r7, #148	@ 0x94
 8001d14:	6832      	ldr	r2, [r6, #0]
 8001d16:	5dd3      	ldrb	r3, [r2, r7]
 8001d18:	2b02      	cmp	r3, #2
 8001d1a:	d100      	bne.n	8001d1e <fn_08001BBC+0x162>
 8001d1c:	e1ea      	b.n	80020f4 <fn_08001BBC+0x538>
 8001d1e:	d900      	bls.n	8001d22 <fn_08001BBC+0x166>
 8001d20:	e1cf      	b.n	80020c2 <fn_08001BBC+0x506>
 8001d22:	2195      	movs	r1, #149	@ 0x95
 8001d24:	2000      	movs	r0, #0
 8001d26:	4c7b      	ldr	r4, [pc, #492]	@ (8001f14 <fn_08001BBC+0x358>)
 8001d28:	5450      	strb	r0, [r2, r1]
 8001d2a:	2b01      	cmp	r3, #1
 8001d2c:	d100      	bne.n	8001d30 <fn_08001BBC+0x174>
 8001d2e:	e202      	b.n	8002136 <fn_08001BBC+0x57a>
 8001d30:	2501      	movs	r5, #1
 8001d32:	4979      	ldr	r1, [pc, #484]	@ (8001f18 <fn_08001BBC+0x35c>)
 8001d34:	4879      	ldr	r0, [pc, #484]	@ (8001f1c <fn_08001BBC+0x360>)
 8001d36:	f003 fb75 	bl	8005424 <fn_08005424>
 8001d3a:	0021      	movs	r1, r4
 8001d3c:	4878      	ldr	r0, [pc, #480]	@ (8001f20 <fn_08001BBC+0x364>)
 8001d3e:	f003 fb71 	bl	8005424 <fn_08005424>
 8001d42:	4878      	ldr	r0, [pc, #480]	@ (8001f24 <fn_08001BBC+0x368>)
 8001d44:	f003 fb6e 	bl	8005424 <fn_08005424>
 8001d48:	4877      	ldr	r0, [pc, #476]	@ (8001f28 <fn_08001BBC+0x36c>)
 8001d4a:	f003 fb6b 	bl	8005424 <fn_08005424>
 8001d4e:	4877      	ldr	r0, [pc, #476]	@ (8001f2c <fn_08001BBC+0x370>)
 8001d50:	f003 fb68 	bl	8005424 <fn_08005424>
 8001d54:	4876      	ldr	r0, [pc, #472]	@ (8001f30 <fn_08001BBC+0x374>)
 8001d56:	f003 fb65 	bl	8005424 <fn_08005424>
 8001d5a:	4876      	ldr	r0, [pc, #472]	@ (8001f34 <fn_08001BBC+0x378>)
 8001d5c:	f003 fb62 	bl	8005424 <fn_08005424>
 8001d60:	4875      	ldr	r0, [pc, #468]	@ (8001f38 <fn_08001BBC+0x37c>)
 8001d62:	f003 fb5f 	bl	8005424 <fn_08005424>
 8001d66:	4875      	ldr	r0, [pc, #468]	@ (8001f3c <fn_08001BBC+0x380>)
 8001d68:	f003 fb5c 	bl	8005424 <fn_08005424>
 8001d6c:	f001 feea 	bl	8003b44 <fn_08003B44>
 8001d70:	4873      	ldr	r0, [pc, #460]	@ (8001f40 <fn_08001BBC+0x384>)
 8001d72:	f003 fb57 	bl	8005424 <fn_08005424>
 8001d76:	f7ff fe01 	bl	800197c <fn_0800197C>
 8001d7a:	4872      	ldr	r0, [pc, #456]	@ (8001f44 <fn_08001BBC+0x388>)
 8001d7c:	f003 fb52 	bl	8005424 <fn_08005424>
 8001d80:	f01b fc16 	bl	801d5b0 <fn_0801D5B0>
 8001d84:	4870      	ldr	r0, [pc, #448]	@ (8001f48 <fn_08001BBC+0x38c>)
 8001d86:	f003 fb4d 	bl	8005424 <fn_08005424>
 8001d8a:	f003 f891 	bl	8004eb0 <fn_08004EB0>
 8001d8e:	486f      	ldr	r0, [pc, #444]	@ (8001f4c <fn_08001BBC+0x390>)
 8001d90:	f003 fb48 	bl	8005424 <fn_08005424>
 8001d94:	f004 fe8a 	bl	8006aac <fn_08006AAC>
 8001d98:	486d      	ldr	r0, [pc, #436]	@ (8001f50 <fn_08001BBC+0x394>)
 8001d9a:	f003 fb43 	bl	8005424 <fn_08005424>
 8001d9e:	f017 fa2b 	bl	80191f8 <fn_080191F8>
 8001da2:	486c      	ldr	r0, [pc, #432]	@ (8001f54 <fn_08001BBC+0x398>)
 8001da4:	f003 fb3e 	bl	8005424 <fn_08005424>
 8001da8:	f012 faae 	bl	8014308 <fn_08014308>
 8001dac:	486a      	ldr	r0, [pc, #424]	@ (8001f58 <fn_08001BBC+0x39c>)
 8001dae:	f003 fb39 	bl	8005424 <fn_08005424>
 8001db2:	6833      	ldr	r3, [r6, #0]
 8001db4:	4a69      	ldr	r2, [pc, #420]	@ (8001f5c <fn_08001BBC+0x3a0>)
 8001db6:	5899      	ldr	r1, [r3, r2]
 8001db8:	4a69      	ldr	r2, [pc, #420]	@ (8001f60 <fn_08001BBC+0x3a4>)
 8001dba:	5898      	ldr	r0, [r3, r2]
 8001dbc:	f017 ffd4 	bl	8019d68 <fn_08019D68>
 8001dc0:	4868      	ldr	r0, [pc, #416]	@ (8001f64 <fn_08001BBC+0x3a8>)
 8001dc2:	f003 fb2f 	bl	8005424 <fn_08005424>
 8001dc6:	f002 fdaf 	bl	8004928 <fn_08004928>
 8001dca:	4867      	ldr	r0, [pc, #412]	@ (8001f68 <fn_08001BBC+0x3ac>)
 8001dcc:	f003 fb2a 	bl	8005424 <fn_08005424>
 8001dd0:	f019 ffdc 	bl	801bd8c <fn_0801BD8C>
 8001dd4:	4865      	ldr	r0, [pc, #404]	@ (8001f6c <fn_08001BBC+0x3b0>)
 8001dd6:	f003 fb25 	bl	8005424 <fn_08005424>
 8001dda:	f001 fe41 	bl	8003a60 <fn_08003A60>
 8001dde:	6833      	ldr	r3, [r6, #0]
 8001de0:	4a63      	ldr	r2, [pc, #396]	@ (8001f70 <fn_08001BBC+0x3b4>)
 8001de2:	426d      	negs	r5, r5
 8001de4:	509d      	str	r5, [r3, r2]
 8001de6:	2400      	movs	r4, #0
 8001de8:	2282      	movs	r2, #130	@ 0x82
 8001dea:	549c      	strb	r4, [r3, r2]
 8001dec:	22ee      	movs	r2, #238	@ 0xee
 8001dee:	00d2      	lsls	r2, r2, #3
 8001df0:	509c      	str	r4, [r3, r2]
 8001df2:	f003 f989 	bl	8005108 <fn_08005108>
 8001df6:	22d4      	movs	r2, #212	@ 0xd4
 8001df8:	2101      	movs	r1, #1
 8001dfa:	6833      	ldr	r3, [r6, #0]
 8001dfc:	549c      	strb	r4, [r3, r2]
 8001dfe:	3a53      	subs	r2, #83	@ 0x53
 8001e00:	675d      	str	r5, [r3, #116]	@ 0x74
 8001e02:	5499      	strb	r1, [r3, r2]
 8001e04:	4b5b      	ldr	r3, [pc, #364]	@ (8001f74 <fn_08001BBC+0x3b8>)
 8001e06:	469a      	mov	sl, r3
 8001e08:	2380      	movs	r3, #128	@ 0x80
 8001e0a:	27ee      	movs	r7, #238	@ 0xee
 8001e0c:	4698      	mov	r8, r3
 8001e0e:	007f      	lsls	r7, r7, #1
 8001e10:	2381      	movs	r3, #129	@ 0x81
 8001e12:	4699      	mov	r9, r3
 8001e14:	f003 f902 	bl	800501c <fn_0800501C>
 8001e18:	4642      	mov	r2, r8
 8001e1a:	6833      	ldr	r3, [r6, #0]
 8001e1c:	5c9b      	ldrb	r3, [r3, r2]
 8001e1e:	2b00      	cmp	r3, #0
 8001e20:	d100      	bne.n	8001e24 <fn_08001BBC+0x268>
 8001e22:	e0e3      	b.n	8001fec <fn_08001BBC+0x430>
 8001e24:	f003 f8f4 	bl	8005010 <fn_08005010>
 8001e28:	464a      	mov	r2, r9
 8001e2a:	6833      	ldr	r3, [r6, #0]
 8001e2c:	5c9a      	ldrb	r2, [r3, r2]
 8001e2e:	2a00      	cmp	r2, #0
 8001e30:	d000      	beq.n	8001e34 <fn_08001BBC+0x278>
 8001e32:	e0ff      	b.n	8002034 <fn_08001BBC+0x478>
 8001e34:	f004 fcee 	bl	8006814 <fn_08006814>
 8001e38:	f002 f99e 	bl	8004178 <fn_08004178>
 8001e3c:	6833      	ldr	r3, [r6, #0]
 8001e3e:	59da      	ldr	r2, [r3, r7]
 8001e40:	3201      	adds	r2, #1
 8001e42:	51da      	str	r2, [r3, r7]
 8001e44:	6e9a      	ldr	r2, [r3, #104]	@ 0x68
 8001e46:	3201      	adds	r2, #1
 8001e48:	669a      	str	r2, [r3, #104]	@ 0x68
 8001e4a:	22e0      	movs	r2, #224	@ 0xe0
 8001e4c:	589b      	ldr	r3, [r3, r2]
 8001e4e:	2b00      	cmp	r3, #0
 8001e50:	d001      	beq.n	8001e56 <fn_08001BBC+0x29a>
 8001e52:	f018 fd9b 	bl	801a98c <fn_0801A98C>
 8001e56:	f003 f8e3 	bl	8005020 <fn_08005020>
 8001e5a:	2800      	cmp	r0, #0
 8001e5c:	d100      	bne.n	8001e60 <fn_08001BBC+0x2a4>
 8001e5e:	e091      	b.n	8001f84 <fn_08001BBC+0x3c8>
 8001e60:	23d5      	movs	r3, #213	@ 0xd5
 8001e62:	6832      	ldr	r2, [r6, #0]
 8001e64:	469b      	mov	fp, r3
 8001e66:	56d4      	ldrsb	r4, [r2, r3]
 8001e68:	3b65      	subs	r3, #101	@ 0x65
 8001e6a:	56d5      	ldrsb	r5, [r2, r3]
 8001e6c:	0023      	movs	r3, r4
 8001e6e:	42ac      	cmp	r4, r5
 8001e70:	d004      	beq.n	8001e7c <fn_08001BBC+0x2c0>
 8001e72:	f000 fff1 	bl	8002e58 <fn_08002E58>
 8001e76:	465b      	mov	r3, fp
 8001e78:	6832      	ldr	r2, [r6, #0]
 8001e7a:	56d3      	ldrsb	r3, [r2, r3]
 8001e7c:	2b00      	cmp	r3, #0
 8001e7e:	d100      	bne.n	8001e82 <fn_08001BBC+0x2c6>
 8001e80:	e0b8      	b.n	8001ff4 <fn_08001BBC+0x438>
 8001e82:	2171      	movs	r1, #113	@ 0x71
 8001e84:	5651      	ldrsb	r1, [r2, r1]
 8001e86:	3101      	adds	r1, #1
 8001e88:	2901      	cmp	r1, #1
 8001e8a:	d800      	bhi.n	8001e8e <fn_08001BBC+0x2d2>
 8001e8c:	e100      	b.n	8002090 <fn_08001BBC+0x4d4>
 8001e8e:	2b02      	cmp	r3, #2
 8001e90:	d100      	bne.n	8001e94 <fn_08001BBC+0x2d8>
 8001e92:	e0f7      	b.n	8002084 <fn_08001BBC+0x4c8>
 8001e94:	2b03      	cmp	r3, #3
 8001e96:	d100      	bne.n	8001e9a <fn_08001BBC+0x2de>
 8001e98:	e101      	b.n	800209e <fn_08001BBC+0x4e2>
 8001e9a:	2b01      	cmp	r3, #1
 8001e9c:	d104      	bne.n	8001ea8 <fn_08001BBC+0x2ec>
 8001e9e:	f01b f9d5 	bl	801d24c <fn_0801D24C>
 8001ea2:	23d5      	movs	r3, #213	@ 0xd5
 8001ea4:	6832      	ldr	r2, [r6, #0]
 8001ea6:	56d3      	ldrsb	r3, [r2, r3]
 8001ea8:	061b      	lsls	r3, r3, #24
 8001eaa:	0c19      	lsrs	r1, r3, #16
 8001eac:	0e1b      	lsrs	r3, r3, #24
 8001eae:	430b      	orrs	r3, r1
 8001eb0:	2170      	movs	r1, #112	@ 0x70
 8001eb2:	5253      	strh	r3, [r2, r1]
 8001eb4:	f004 fb64 	bl	8006580 <fn_08006580>
 8001eb8:	f7ff fd6a 	bl	8001990 <fn_08001990>
 8001ebc:	42ac      	cmp	r4, r5
 8001ebe:	d05d      	beq.n	8001f7c <fn_08001BBC+0x3c0>
 8001ec0:	f000 ffcc 	bl	8002e5c <fn_08002E5C>
 8001ec4:	f023 fb9e 	bl	8025604 <fn_08025604>
 8001ec8:	1e45      	subs	r5, r0, #1
 8001eca:	f000 ffc9 	bl	8002e60 <fn_08002E60>
 8001ece:	f023 fb99 	bl	8025604 <fn_08025604>
 8001ed2:	0004      	movs	r4, r0
 8001ed4:	1b40      	subs	r0, r0, r5
 8001ed6:	42ac      	cmp	r4, r5
 8001ed8:	d0f9      	beq.n	8001ece <fn_08001BBC+0x312>
 8001eda:	f000 ffef 	bl	8002ebc <fn_08002EBC>
 8001ede:	0005      	movs	r5, r0
 8001ee0:	f003 f8b6 	bl	8005050 <fn_08005050>
 8001ee4:	f004 fb4c 	bl	8006580 <fn_08006580>
 8001ee8:	2d00      	cmp	r5, #0
 8001eea:	d149      	bne.n	8001f80 <fn_08001BBC+0x3c4>
 8001eec:	0025      	movs	r5, r4
 8001eee:	e7ee      	b.n	8001ece <fn_08001BBC+0x312>
 8001ef0:	3001      	adds	r0, #1
 8001ef2:	e69a      	b.n	8001c2a <fn_08001BBC+0x6e>
 8001ef4:	08156c20 	.word	0x08156c20
 8001ef8:	08149078 	.word	0x08149078
 8001efc:	08156c40 	.word	0x08156c40
 8001f00:	030064c4 	.word	0x030064c4
 8001f04:	081490b4 	.word	0x081490b4
 8001f08:	00000302 	.word	0x00000302
 8001f0c:	00000202 	.word	0x00000202
 8001f10:	08149048 	.word	0x08149048
 8001f14:	08148fc8 	.word	0x08148fc8
 8001f18:	081478a0 	.word	0x081478a0
 8001f1c:	08149100 	.word	0x08149100
 8001f20:	08149114 	.word	0x08149114
 8001f24:	08149120 	.word	0x08149120
 8001f28:	08149140 	.word	0x08149140
 8001f2c:	08149150 	.word	0x08149150
 8001f30:	08149164 	.word	0x08149164
 8001f34:	0814917c 	.word	0x0814917c
 8001f38:	08149190 	.word	0x08149190
 8001f3c:	081491d8 	.word	0x081491d8
 8001f40:	0814921c 	.word	0x0814921c
 8001f44:	0814922c 	.word	0x0814922c
 8001f48:	08149244 	.word	0x08149244
 8001f4c:	08149270 	.word	0x08149270
 8001f50:	08149288 	.word	0x08149288
 8001f54:	081492a8 	.word	0x081492a8
 8001f58:	081492c8 	.word	0x081492c8
 8001f5c:	00005634 	.word	0x00005634
 8001f60:	00005630 	.word	0x00005630
 8001f64:	081492e4 	.word	0x081492e4
 8001f68:	08149300 	.word	0x08149300
 8001f6c:	0814931c 	.word	0x0814931c
 8001f70:	0000563c 	.word	0x0000563c
 8001f74:	080257b8 	.word	0x080257b8
 8001f78:	3701      	adds	r7, #1
 8001f7a:	e656      	b.n	8001c2a <fn_08001BBC+0x6e>
 8001f7c:	f003 f86a 	bl	8005054 <fn_08005054>
 8001f80:	f003 f862 	bl	8005048 <fn_08005048>
 8001f84:	2282      	movs	r2, #130	@ 0x82
 8001f86:	6833      	ldr	r3, [r6, #0]
 8001f88:	5c9a      	ldrb	r2, [r3, r2]
 8001f8a:	2a00      	cmp	r2, #0
 8001f8c:	d100      	bne.n	8001f90 <fn_08001BBC+0x3d4>
 8001f8e:	e741      	b.n	8001e14 <fn_08001BBC+0x258>
 8001f90:	258c      	movs	r5, #140	@ 0x8c
 8001f92:	595a      	ldr	r2, [r3, r5]
 8001f94:	3201      	adds	r2, #1
 8001f96:	515a      	str	r2, [r3, r5]
 8001f98:	f023 fb34 	bl	8025604 <fn_08025604>
 8001f9c:	2288      	movs	r2, #136	@ 0x88
 8001f9e:	6834      	ldr	r4, [r6, #0]
 8001fa0:	58a3      	ldr	r3, [r4, r2]
 8001fa2:	0019      	movs	r1, r3
 8001fa4:	3123      	adds	r1, #35	@ 0x23
 8001fa6:	4681      	mov	r9, r0
 8001fa8:	4288      	cmp	r0, r1
 8001faa:	d364      	bcc.n	8002076 <fn_08001BBC+0x4ba>
 8001fac:	21af      	movs	r1, #175	@ 0xaf
 8001fae:	5962      	ldr	r2, [r4, r5]
 8001fb0:	0049      	lsls	r1, r1, #1
 8001fb2:	4351      	muls	r1, r2
 8001fb4:	0409      	lsls	r1, r1, #16
 8001fb6:	000d      	movs	r5, r1
 8001fb8:	1ac3      	subs	r3, r0, r3
 8001fba:	041a      	lsls	r2, r3, #16
 8001fbc:	17d3      	asrs	r3, r2, #31
 8001fbe:	4055      	eors	r5, r2
 8001fc0:	18d2      	adds	r2, r2, r3
 8001fc2:	405a      	eors	r2, r3
 8001fc4:	17cb      	asrs	r3, r1, #31
 8001fc6:	18c9      	adds	r1, r1, r3
 8001fc8:	4059      	eors	r1, r3
 8001fca:	1408      	asrs	r0, r1, #16
 8001fcc:	2100      	movs	r1, #0
 8001fce:	f023 fb2b 	bl	8025628 <fn_08025628>
 8001fd2:	2d00      	cmp	r5, #0
 8001fd4:	da00      	bge.n	8001fd8 <fn_08001BBC+0x41c>
 8001fd6:	4240      	negs	r0, r0
 8001fd8:	2390      	movs	r3, #144	@ 0x90
 8001fda:	2200      	movs	r2, #0
 8001fdc:	1400      	asrs	r0, r0, #16
 8001fde:	50e0      	str	r0, [r4, r3]
 8001fe0:	3b04      	subs	r3, #4
 8001fe2:	50e2      	str	r2, [r4, r3]
 8001fe4:	464a      	mov	r2, r9
 8001fe6:	3b04      	subs	r3, #4
 8001fe8:	50e2      	str	r2, [r4, r3]
 8001fea:	e711      	b.n	8001e10 <fn_08001BBC+0x254>
 8001fec:	f7ff fcf0 	bl	80019d0 <fn_080019D0>
 8001ff0:	6833      	ldr	r3, [r6, #0]
 8001ff2:	e72a      	b.n	8001e4a <fn_08001BBC+0x28e>
 8001ff4:	21f0      	movs	r1, #240	@ 0xf0
 8001ff6:	0049      	lsls	r1, r1, #1
 8001ff8:	59d0      	ldr	r0, [r2, r7]
 8001ffa:	5851      	ldr	r1, [r2, r1]
 8001ffc:	4288      	cmp	r0, r1
 8001ffe:	d100      	bne.n	8002002 <fn_08001BBC+0x446>
 8002000:	e752      	b.n	8001ea8 <fn_08001BBC+0x2ec>
 8002002:	f002 fd5f 	bl	8004ac4 <fn_08004AC4>
 8002006:	2303      	movs	r3, #3
 8002008:	6830      	ldr	r0, [r6, #0]
 800200a:	7802      	ldrb	r2, [r0, #0]
 800200c:	4013      	ands	r3, r2
 800200e:	2b01      	cmp	r3, #1
 8002010:	d04f      	beq.n	80020b2 <fn_08001BBC+0x4f6>
 8002012:	30e0      	adds	r0, #224	@ 0xe0
 8002014:	f023 fb02 	bl	802561c <fn_0802561C>
 8002018:	6833      	ldr	r3, [r6, #0]
 800201a:	781b      	ldrb	r3, [r3, #0]
 800201c:	07db      	lsls	r3, r3, #31
 800201e:	d448      	bmi.n	80020b2 <fn_08001BBC+0x4f6>
 8002020:	2100      	movs	r1, #0
 8002022:	2001      	movs	r0, #1
 8002024:	f019 fc42 	bl	801b8ac <fn_0801B8AC>
 8002028:	f002 fd28 	bl	8004a7c <fn_08004A7C>
 800202c:	23d5      	movs	r3, #213	@ 0xd5
 800202e:	6832      	ldr	r2, [r6, #0]
 8002030:	56d3      	ldrsb	r3, [r2, r3]
 8002032:	e739      	b.n	8001ea8 <fn_08001BBC+0x2ec>
 8002034:	2200      	movs	r2, #0
 8002036:	21e4      	movs	r1, #228	@ 0xe4
 8002038:	545a      	strb	r2, [r3, r1]
 800203a:	494b      	ldr	r1, [pc, #300]	@ (8002168 <fn_08001BBC+0x5ac>)
 800203c:	545a      	strb	r2, [r3, r1]
 800203e:	4649      	mov	r1, r9
 8002040:	545a      	strb	r2, [r3, r1]
 8002042:	2282      	movs	r2, #130	@ 0x82
 8002044:	21c0      	movs	r1, #192	@ 0xc0
 8002046:	4655      	mov	r5, sl
 8002048:	32ff      	adds	r2, #255	@ 0xff
 800204a:	679a      	str	r2, [r3, #120]	@ 0x78
 800204c:	0089      	lsls	r1, r1, #2
 800204e:	3aad      	subs	r2, #173	@ 0xad
 8002050:	5299      	strh	r1, [r3, r2]
 8002052:	6f58      	ldr	r0, [r3, #116]	@ 0x74
 8002054:	3a40      	subs	r2, #64	@ 0x40
 8002056:	5c9c      	ldrb	r4, [r3, r2]
 8002058:	3001      	adds	r0, #1
 800205a:	0082      	lsls	r2, r0, #2
 800205c:	1911      	adds	r1, r2, r4
 800205e:	00c9      	lsls	r1, r1, #3
 8002060:	5869      	ldr	r1, [r5, r1]
 8002062:	2900      	cmp	r1, #0
 8002064:	d028      	beq.n	80020b8 <fn_08001BBC+0x4fc>
 8002066:	6758      	str	r0, [r3, #116]	@ 0x74
 8002068:	1913      	adds	r3, r2, r4
 800206a:	00db      	lsls	r3, r3, #3
 800206c:	4453      	add	r3, sl
 800206e:	6858      	ldr	r0, [r3, #4]
 8002070:	f000 f8f6 	bl	8002260 <fn_08002190+0xd0>
 8002074:	e6de      	b.n	8001e34 <fn_08001BBC+0x278>
 8002076:	4298      	cmp	r0, r3
 8002078:	d300      	bcc.n	800207c <fn_08001BBC+0x4c0>
 800207a:	e6c9      	b.n	8001e10 <fn_08001BBC+0x254>
 800207c:	2300      	movs	r3, #0
 800207e:	50a0      	str	r0, [r4, r2]
 8002080:	5163      	str	r3, [r4, r5]
 8002082:	e6c5      	b.n	8001e10 <fn_08001BBC+0x254>
 8002084:	f000 fdce 	bl	8002c24 <fn_08002C24>
 8002088:	23d5      	movs	r3, #213	@ 0xd5
 800208a:	6832      	ldr	r2, [r6, #0]
 800208c:	56d3      	ldrsb	r3, [r2, r3]
 800208e:	e70b      	b.n	8001ea8 <fn_08001BBC+0x2ec>
 8002090:	2000      	movs	r0, #0
 8002092:	f01a f925 	bl	801c2e0 <fn_0801C2E0>
 8002096:	23d5      	movs	r3, #213	@ 0xd5
 8002098:	6832      	ldr	r2, [r6, #0]
 800209a:	56d3      	ldrsb	r3, [r2, r3]
 800209c:	e6f7      	b.n	8001e8e <fn_08001BBC+0x2d2>
 800209e:	6fd0      	ldr	r0, [r2, #124]	@ 0x7c
 80020a0:	2800      	cmp	r0, #0
 80020a2:	d100      	bne.n	80020a6 <fn_08001BBC+0x4ea>
 80020a4:	e700      	b.n	8001ea8 <fn_08001BBC+0x2ec>
 80020a6:	f01a f8e5 	bl	801c274 <fn_0801C274>
 80020aa:	23d5      	movs	r3, #213	@ 0xd5
 80020ac:	6832      	ldr	r2, [r6, #0]
 80020ae:	56d3      	ldrsb	r3, [r2, r3]
 80020b0:	e6fa      	b.n	8001ea8 <fn_08001BBC+0x2ec>
 80020b2:	f7ff fa05 	bl	80014c0 <fn_080014C0>
 80020b6:	e7b3      	b.n	8002020 <fn_08001BBC+0x464>
 80020b8:	00e2      	lsls	r2, r4, #3
 80020ba:	58a9      	ldr	r1, [r5, r2]
 80020bc:	2000      	movs	r0, #0
 80020be:	2200      	movs	r2, #0
 80020c0:	e7d1      	b.n	8002066 <fn_08001BBC+0x4aa>
 80020c2:	2b03      	cmp	r3, #3
 80020c4:	d029      	beq.n	800211a <fn_08001BBC+0x55e>
 80020c6:	2595      	movs	r5, #149	@ 0x95
 80020c8:	2104      	movs	r1, #4
 80020ca:	4c28      	ldr	r4, [pc, #160]	@ (800216c <fn_08001BBC+0x5b0>)
 80020cc:	5551      	strb	r1, [r2, r5]
 80020ce:	428b      	cmp	r3, r1
 80020d0:	d000      	beq.n	80020d4 <fn_08001BBC+0x518>
 80020d2:	e62d      	b.n	8001d30 <fn_08001BBC+0x174>
 80020d4:	4826      	ldr	r0, [pc, #152]	@ (8002170 <fn_08001BBC+0x5b4>)
 80020d6:	f003 f9a5 	bl	8005424 <fn_08005424>
 80020da:	6832      	ldr	r2, [r6, #0]
 80020dc:	5dd3      	ldrb	r3, [r2, r7]
 80020de:	2b01      	cmp	r3, #1
 80020e0:	d029      	beq.n	8002136 <fn_08001BBC+0x57a>
 80020e2:	4c24      	ldr	r4, [pc, #144]	@ (8002174 <fn_08001BBC+0x5b8>)
 80020e4:	d800      	bhi.n	80020e8 <fn_08001BBC+0x52c>
 80020e6:	e623      	b.n	8001d30 <fn_08001BBC+0x174>
 80020e8:	2b02      	cmp	r3, #2
 80020ea:	d01b      	beq.n	8002124 <fn_08001BBC+0x568>
 80020ec:	2b03      	cmp	r3, #3
 80020ee:	d131      	bne.n	8002154 <fn_08001BBC+0x598>
 80020f0:	4c21      	ldr	r4, [pc, #132]	@ (8002178 <fn_08001BBC+0x5bc>)
 80020f2:	e61d      	b.n	8001d30 <fn_08001BBC+0x174>
 80020f4:	2395      	movs	r3, #149	@ 0x95
 80020f6:	2101      	movs	r1, #1
 80020f8:	4c20      	ldr	r4, [pc, #128]	@ (800217c <fn_08001BBC+0x5c0>)
 80020fa:	54d1      	strb	r1, [r2, r3]
 80020fc:	e618      	b.n	8001d30 <fn_08001BBC+0x174>
 80020fe:	4820      	ldr	r0, [pc, #128]	@ (8002180 <fn_08001BBC+0x5c4>)
 8002100:	f7fe fa52 	bl	80005a8 <fn_080005A8>
 8002104:	2394      	movs	r3, #148	@ 0x94
 8002106:	2204      	movs	r2, #4
 8002108:	54e2      	strb	r2, [r4, r3]
 800210a:	2200      	movs	r2, #0
 800210c:	33cd      	adds	r3, #205	@ 0xcd
 800210e:	33ff      	adds	r3, #255	@ 0xff
 8002110:	54e2      	strb	r2, [r4, r3]
 8002112:	e5fe      	b.n	8001d12 <fn_08001BBC+0x156>
 8002114:	1c13      	adds	r3, r2, #0
 8002116:	5463      	strb	r3, [r4, r1]
 8002118:	e5fb      	b.n	8001d12 <fn_08001BBC+0x156>
 800211a:	2100      	movs	r1, #0
 800211c:	3392      	adds	r3, #146	@ 0x92
 800211e:	54d1      	strb	r1, [r2, r3]
 8002120:	4c15      	ldr	r4, [pc, #84]	@ (8002178 <fn_08001BBC+0x5bc>)
 8002122:	e605      	b.n	8001d30 <fn_08001BBC+0x174>
 8002124:	5d53      	ldrb	r3, [r2, r5]
 8002126:	4c17      	ldr	r4, [pc, #92]	@ (8002184 <fn_08001BBC+0x5c8>)
 8002128:	2b02      	cmp	r3, #2
 800212a:	d100      	bne.n	800212e <fn_08001BBC+0x572>
 800212c:	e600      	b.n	8001d30 <fn_08001BBC+0x174>
 800212e:	2b03      	cmp	r3, #3
 8002130:	d10e      	bne.n	8002150 <fn_08001BBC+0x594>
 8002132:	4c15      	ldr	r4, [pc, #84]	@ (8002188 <fn_08001BBC+0x5cc>)
 8002134:	e5fc      	b.n	8001d30 <fn_08001BBC+0x174>
 8002136:	4c15      	ldr	r4, [pc, #84]	@ (800218c <fn_08001BBC+0x5d0>)
 8002138:	e5fa      	b.n	8001d30 <fn_08001BBC+0x174>
 800213a:	2811      	cmp	r0, #17
 800213c:	dd02      	ble.n	8002144 <fn_08001BBC+0x588>
 800213e:	2201      	movs	r2, #1
 8002140:	54e2      	strb	r2, [r4, r3]
 8002142:	e5e6      	b.n	8001d12 <fn_08001BBC+0x156>
 8002144:	4651      	mov	r1, sl
 8002146:	2908      	cmp	r1, #8
 8002148:	dc00      	bgt.n	800214c <fn_08001BBC+0x590>
 800214a:	e5e2      	b.n	8001d12 <fn_08001BBC+0x156>
 800214c:	54e2      	strb	r2, [r4, r3]
 800214e:	e5e0      	b.n	8001d12 <fn_08001BBC+0x156>
 8002150:	4c0a      	ldr	r4, [pc, #40]	@ (800217c <fn_08001BBC+0x5c0>)
 8002152:	e5ed      	b.n	8001d30 <fn_08001BBC+0x174>
 8002154:	4c05      	ldr	r4, [pc, #20]	@ (800216c <fn_08001BBC+0x5b0>)
 8002156:	e5eb      	b.n	8001d30 <fn_08001BBC+0x174>
 8002158:	2394      	movs	r3, #148	@ 0x94
 800215a:	2104      	movs	r1, #4
 800215c:	54e1      	strb	r1, [r4, r3]
 800215e:	33cd      	adds	r3, #205	@ 0xcd
 8002160:	33ff      	adds	r3, #255	@ 0xff
 8002162:	54e2      	strb	r2, [r4, r3]
 8002164:	e5d5      	b.n	8001d12 <fn_08001BBC+0x156>
 8002166:	46c0      	nop			@ (mov r8, r8)
 8002168:	0000025b 	.word	0x0000025b
 800216c:	08148fbc 	.word	0x08148fbc
 8002170:	081490dc 	.word	0x081490dc
 8002174:	08148fc8 	.word	0x08148fc8
 8002178:	08148fd8 	.word	0x08148fd8
 800217c:	08149030 	.word	0x08149030
 8002180:	081490bc 	.word	0x081490bc
 8002184:	08149008 	.word	0x08149008
 8002188:	08148fec 	.word	0x08148fec
 800218c:	08149020 	.word	0x08149020
