fn_08019E08:
 8019e08:	b5f0      	push	{r4, r5, r6, r7, lr}
 8019e0a:	46d6      	mov	lr, sl
 8019e0c:	464f      	mov	r7, r9
 8019e0e:	4646      	mov	r6, r8
 8019e10:	2380      	movs	r3, #128	@ 0x80
 8019e12:	b5c0      	push	{r6, r7, lr}
 8019e14:	b086      	sub	sp, #24
 8019e16:	9305      	str	r3, [sp, #20]
 8019e18:	4bc4      	ldr	r3, [pc, #784]	@ (801a12c <fn_08019E08+0x324>)
 8019e1a:	781b      	ldrb	r3, [r3, #0]
 8019e1c:	0005      	movs	r5, r0
 8019e1e:	000c      	movs	r4, r1
 8019e20:	9203      	str	r2, [sp, #12]
 8019e22:	2b00      	cmp	r3, #0
 8019e24:	d000      	beq.n	8019e28 <fn_08019E08+0x20>
 8019e26:	e133      	b.n	801a090 <fn_08019E08+0x288>
 8019e28:	2380      	movs	r3, #128	@ 0x80
 8019e2a:	000e      	movs	r6, r1
 8019e2c:	021b      	lsls	r3, r3, #8
 8019e2e:	401e      	ands	r6, r3
 8019e30:	4219      	tst	r1, r3
 8019e32:	d100      	bne.n	8019e36 <fn_08019E08+0x2e>
 8019e34:	e134      	b.n	801a0a0 <fn_08019E08+0x298>
 8019e36:	2301      	movs	r3, #1
 8019e38:	2601      	movs	r6, #1
 8019e3a:	469a      	mov	sl, r3
 8019e3c:	4bbc      	ldr	r3, [pc, #752]	@ (801a130 <fn_08019E08+0x328>)
 8019e3e:	401c      	ands	r4, r3
 8019e40:	1e63      	subs	r3, r4, #1
 8019e42:	2b6c      	cmp	r3, #108	@ 0x6c
 8019e44:	d903      	bls.n	8019e4e <fn_08019E08+0x46>
 8019e46:	0021      	movs	r1, r4
 8019e48:	48ba      	ldr	r0, [pc, #744]	@ (801a134 <fn_08019E08+0x32c>)
 8019e4a:	f7e6 fbad 	bl	80005a8 <fn_080005A8>
 8019e4e:	00a3      	lsls	r3, r4, #2
 8019e50:	4ab9      	ldr	r2, [pc, #740]	@ (801a138 <fn_08019E08+0x330>)
 8019e52:	4699      	mov	r9, r3
 8019e54:	191b      	adds	r3, r3, r4
 8019e56:	009b      	lsls	r3, r3, #2
 8019e58:	18d3      	adds	r3, r2, r3
 8019e5a:	4690      	mov	r8, r2
 8019e5c:	68da      	ldr	r2, [r3, #12]
 8019e5e:	2a00      	cmp	r2, #0
 8019e60:	d100      	bne.n	8019e64 <fn_08019E08+0x5c>
 8019e62:	e1b0      	b.n	801a1c6 <fn_08019E08+0x3be>
 8019e64:	691a      	ldr	r2, [r3, #16]
 8019e66:	9b03      	ldr	r3, [sp, #12]
 8019e68:	18d2      	adds	r2, r2, r3
 8019e6a:	9203      	str	r2, [sp, #12]
 8019e6c:	2a00      	cmp	r2, #0
 8019e6e:	dc00      	bgt.n	8019e72 <fn_08019E08+0x6a>
 8019e70:	e10e      	b.n	801a090 <fn_08019E08+0x288>
 8019e72:	4fb2      	ldr	r7, [pc, #712]	@ (801a13c <fn_08019E08+0x334>)
 8019e74:	49b2      	ldr	r1, [pc, #712]	@ (801a140 <fn_08019E08+0x338>)
 8019e76:	683b      	ldr	r3, [r7, #0]
 8019e78:	5859      	ldr	r1, [r3, r1]
 8019e7a:	428a      	cmp	r2, r1
 8019e7c:	dd00      	ble.n	8019e80 <fn_08019E08+0x78>
 8019e7e:	e11a      	b.n	801a0b6 <fn_08019E08+0x2ae>
 8019e80:	2d00      	cmp	r5, #0
 8019e82:	d012      	beq.n	8019eaa <fn_08019E08+0xa2>
 8019e84:	22e0      	movs	r2, #224	@ 0xe0
 8019e86:	5898      	ldr	r0, [r3, r2]
 8019e88:	42a8      	cmp	r0, r5
 8019e8a:	d00e      	beq.n	8019eaa <fn_08019E08+0xa2>
 8019e8c:	2800      	cmp	r0, #0
 8019e8e:	d100      	bne.n	8019e92 <fn_08019E08+0x8a>
 8019e90:	e0fe      	b.n	801a090 <fn_08019E08+0x288>
 8019e92:	ab05      	add	r3, sp, #20
 8019e94:	692a      	ldr	r2, [r5, #16]
 8019e96:	68e9      	ldr	r1, [r5, #12]
 8019e98:	9300      	str	r3, [sp, #0]
 8019e9a:	ab03      	add	r3, sp, #12
 8019e9c:	f7ff fea8 	bl	8019bf0 <fn_08019BF0>
 8019ea0:	2800      	cmp	r0, #0
 8019ea2:	d100      	bne.n	8019ea6 <fn_08019E08+0x9e>
 8019ea4:	e0f4      	b.n	801a090 <fn_08019E08+0x288>
 8019ea6:	683b      	ldr	r3, [r7, #0]
 8019ea8:	e002      	b.n	8019eb0 <fn_08019E08+0xa8>
 8019eaa:	9a03      	ldr	r2, [sp, #12]
 8019eac:	00d2      	lsls	r2, r2, #3
 8019eae:	9203      	str	r2, [sp, #12]
 8019eb0:	4aa4      	ldr	r2, [pc, #656]	@ (801a144 <fn_08019E08+0x33c>)
 8019eb2:	589a      	ldr	r2, [r3, r2]
 8019eb4:	2a00      	cmp	r2, #0
 8019eb6:	d004      	beq.n	8019ec2 <fn_08019E08+0xba>
 8019eb8:	4aa3      	ldr	r2, [pc, #652]	@ (801a148 <fn_08019E08+0x340>)
 8019eba:	589a      	ldr	r2, [r3, r2]
 8019ebc:	4295      	cmp	r5, r2
 8019ebe:	d100      	bne.n	8019ec2 <fn_08019E08+0xba>
 8019ec0:	e1a7      	b.n	801a212 <fn_08019E08+0x40a>
 8019ec2:	4aa2      	ldr	r2, [pc, #648]	@ (801a14c <fn_08019E08+0x344>)
 8019ec4:	589a      	ldr	r2, [r3, r2]
 8019ec6:	2a00      	cmp	r2, #0
 8019ec8:	d004      	beq.n	8019ed4 <fn_08019E08+0xcc>
 8019eca:	4aa1      	ldr	r2, [pc, #644]	@ (801a150 <fn_08019E08+0x348>)
 8019ecc:	589a      	ldr	r2, [r3, r2]
 8019ece:	4295      	cmp	r5, r2
 8019ed0:	d100      	bne.n	8019ed4 <fn_08019E08+0xcc>
 8019ed2:	e1a5      	b.n	801a220 <fn_08019E08+0x418>
 8019ed4:	4a9f      	ldr	r2, [pc, #636]	@ (801a154 <fn_08019E08+0x34c>)
 8019ed6:	589a      	ldr	r2, [r3, r2]
 8019ed8:	2a00      	cmp	r2, #0
 8019eda:	d004      	beq.n	8019ee6 <fn_08019E08+0xde>
 8019edc:	4a9e      	ldr	r2, [pc, #632]	@ (801a158 <fn_08019E08+0x350>)
 8019ede:	589a      	ldr	r2, [r3, r2]
 8019ee0:	4295      	cmp	r5, r2
 8019ee2:	d100      	bne.n	8019ee6 <fn_08019E08+0xde>
 8019ee4:	e0e9      	b.n	801a0ba <fn_08019E08+0x2b2>
 8019ee6:	4a9d      	ldr	r2, [pc, #628]	@ (801a15c <fn_08019E08+0x354>)
 8019ee8:	589a      	ldr	r2, [r3, r2]
 8019eea:	2a00      	cmp	r2, #0
 8019eec:	d004      	beq.n	8019ef8 <fn_08019E08+0xf0>
 8019eee:	4a9c      	ldr	r2, [pc, #624]	@ (801a160 <fn_08019E08+0x358>)
 8019ef0:	589a      	ldr	r2, [r3, r2]
 8019ef2:	4295      	cmp	r5, r2
 8019ef4:	d100      	bne.n	8019ef8 <fn_08019E08+0xf0>
 8019ef6:	e0ef      	b.n	801a0d8 <fn_08019E08+0x2d0>
 8019ef8:	22ac      	movs	r2, #172	@ 0xac
 8019efa:	01d2      	lsls	r2, r2, #7
 8019efc:	589a      	ldr	r2, [r3, r2]
 8019efe:	2a00      	cmp	r2, #0
 8019f00:	d004      	beq.n	8019f0c <fn_08019E08+0x104>
 8019f02:	4a98      	ldr	r2, [pc, #608]	@ (801a164 <fn_08019E08+0x35c>)
 8019f04:	589a      	ldr	r2, [r3, r2]
 8019f06:	4295      	cmp	r5, r2
 8019f08:	d100      	bne.n	8019f0c <fn_08019E08+0x104>
 8019f0a:	e0ec      	b.n	801a0e6 <fn_08019E08+0x2de>
 8019f0c:	4a96      	ldr	r2, [pc, #600]	@ (801a168 <fn_08019E08+0x360>)
 8019f0e:	589a      	ldr	r2, [r3, r2]
 8019f10:	2a00      	cmp	r2, #0
 8019f12:	d004      	beq.n	8019f1e <fn_08019E08+0x116>
 8019f14:	4a95      	ldr	r2, [pc, #596]	@ (801a16c <fn_08019E08+0x364>)
 8019f16:	589a      	ldr	r2, [r3, r2]
 8019f18:	4295      	cmp	r5, r2
 8019f1a:	d100      	bne.n	8019f1e <fn_08019E08+0x116>
 8019f1c:	e0ea      	b.n	801a0f4 <fn_08019E08+0x2ec>
 8019f1e:	4a94      	ldr	r2, [pc, #592]	@ (801a170 <fn_08019E08+0x368>)
 8019f20:	589a      	ldr	r2, [r3, r2]
 8019f22:	2a00      	cmp	r2, #0
 8019f24:	d004      	beq.n	8019f30 <fn_08019E08+0x128>
 8019f26:	4a93      	ldr	r2, [pc, #588]	@ (801a174 <fn_08019E08+0x36c>)
 8019f28:	589a      	ldr	r2, [r3, r2]
 8019f2a:	4295      	cmp	r5, r2
 8019f2c:	d100      	bne.n	8019f30 <fn_08019E08+0x128>
 8019f2e:	e0e8      	b.n	801a102 <fn_08019E08+0x2fa>
 8019f30:	4a91      	ldr	r2, [pc, #580]	@ (801a178 <fn_08019E08+0x370>)
 8019f32:	589a      	ldr	r2, [r3, r2]
 8019f34:	2a00      	cmp	r2, #0
 8019f36:	d004      	beq.n	8019f42 <fn_08019E08+0x13a>
 8019f38:	4a90      	ldr	r2, [pc, #576]	@ (801a17c <fn_08019E08+0x374>)
 8019f3a:	589a      	ldr	r2, [r3, r2]
 8019f3c:	42aa      	cmp	r2, r5
 8019f3e:	d100      	bne.n	8019f42 <fn_08019E08+0x13a>
 8019f40:	e0e6      	b.n	801a110 <fn_08019E08+0x308>
 8019f42:	4a80      	ldr	r2, [pc, #512]	@ (801a144 <fn_08019E08+0x33c>)
 8019f44:	589a      	ldr	r2, [r3, r2]
 8019f46:	2d00      	cmp	r5, #0
 8019f48:	d100      	bne.n	8019f4c <fn_08019E08+0x144>
 8019f4a:	e13f      	b.n	801a1cc <fn_08019E08+0x3c4>
 8019f4c:	2a00      	cmp	r2, #0
 8019f4e:	d100      	bne.n	8019f52 <fn_08019E08+0x14a>
 8019f50:	e188      	b.n	801a264 <fn_08019E08+0x45c>
 8019f52:	4a7d      	ldr	r2, [pc, #500]	@ (801a148 <fn_08019E08+0x340>)
 8019f54:	589a      	ldr	r2, [r3, r2]
 8019f56:	4295      	cmp	r5, r2
 8019f58:	d100      	bne.n	8019f5c <fn_08019E08+0x154>
 8019f5a:	e0e0      	b.n	801a11e <fn_08019E08+0x316>
 8019f5c:	4a7b      	ldr	r2, [pc, #492]	@ (801a14c <fn_08019E08+0x344>)
 8019f5e:	589a      	ldr	r2, [r3, r2]
 8019f60:	2a00      	cmp	r2, #0
 8019f62:	d100      	bne.n	8019f66 <fn_08019E08+0x15e>
 8019f64:	e180      	b.n	801a268 <fn_08019E08+0x460>
 8019f66:	4a7a      	ldr	r2, [pc, #488]	@ (801a150 <fn_08019E08+0x348>)
 8019f68:	589a      	ldr	r2, [r3, r2]
 8019f6a:	4295      	cmp	r5, r2
 8019f6c:	d100      	bne.n	8019f70 <fn_08019E08+0x168>
 8019f6e:	e115      	b.n	801a19c <fn_08019E08+0x394>
 8019f70:	4a78      	ldr	r2, [pc, #480]	@ (801a154 <fn_08019E08+0x34c>)
 8019f72:	589a      	ldr	r2, [r3, r2]
 8019f74:	2a00      	cmp	r2, #0
 8019f76:	d100      	bne.n	8019f7a <fn_08019E08+0x172>
 8019f78:	e179      	b.n	801a26e <fn_08019E08+0x466>
 8019f7a:	4a77      	ldr	r2, [pc, #476]	@ (801a158 <fn_08019E08+0x350>)
 8019f7c:	589a      	ldr	r2, [r3, r2]
 8019f7e:	4295      	cmp	r5, r2
 8019f80:	d100      	bne.n	8019f84 <fn_08019E08+0x17c>
 8019f82:	e112      	b.n	801a1aa <fn_08019E08+0x3a2>
 8019f84:	4a75      	ldr	r2, [pc, #468]	@ (801a15c <fn_08019E08+0x354>)
 8019f86:	589a      	ldr	r2, [r3, r2]
 8019f88:	2a00      	cmp	r2, #0
 8019f8a:	d100      	bne.n	8019f8e <fn_08019E08+0x186>
 8019f8c:	e172      	b.n	801a274 <fn_08019E08+0x46c>
 8019f8e:	4a74      	ldr	r2, [pc, #464]	@ (801a160 <fn_08019E08+0x358>)
 8019f90:	589a      	ldr	r2, [r3, r2]
 8019f92:	4295      	cmp	r5, r2
 8019f94:	d100      	bne.n	8019f98 <fn_08019E08+0x190>
 8019f96:	e10f      	b.n	801a1b8 <fn_08019E08+0x3b0>
 8019f98:	22ac      	movs	r2, #172	@ 0xac
 8019f9a:	01d2      	lsls	r2, r2, #7
 8019f9c:	589a      	ldr	r2, [r3, r2]
 8019f9e:	2a00      	cmp	r2, #0
 8019fa0:	d100      	bne.n	8019fa4 <fn_08019E08+0x19c>
 8019fa2:	e16a      	b.n	801a27a <fn_08019E08+0x472>
 8019fa4:	4a6f      	ldr	r2, [pc, #444]	@ (801a164 <fn_08019E08+0x35c>)
 8019fa6:	589a      	ldr	r2, [r3, r2]
 8019fa8:	4295      	cmp	r5, r2
 8019faa:	d100      	bne.n	8019fae <fn_08019E08+0x1a6>
 8019fac:	e13f      	b.n	801a22e <fn_08019E08+0x426>
 8019fae:	4a6e      	ldr	r2, [pc, #440]	@ (801a168 <fn_08019E08+0x360>)
 8019fb0:	589a      	ldr	r2, [r3, r2]
 8019fb2:	2a00      	cmp	r2, #0
 8019fb4:	d100      	bne.n	8019fb8 <fn_08019E08+0x1b0>
 8019fb6:	e163      	b.n	801a280 <fn_08019E08+0x478>
 8019fb8:	4a6c      	ldr	r2, [pc, #432]	@ (801a16c <fn_08019E08+0x364>)
 8019fba:	589a      	ldr	r2, [r3, r2]
 8019fbc:	4295      	cmp	r5, r2
 8019fbe:	d100      	bne.n	8019fc2 <fn_08019E08+0x1ba>
 8019fc0:	e13c      	b.n	801a23c <fn_08019E08+0x434>
 8019fc2:	4a6b      	ldr	r2, [pc, #428]	@ (801a170 <fn_08019E08+0x368>)
 8019fc4:	589a      	ldr	r2, [r3, r2]
 8019fc6:	2a00      	cmp	r2, #0
 8019fc8:	d100      	bne.n	8019fcc <fn_08019E08+0x1c4>
 8019fca:	e15c      	b.n	801a286 <fn_08019E08+0x47e>
 8019fcc:	4a69      	ldr	r2, [pc, #420]	@ (801a174 <fn_08019E08+0x36c>)
 8019fce:	589a      	ldr	r2, [r3, r2]
 8019fd0:	4295      	cmp	r5, r2
 8019fd2:	d100      	bne.n	8019fd6 <fn_08019E08+0x1ce>
 8019fd4:	e139      	b.n	801a24a <fn_08019E08+0x442>
 8019fd6:	4a68      	ldr	r2, [pc, #416]	@ (801a178 <fn_08019E08+0x370>)
 8019fd8:	589a      	ldr	r2, [r3, r2]
 8019fda:	2a00      	cmp	r2, #0
 8019fdc:	d100      	bne.n	8019fe0 <fn_08019E08+0x1d8>
 8019fde:	e115      	b.n	801a20c <fn_08019E08+0x404>
 8019fe0:	4a66      	ldr	r2, [pc, #408]	@ (801a17c <fn_08019E08+0x374>)
 8019fe2:	589a      	ldr	r2, [r3, r2]
 8019fe4:	4295      	cmp	r5, r2
 8019fe6:	d100      	bne.n	8019fea <fn_08019E08+0x1e2>
 8019fe8:	e136      	b.n	801a258 <fn_08019E08+0x450>
 8019fea:	464a      	mov	r2, r9
 8019fec:	4955      	ldr	r1, [pc, #340]	@ (801a144 <fn_08019E08+0x33c>)
 8019fee:	1912      	adds	r2, r2, r4
 8019ff0:	5859      	ldr	r1, [r3, r1]
 8019ff2:	0092      	lsls	r2, r2, #2
 8019ff4:	4442      	add	r2, r8
 8019ff6:	6892      	ldr	r2, [r2, #8]
 8019ff8:	6889      	ldr	r1, [r1, #8]
 8019ffa:	428a      	cmp	r2, r1
 8019ffc:	dc00      	bgt.n	801a000 <fn_08019E08+0x1f8>
 8019ffe:	e093      	b.n	801a128 <fn_08019E08+0x320>
 801a000:	4952      	ldr	r1, [pc, #328]	@ (801a14c <fn_08019E08+0x344>)
 801a002:	5859      	ldr	r1, [r3, r1]
 801a004:	6889      	ldr	r1, [r1, #8]
 801a006:	4291      	cmp	r1, r2
 801a008:	db00      	blt.n	801a00c <fn_08019E08+0x204>
 801a00a:	e0cc      	b.n	801a1a6 <fn_08019E08+0x39e>
 801a00c:	4951      	ldr	r1, [pc, #324]	@ (801a154 <fn_08019E08+0x34c>)
 801a00e:	5859      	ldr	r1, [r3, r1]
 801a010:	6889      	ldr	r1, [r1, #8]
 801a012:	428a      	cmp	r2, r1
 801a014:	dc00      	bgt.n	801a018 <fn_08019E08+0x210>
 801a016:	e0cd      	b.n	801a1b4 <fn_08019E08+0x3ac>
 801a018:	4950      	ldr	r1, [pc, #320]	@ (801a15c <fn_08019E08+0x354>)
 801a01a:	5859      	ldr	r1, [r3, r1]
 801a01c:	6889      	ldr	r1, [r1, #8]
 801a01e:	428a      	cmp	r2, r1
 801a020:	dc00      	bgt.n	801a024 <fn_08019E08+0x21c>
 801a022:	e0ce      	b.n	801a1c2 <fn_08019E08+0x3ba>
 801a024:	21ac      	movs	r1, #172	@ 0xac
 801a026:	01c9      	lsls	r1, r1, #7
 801a028:	5859      	ldr	r1, [r3, r1]
 801a02a:	6889      	ldr	r1, [r1, #8]
 801a02c:	428a      	cmp	r2, r1
 801a02e:	dc00      	bgt.n	801a032 <fn_08019E08+0x22a>
 801a030:	e102      	b.n	801a238 <fn_08019E08+0x430>
 801a032:	494d      	ldr	r1, [pc, #308]	@ (801a168 <fn_08019E08+0x360>)
 801a034:	5859      	ldr	r1, [r3, r1]
 801a036:	6889      	ldr	r1, [r1, #8]
 801a038:	428a      	cmp	r2, r1
 801a03a:	dc00      	bgt.n	801a03e <fn_08019E08+0x236>
 801a03c:	e103      	b.n	801a246 <fn_08019E08+0x43e>
 801a03e:	494c      	ldr	r1, [pc, #304]	@ (801a170 <fn_08019E08+0x368>)
 801a040:	5859      	ldr	r1, [r3, r1]
 801a042:	6889      	ldr	r1, [r1, #8]
 801a044:	428a      	cmp	r2, r1
 801a046:	dc00      	bgt.n	801a04a <fn_08019E08+0x242>
 801a048:	e104      	b.n	801a254 <fn_08019E08+0x44c>
 801a04a:	494b      	ldr	r1, [pc, #300]	@ (801a178 <fn_08019E08+0x370>)
 801a04c:	5859      	ldr	r1, [r3, r1]
 801a04e:	6889      	ldr	r1, [r1, #8]
 801a050:	4291      	cmp	r1, r2
 801a052:	db1d      	blt.n	801a090 <fn_08019E08+0x288>
 801a054:	2107      	movs	r1, #7
 801a056:	004a      	lsls	r2, r1, #1
 801a058:	1850      	adds	r0, r2, r1
 801a05a:	4e3a      	ldr	r6, [pc, #232]	@ (801a144 <fn_08019E08+0x33c>)
 801a05c:	0080      	lsls	r0, r0, #2
 801a05e:	1818      	adds	r0, r3, r0
 801a060:	1980      	adds	r0, r0, r6
 801a062:	2600      	movs	r6, #0
 801a064:	6006      	str	r6, [r0, #0]
 801a066:	1852      	adds	r2, r2, r1
 801a068:	0092      	lsls	r2, r2, #2
 801a06a:	189b      	adds	r3, r3, r2
 801a06c:	4a35      	ldr	r2, [pc, #212]	@ (801a144 <fn_08019E08+0x33c>)
 801a06e:	1898      	adds	r0, r3, r2
 801a070:	464a      	mov	r2, r9
 801a072:	1912      	adds	r2, r2, r4
 801a074:	0092      	lsls	r2, r2, #2
 801a076:	4442      	add	r2, r8
 801a078:	6002      	str	r2, [r0, #0]
 801a07a:	4a33      	ldr	r2, [pc, #204]	@ (801a148 <fn_08019E08+0x340>)
 801a07c:	509d      	str	r5, [r3, r2]
 801a07e:	4a40      	ldr	r2, [pc, #256]	@ (801a180 <fn_08019E08+0x378>)
 801a080:	189b      	adds	r3, r3, r2
 801a082:	4652      	mov	r2, sl
 801a084:	0020      	movs	r0, r4
 801a086:	801a      	strh	r2, [r3, #0]
 801a088:	9b05      	ldr	r3, [sp, #20]
 801a08a:	9a03      	ldr	r2, [sp, #12]
 801a08c:	f7ea fe5e 	bl	8004d4c <fn_08004D4C>
 801a090:	b006      	add	sp, #24
 801a092:	bce0      	pop	{r5, r6, r7}
 801a094:	46ba      	mov	sl, r7
 801a096:	46b1      	mov	r9, r6
 801a098:	46a8      	mov	r8, r5
 801a09a:	bcf0      	pop	{r4, r5, r6, r7}
 801a09c:	bc01      	pop	{r0}
 801a09e:	4700      	bx	r0
 801a0a0:	2922      	cmp	r1, #34	@ 0x22
 801a0a2:	d004      	beq.n	801a0ae <fn_08019E08+0x2a6>
 801a0a4:	2300      	movs	r3, #0
 801a0a6:	469a      	mov	sl, r3
 801a0a8:	2951      	cmp	r1, #81	@ 0x51
 801a0aa:	d000      	beq.n	801a0ae <fn_08019E08+0x2a6>
 801a0ac:	e6c6      	b.n	8019e3c <fn_08019E08+0x34>
 801a0ae:	2301      	movs	r3, #1
 801a0b0:	2601      	movs	r6, #1
 801a0b2:	469a      	mov	sl, r3
 801a0b4:	e6cb      	b.n	8019e4e <fn_08019E08+0x46>
 801a0b6:	9103      	str	r1, [sp, #12]
 801a0b8:	e6e2      	b.n	8019e80 <fn_08019E08+0x78>
 801a0ba:	4a32      	ldr	r2, [pc, #200]	@ (801a184 <fn_08019E08+0x37c>)
 801a0bc:	5e9a      	ldrsh	r2, [r3, r2]
 801a0be:	4296      	cmp	r6, r2
 801a0c0:	d000      	beq.n	801a0c4 <fn_08019E08+0x2bc>
 801a0c2:	e710      	b.n	8019ee6 <fn_08019E08+0xde>
 801a0c4:	2102      	movs	r1, #2
 801a0c6:	004a      	lsls	r2, r1, #1
 801a0c8:	1852      	adds	r2, r2, r1
 801a0ca:	0092      	lsls	r2, r2, #2
 801a0cc:	491d      	ldr	r1, [pc, #116]	@ (801a144 <fn_08019E08+0x33c>)
 801a0ce:	189a      	adds	r2, r3, r2
 801a0d0:	1852      	adds	r2, r2, r1
 801a0d2:	2100      	movs	r1, #0
 801a0d4:	6011      	str	r1, [r2, #0]
 801a0d6:	e734      	b.n	8019f42 <fn_08019E08+0x13a>
 801a0d8:	4a2b      	ldr	r2, [pc, #172]	@ (801a188 <fn_08019E08+0x380>)
 801a0da:	5e9a      	ldrsh	r2, [r3, r2]
 801a0dc:	4296      	cmp	r6, r2
 801a0de:	d000      	beq.n	801a0e2 <fn_08019E08+0x2da>
 801a0e0:	e70a      	b.n	8019ef8 <fn_08019E08+0xf0>
 801a0e2:	2103      	movs	r1, #3
 801a0e4:	e7ef      	b.n	801a0c6 <fn_08019E08+0x2be>
 801a0e6:	4a29      	ldr	r2, [pc, #164]	@ (801a18c <fn_08019E08+0x384>)
 801a0e8:	5e9a      	ldrsh	r2, [r3, r2]
 801a0ea:	4296      	cmp	r6, r2
 801a0ec:	d000      	beq.n	801a0f0 <fn_08019E08+0x2e8>
 801a0ee:	e70d      	b.n	8019f0c <fn_08019E08+0x104>
 801a0f0:	2104      	movs	r1, #4
 801a0f2:	e7e8      	b.n	801a0c6 <fn_08019E08+0x2be>
 801a0f4:	4a26      	ldr	r2, [pc, #152]	@ (801a190 <fn_08019E08+0x388>)
 801a0f6:	5e9a      	ldrsh	r2, [r3, r2]
 801a0f8:	4296      	cmp	r6, r2
 801a0fa:	d000      	beq.n	801a0fe <fn_08019E08+0x2f6>
 801a0fc:	e70f      	b.n	8019f1e <fn_08019E08+0x116>
 801a0fe:	2105      	movs	r1, #5
 801a100:	e7e1      	b.n	801a0c6 <fn_08019E08+0x2be>
 801a102:	4a24      	ldr	r2, [pc, #144]	@ (801a194 <fn_08019E08+0x38c>)
 801a104:	5e9a      	ldrsh	r2, [r3, r2]
 801a106:	4296      	cmp	r6, r2
 801a108:	d000      	beq.n	801a10c <fn_08019E08+0x304>
 801a10a:	e711      	b.n	8019f30 <fn_08019E08+0x128>
 801a10c:	2106      	movs	r1, #6
 801a10e:	e7da      	b.n	801a0c6 <fn_08019E08+0x2be>
 801a110:	4a21      	ldr	r2, [pc, #132]	@ (801a198 <fn_08019E08+0x390>)
 801a112:	5e9a      	ldrsh	r2, [r3, r2]
 801a114:	2107      	movs	r1, #7
 801a116:	42b2      	cmp	r2, r6
 801a118:	d000      	beq.n	801a11c <fn_08019E08+0x314>
 801a11a:	e712      	b.n	8019f42 <fn_08019E08+0x13a>
 801a11c:	e7d3      	b.n	801a0c6 <fn_08019E08+0x2be>
 801a11e:	4a18      	ldr	r2, [pc, #96]	@ (801a180 <fn_08019E08+0x378>)
 801a120:	5e9a      	ldrsh	r2, [r3, r2]
 801a122:	4296      	cmp	r6, r2
 801a124:	d000      	beq.n	801a128 <fn_08019E08+0x320>
 801a126:	e719      	b.n	8019f5c <fn_08019E08+0x154>
 801a128:	2100      	movs	r1, #0
 801a12a:	e794      	b.n	801a056 <fn_08019E08+0x24e>
 801a12c:	080257f6 	.word	0x080257f6	@ data_080257F6
 801a130:	ffff7fff 	.word	0xffff7fff
 801a134:	0814a814 	.word	0x0814a814
 801a138:	0812f754 	.word	0x0812f754	@ data_0812F754
 801a13c:	030064c4 	.word	0x030064c4	@ data_030064C4
 801a140:	00005630 	.word	0x00005630
 801a144:	000055d0 	.word	0x000055d0
 801a148:	000055d4 	.word	0x000055d4
 801a14c:	000055dc 	.word	0x000055dc
 801a150:	000055e0 	.word	0x000055e0
 801a154:	000055e8 	.word	0x000055e8
 801a158:	000055ec 	.word	0x000055ec
 801a15c:	000055f4 	.word	0x000055f4
 801a160:	000055f8 	.word	0x000055f8
 801a164:	00005604 	.word	0x00005604
 801a168:	0000560c 	.word	0x0000560c
 801a16c:	00005610 	.word	0x00005610
 801a170:	00005618 	.word	0x00005618
 801a174:	0000561c 	.word	0x0000561c
 801a178:	00005624 	.word	0x00005624
 801a17c:	00005628 	.word	0x00005628
 801a180:	000055d8 	.word	0x000055d8
 801a184:	000055f0 	.word	0x000055f0
 801a188:	000055fc 	.word	0x000055fc
 801a18c:	00005608 	.word	0x00005608
 801a190:	00005614 	.word	0x00005614
 801a194:	00005620 	.word	0x00005620
 801a198:	0000562c 	.word	0x0000562c
 801a19c:	4a3b      	ldr	r2, [pc, #236]	@ (801a28c <fn_08019E08+0x484>)
 801a19e:	5e9a      	ldrsh	r2, [r3, r2]
 801a1a0:	4296      	cmp	r6, r2
 801a1a2:	d000      	beq.n	801a1a6 <fn_08019E08+0x39e>
 801a1a4:	e6e4      	b.n	8019f70 <fn_08019E08+0x168>
 801a1a6:	2101      	movs	r1, #1
 801a1a8:	e755      	b.n	801a056 <fn_08019E08+0x24e>
 801a1aa:	4a39      	ldr	r2, [pc, #228]	@ (801a290 <fn_08019E08+0x488>)
 801a1ac:	5e9a      	ldrsh	r2, [r3, r2]
 801a1ae:	4296      	cmp	r6, r2
 801a1b0:	d000      	beq.n	801a1b4 <fn_08019E08+0x3ac>
 801a1b2:	e6e7      	b.n	8019f84 <fn_08019E08+0x17c>
 801a1b4:	2102      	movs	r1, #2
 801a1b6:	e74e      	b.n	801a056 <fn_08019E08+0x24e>
 801a1b8:	4a36      	ldr	r2, [pc, #216]	@ (801a294 <fn_08019E08+0x48c>)
 801a1ba:	5e9a      	ldrsh	r2, [r3, r2]
 801a1bc:	4296      	cmp	r6, r2
 801a1be:	d000      	beq.n	801a1c2 <fn_08019E08+0x3ba>
 801a1c0:	e6ea      	b.n	8019f98 <fn_08019E08+0x190>
 801a1c2:	2103      	movs	r1, #3
 801a1c4:	e747      	b.n	801a056 <fn_08019E08+0x24e>
 801a1c6:	4f34      	ldr	r7, [pc, #208]	@ (801a298 <fn_08019E08+0x490>)
 801a1c8:	683b      	ldr	r3, [r7, #0]
 801a1ca:	e659      	b.n	8019e80 <fn_08019E08+0x78>
 801a1cc:	2a00      	cmp	r2, #0
 801a1ce:	d049      	beq.n	801a264 <fn_08019E08+0x45c>
 801a1d0:	4a32      	ldr	r2, [pc, #200]	@ (801a29c <fn_08019E08+0x494>)
 801a1d2:	589a      	ldr	r2, [r3, r2]
 801a1d4:	2a00      	cmp	r2, #0
 801a1d6:	d047      	beq.n	801a268 <fn_08019E08+0x460>
 801a1d8:	4a31      	ldr	r2, [pc, #196]	@ (801a2a0 <fn_08019E08+0x498>)
 801a1da:	589a      	ldr	r2, [r3, r2]
 801a1dc:	2a00      	cmp	r2, #0
 801a1de:	d046      	beq.n	801a26e <fn_08019E08+0x466>
 801a1e0:	4a30      	ldr	r2, [pc, #192]	@ (801a2a4 <fn_08019E08+0x49c>)
 801a1e2:	589a      	ldr	r2, [r3, r2]
 801a1e4:	2a00      	cmp	r2, #0
 801a1e6:	d045      	beq.n	801a274 <fn_08019E08+0x46c>
 801a1e8:	22ac      	movs	r2, #172	@ 0xac
 801a1ea:	01d2      	lsls	r2, r2, #7
 801a1ec:	589a      	ldr	r2, [r3, r2]
 801a1ee:	2a00      	cmp	r2, #0
 801a1f0:	d043      	beq.n	801a27a <fn_08019E08+0x472>
 801a1f2:	4a2d      	ldr	r2, [pc, #180]	@ (801a2a8 <fn_08019E08+0x4a0>)
 801a1f4:	589a      	ldr	r2, [r3, r2]
 801a1f6:	2a00      	cmp	r2, #0
 801a1f8:	d042      	beq.n	801a280 <fn_08019E08+0x478>
 801a1fa:	4a2c      	ldr	r2, [pc, #176]	@ (801a2ac <fn_08019E08+0x4a4>)
 801a1fc:	589a      	ldr	r2, [r3, r2]
 801a1fe:	2a00      	cmp	r2, #0
 801a200:	d041      	beq.n	801a286 <fn_08019E08+0x47e>
 801a202:	4a2b      	ldr	r2, [pc, #172]	@ (801a2b0 <fn_08019E08+0x4a8>)
 801a204:	589a      	ldr	r2, [r3, r2]
 801a206:	2a00      	cmp	r2, #0
 801a208:	d000      	beq.n	801a20c <fn_08019E08+0x404>
 801a20a:	e6ee      	b.n	8019fea <fn_08019E08+0x1e2>
 801a20c:	2107      	movs	r1, #7
 801a20e:	220e      	movs	r2, #14
 801a210:	e729      	b.n	801a066 <fn_08019E08+0x25e>
 801a212:	4a28      	ldr	r2, [pc, #160]	@ (801a2b4 <fn_08019E08+0x4ac>)
 801a214:	5e9a      	ldrsh	r2, [r3, r2]
 801a216:	4296      	cmp	r6, r2
 801a218:	d000      	beq.n	801a21c <fn_08019E08+0x414>
 801a21a:	e652      	b.n	8019ec2 <fn_08019E08+0xba>
 801a21c:	2100      	movs	r1, #0
 801a21e:	e752      	b.n	801a0c6 <fn_08019E08+0x2be>
 801a220:	4a1a      	ldr	r2, [pc, #104]	@ (801a28c <fn_08019E08+0x484>)
 801a222:	5e9a      	ldrsh	r2, [r3, r2]
 801a224:	4296      	cmp	r6, r2
 801a226:	d000      	beq.n	801a22a <fn_08019E08+0x422>
 801a228:	e654      	b.n	8019ed4 <fn_08019E08+0xcc>
 801a22a:	2101      	movs	r1, #1
 801a22c:	e74b      	b.n	801a0c6 <fn_08019E08+0x2be>
 801a22e:	4a22      	ldr	r2, [pc, #136]	@ (801a2b8 <fn_08019E08+0x4b0>)
 801a230:	5e9a      	ldrsh	r2, [r3, r2]
 801a232:	4296      	cmp	r6, r2
 801a234:	d000      	beq.n	801a238 <fn_08019E08+0x430>
 801a236:	e6ba      	b.n	8019fae <fn_08019E08+0x1a6>
 801a238:	2104      	movs	r1, #4
 801a23a:	e70c      	b.n	801a056 <fn_08019E08+0x24e>
 801a23c:	4a1f      	ldr	r2, [pc, #124]	@ (801a2bc <fn_08019E08+0x4b4>)
 801a23e:	5e9a      	ldrsh	r2, [r3, r2]
 801a240:	4296      	cmp	r6, r2
 801a242:	d000      	beq.n	801a246 <fn_08019E08+0x43e>
 801a244:	e6bd      	b.n	8019fc2 <fn_08019E08+0x1ba>
 801a246:	2105      	movs	r1, #5
 801a248:	e705      	b.n	801a056 <fn_08019E08+0x24e>
 801a24a:	4a1d      	ldr	r2, [pc, #116]	@ (801a2c0 <fn_08019E08+0x4b8>)
 801a24c:	5e9a      	ldrsh	r2, [r3, r2]
 801a24e:	4296      	cmp	r6, r2
 801a250:	d000      	beq.n	801a254 <fn_08019E08+0x44c>
 801a252:	e6c0      	b.n	8019fd6 <fn_08019E08+0x1ce>
 801a254:	2106      	movs	r1, #6
 801a256:	e6fe      	b.n	801a056 <fn_08019E08+0x24e>
 801a258:	4a1a      	ldr	r2, [pc, #104]	@ (801a2c4 <fn_08019E08+0x4bc>)
 801a25a:	5e9a      	ldrsh	r2, [r3, r2]
 801a25c:	42b2      	cmp	r2, r6
 801a25e:	d000      	beq.n	801a262 <fn_08019E08+0x45a>
 801a260:	e6c3      	b.n	8019fea <fn_08019E08+0x1e2>
 801a262:	e6f7      	b.n	801a054 <fn_08019E08+0x24c>
 801a264:	2100      	movs	r1, #0
 801a266:	e6fe      	b.n	801a066 <fn_08019E08+0x25e>
 801a268:	2101      	movs	r1, #1
 801a26a:	2202      	movs	r2, #2
 801a26c:	e6fb      	b.n	801a066 <fn_08019E08+0x25e>
 801a26e:	2102      	movs	r1, #2
 801a270:	2204      	movs	r2, #4
 801a272:	e6f8      	b.n	801a066 <fn_08019E08+0x25e>
 801a274:	2103      	movs	r1, #3
 801a276:	2206      	movs	r2, #6
 801a278:	e6f5      	b.n	801a066 <fn_08019E08+0x25e>
 801a27a:	2104      	movs	r1, #4
 801a27c:	2208      	movs	r2, #8
 801a27e:	e6f2      	b.n	801a066 <fn_08019E08+0x25e>
 801a280:	2105      	movs	r1, #5
 801a282:	220a      	movs	r2, #10
 801a284:	e6ef      	b.n	801a066 <fn_08019E08+0x25e>
 801a286:	2106      	movs	r1, #6
 801a288:	220c      	movs	r2, #12
 801a28a:	e6ec      	b.n	801a066 <fn_08019E08+0x25e>
 801a28c:	000055e4 	.word	0x000055e4
 801a290:	000055f0 	.word	0x000055f0
 801a294:	000055fc 	.word	0x000055fc
 801a298:	030064c4 	.word	0x030064c4	@ data_030064C4
 801a29c:	000055dc 	.word	0x000055dc
 801a2a0:	000055e8 	.word	0x000055e8
 801a2a4:	000055f4 	.word	0x000055f4
 801a2a8:	0000560c 	.word	0x0000560c
 801a2ac:	00005618 	.word	0x00005618
 801a2b0:	00005624 	.word	0x00005624
 801a2b4:	000055d8 	.word	0x000055d8
 801a2b8:	00005608 	.word	0x00005608
 801a2bc:	00005614 	.word	0x00005614
 801a2c0:	00005620 	.word	0x00005620
 801a2c4:	0000562c 	.word	0x0000562c
