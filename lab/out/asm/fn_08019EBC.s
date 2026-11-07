fn_08019EBC:
 8019ebc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8019ebe:	46d6      	mov	lr, sl
 8019ec0:	464f      	mov	r7, r9
 8019ec2:	4646      	mov	r6, r8
 8019ec4:	2380      	movs	r3, #128	@ 0x80
 8019ec6:	b5c0      	push	{r6, r7, lr}
 8019ec8:	b086      	sub	sp, #24
 8019eca:	9305      	str	r3, [sp, #20]
 8019ecc:	4bc4      	ldr	r3, [pc, #784]	@ (801a1e0 <fn_08019EBC+0x324>)
 8019ece:	781b      	ldrb	r3, [r3, #0]
 8019ed0:	0005      	movs	r5, r0
 8019ed2:	000c      	movs	r4, r1
 8019ed4:	9203      	str	r2, [sp, #12]
 8019ed6:	2b00      	cmp	r3, #0
 8019ed8:	d000      	beq.n	8019edc <fn_08019EBC+0x20>
 8019eda:	e133      	b.n	801a144 <fn_08019EBC+0x288>
 8019edc:	2380      	movs	r3, #128	@ 0x80
 8019ede:	000e      	movs	r6, r1
 8019ee0:	021b      	lsls	r3, r3, #8
 8019ee2:	401e      	ands	r6, r3
 8019ee4:	4219      	tst	r1, r3
 8019ee6:	d100      	bne.n	8019eea <fn_08019EBC+0x2e>
 8019ee8:	e134      	b.n	801a154 <fn_08019EBC+0x298>
 8019eea:	2301      	movs	r3, #1
 8019eec:	2601      	movs	r6, #1
 8019eee:	469a      	mov	sl, r3
 8019ef0:	4bbc      	ldr	r3, [pc, #752]	@ (801a1e4 <fn_08019EBC+0x328>)
 8019ef2:	401c      	ands	r4, r3
 8019ef4:	1e63      	subs	r3, r4, #1
 8019ef6:	2b6c      	cmp	r3, #108	@ 0x6c
 8019ef8:	d903      	bls.n	8019f02 <fn_08019EBC+0x46>
 8019efa:	0021      	movs	r1, r4
 8019efc:	48ba      	ldr	r0, [pc, #744]	@ (801a1e8 <fn_08019EBC+0x32c>)
 8019efe:	f7e6 fb53 	bl	80005a8 <fn_080005A8>
 8019f02:	00a3      	lsls	r3, r4, #2
 8019f04:	4ab9      	ldr	r2, [pc, #740]	@ (801a1ec <fn_08019EBC+0x330>)
 8019f06:	4699      	mov	r9, r3
 8019f08:	191b      	adds	r3, r3, r4
 8019f0a:	009b      	lsls	r3, r3, #2
 8019f0c:	18d3      	adds	r3, r2, r3
 8019f0e:	4690      	mov	r8, r2
 8019f10:	68da      	ldr	r2, [r3, #12]
 8019f12:	2a00      	cmp	r2, #0
 8019f14:	d100      	bne.n	8019f18 <fn_08019EBC+0x5c>
 8019f16:	e1b0      	b.n	801a27a <fn_08019EBC+0x3be>
 8019f18:	691a      	ldr	r2, [r3, #16]
 8019f1a:	9b03      	ldr	r3, [sp, #12]
 8019f1c:	18d2      	adds	r2, r2, r3
 8019f1e:	9203      	str	r2, [sp, #12]
 8019f20:	2a00      	cmp	r2, #0
 8019f22:	dc00      	bgt.n	8019f26 <fn_08019EBC+0x6a>
 8019f24:	e10e      	b.n	801a144 <fn_08019EBC+0x288>
 8019f26:	4fb2      	ldr	r7, [pc, #712]	@ (801a1f0 <fn_08019EBC+0x334>)
 8019f28:	49b2      	ldr	r1, [pc, #712]	@ (801a1f4 <fn_08019EBC+0x338>)
 8019f2a:	683b      	ldr	r3, [r7, #0]
 8019f2c:	5859      	ldr	r1, [r3, r1]
 8019f2e:	428a      	cmp	r2, r1
 8019f30:	dd00      	ble.n	8019f34 <fn_08019EBC+0x78>
 8019f32:	e11a      	b.n	801a16a <fn_08019EBC+0x2ae>
 8019f34:	2d00      	cmp	r5, #0
 8019f36:	d012      	beq.n	8019f5e <fn_08019EBC+0xa2>
 8019f38:	22e0      	movs	r2, #224	@ 0xe0
 8019f3a:	5898      	ldr	r0, [r3, r2]
 8019f3c:	42a8      	cmp	r0, r5
 8019f3e:	d00e      	beq.n	8019f5e <fn_08019EBC+0xa2>
 8019f40:	2800      	cmp	r0, #0
 8019f42:	d100      	bne.n	8019f46 <fn_08019EBC+0x8a>
 8019f44:	e0fe      	b.n	801a144 <fn_08019EBC+0x288>
 8019f46:	ab05      	add	r3, sp, #20
 8019f48:	692a      	ldr	r2, [r5, #16]
 8019f4a:	68e9      	ldr	r1, [r5, #12]
 8019f4c:	9300      	str	r3, [sp, #0]
 8019f4e:	ab03      	add	r3, sp, #12
 8019f50:	f7ff fea8 	bl	8019ca4 <fn_08019CA4>
 8019f54:	2800      	cmp	r0, #0
 8019f56:	d100      	bne.n	8019f5a <fn_08019EBC+0x9e>
 8019f58:	e0f4      	b.n	801a144 <fn_08019EBC+0x288>
 8019f5a:	683b      	ldr	r3, [r7, #0]
 8019f5c:	e002      	b.n	8019f64 <fn_08019EBC+0xa8>
 8019f5e:	9a03      	ldr	r2, [sp, #12]
 8019f60:	00d2      	lsls	r2, r2, #3
 8019f62:	9203      	str	r2, [sp, #12]
 8019f64:	4aa4      	ldr	r2, [pc, #656]	@ (801a1f8 <fn_08019EBC+0x33c>)
 8019f66:	589a      	ldr	r2, [r3, r2]
 8019f68:	2a00      	cmp	r2, #0
 8019f6a:	d004      	beq.n	8019f76 <fn_08019EBC+0xba>
 8019f6c:	4aa3      	ldr	r2, [pc, #652]	@ (801a1fc <fn_08019EBC+0x340>)
 8019f6e:	589a      	ldr	r2, [r3, r2]
 8019f70:	4295      	cmp	r5, r2
 8019f72:	d100      	bne.n	8019f76 <fn_08019EBC+0xba>
 8019f74:	e1a7      	b.n	801a2c6 <fn_08019EBC+0x40a>
 8019f76:	4aa2      	ldr	r2, [pc, #648]	@ (801a200 <fn_08019EBC+0x344>)
 8019f78:	589a      	ldr	r2, [r3, r2]
 8019f7a:	2a00      	cmp	r2, #0
 8019f7c:	d004      	beq.n	8019f88 <fn_08019EBC+0xcc>
 8019f7e:	4aa1      	ldr	r2, [pc, #644]	@ (801a204 <fn_08019EBC+0x348>)
 8019f80:	589a      	ldr	r2, [r3, r2]
 8019f82:	4295      	cmp	r5, r2
 8019f84:	d100      	bne.n	8019f88 <fn_08019EBC+0xcc>
 8019f86:	e1a5      	b.n	801a2d4 <fn_08019EBC+0x418>
 8019f88:	4a9f      	ldr	r2, [pc, #636]	@ (801a208 <fn_08019EBC+0x34c>)
 8019f8a:	589a      	ldr	r2, [r3, r2]
 8019f8c:	2a00      	cmp	r2, #0
 8019f8e:	d004      	beq.n	8019f9a <fn_08019EBC+0xde>
 8019f90:	4a9e      	ldr	r2, [pc, #632]	@ (801a20c <fn_08019EBC+0x350>)
 8019f92:	589a      	ldr	r2, [r3, r2]
 8019f94:	4295      	cmp	r5, r2
 8019f96:	d100      	bne.n	8019f9a <fn_08019EBC+0xde>
 8019f98:	e0e9      	b.n	801a16e <fn_08019EBC+0x2b2>
 8019f9a:	4a9d      	ldr	r2, [pc, #628]	@ (801a210 <fn_08019EBC+0x354>)
 8019f9c:	589a      	ldr	r2, [r3, r2]
 8019f9e:	2a00      	cmp	r2, #0
 8019fa0:	d004      	beq.n	8019fac <fn_08019EBC+0xf0>
 8019fa2:	4a9c      	ldr	r2, [pc, #624]	@ (801a214 <fn_08019EBC+0x358>)
 8019fa4:	589a      	ldr	r2, [r3, r2]
 8019fa6:	4295      	cmp	r5, r2
 8019fa8:	d100      	bne.n	8019fac <fn_08019EBC+0xf0>
 8019faa:	e0ef      	b.n	801a18c <fn_08019EBC+0x2d0>
 8019fac:	22ac      	movs	r2, #172	@ 0xac
 8019fae:	01d2      	lsls	r2, r2, #7
 8019fb0:	589a      	ldr	r2, [r3, r2]
 8019fb2:	2a00      	cmp	r2, #0
 8019fb4:	d004      	beq.n	8019fc0 <fn_08019EBC+0x104>
 8019fb6:	4a98      	ldr	r2, [pc, #608]	@ (801a218 <fn_08019EBC+0x35c>)
 8019fb8:	589a      	ldr	r2, [r3, r2]
 8019fba:	4295      	cmp	r5, r2
 8019fbc:	d100      	bne.n	8019fc0 <fn_08019EBC+0x104>
 8019fbe:	e0ec      	b.n	801a19a <fn_08019EBC+0x2de>
 8019fc0:	4a96      	ldr	r2, [pc, #600]	@ (801a21c <fn_08019EBC+0x360>)
 8019fc2:	589a      	ldr	r2, [r3, r2]
 8019fc4:	2a00      	cmp	r2, #0
 8019fc6:	d004      	beq.n	8019fd2 <fn_08019EBC+0x116>
 8019fc8:	4a95      	ldr	r2, [pc, #596]	@ (801a220 <fn_08019EBC+0x364>)
 8019fca:	589a      	ldr	r2, [r3, r2]
 8019fcc:	4295      	cmp	r5, r2
 8019fce:	d100      	bne.n	8019fd2 <fn_08019EBC+0x116>
 8019fd0:	e0ea      	b.n	801a1a8 <fn_08019EBC+0x2ec>
 8019fd2:	4a94      	ldr	r2, [pc, #592]	@ (801a224 <fn_08019EBC+0x368>)
 8019fd4:	589a      	ldr	r2, [r3, r2]
 8019fd6:	2a00      	cmp	r2, #0
 8019fd8:	d004      	beq.n	8019fe4 <fn_08019EBC+0x128>
 8019fda:	4a93      	ldr	r2, [pc, #588]	@ (801a228 <fn_08019EBC+0x36c>)
 8019fdc:	589a      	ldr	r2, [r3, r2]
 8019fde:	4295      	cmp	r5, r2
 8019fe0:	d100      	bne.n	8019fe4 <fn_08019EBC+0x128>
 8019fe2:	e0e8      	b.n	801a1b6 <fn_08019EBC+0x2fa>
 8019fe4:	4a91      	ldr	r2, [pc, #580]	@ (801a22c <fn_08019EBC+0x370>)
 8019fe6:	589a      	ldr	r2, [r3, r2]
 8019fe8:	2a00      	cmp	r2, #0
 8019fea:	d004      	beq.n	8019ff6 <fn_08019EBC+0x13a>
 8019fec:	4a90      	ldr	r2, [pc, #576]	@ (801a230 <fn_08019EBC+0x374>)
 8019fee:	589a      	ldr	r2, [r3, r2]
 8019ff0:	42aa      	cmp	r2, r5
 8019ff2:	d100      	bne.n	8019ff6 <fn_08019EBC+0x13a>
 8019ff4:	e0e6      	b.n	801a1c4 <fn_08019EBC+0x308>
 8019ff6:	4a80      	ldr	r2, [pc, #512]	@ (801a1f8 <fn_08019EBC+0x33c>)
 8019ff8:	589a      	ldr	r2, [r3, r2]
 8019ffa:	2d00      	cmp	r5, #0
 8019ffc:	d100      	bne.n	801a000 <fn_08019EBC+0x144>
 8019ffe:	e13f      	b.n	801a280 <fn_08019EBC+0x3c4>
 801a000:	2a00      	cmp	r2, #0
 801a002:	d100      	bne.n	801a006 <fn_08019EBC+0x14a>
 801a004:	e188      	b.n	801a318 <fn_08019EBC+0x45c>
 801a006:	4a7d      	ldr	r2, [pc, #500]	@ (801a1fc <fn_08019EBC+0x340>)
 801a008:	589a      	ldr	r2, [r3, r2]
 801a00a:	4295      	cmp	r5, r2
 801a00c:	d100      	bne.n	801a010 <fn_08019EBC+0x154>
 801a00e:	e0e0      	b.n	801a1d2 <fn_08019EBC+0x316>
 801a010:	4a7b      	ldr	r2, [pc, #492]	@ (801a200 <fn_08019EBC+0x344>)
 801a012:	589a      	ldr	r2, [r3, r2]
 801a014:	2a00      	cmp	r2, #0
 801a016:	d100      	bne.n	801a01a <fn_08019EBC+0x15e>
 801a018:	e180      	b.n	801a31c <fn_08019EBC+0x460>
 801a01a:	4a7a      	ldr	r2, [pc, #488]	@ (801a204 <fn_08019EBC+0x348>)
 801a01c:	589a      	ldr	r2, [r3, r2]
 801a01e:	4295      	cmp	r5, r2
 801a020:	d100      	bne.n	801a024 <fn_08019EBC+0x168>
 801a022:	e115      	b.n	801a250 <fn_08019EBC+0x394>
 801a024:	4a78      	ldr	r2, [pc, #480]	@ (801a208 <fn_08019EBC+0x34c>)
 801a026:	589a      	ldr	r2, [r3, r2]
 801a028:	2a00      	cmp	r2, #0
 801a02a:	d100      	bne.n	801a02e <fn_08019EBC+0x172>
 801a02c:	e179      	b.n	801a322 <fn_08019EBC+0x466>
 801a02e:	4a77      	ldr	r2, [pc, #476]	@ (801a20c <fn_08019EBC+0x350>)
 801a030:	589a      	ldr	r2, [r3, r2]
 801a032:	4295      	cmp	r5, r2
 801a034:	d100      	bne.n	801a038 <fn_08019EBC+0x17c>
 801a036:	e112      	b.n	801a25e <fn_08019EBC+0x3a2>
 801a038:	4a75      	ldr	r2, [pc, #468]	@ (801a210 <fn_08019EBC+0x354>)
 801a03a:	589a      	ldr	r2, [r3, r2]
 801a03c:	2a00      	cmp	r2, #0
 801a03e:	d100      	bne.n	801a042 <fn_08019EBC+0x186>
 801a040:	e172      	b.n	801a328 <fn_08019EBC+0x46c>
 801a042:	4a74      	ldr	r2, [pc, #464]	@ (801a214 <fn_08019EBC+0x358>)
 801a044:	589a      	ldr	r2, [r3, r2]
 801a046:	4295      	cmp	r5, r2
 801a048:	d100      	bne.n	801a04c <fn_08019EBC+0x190>
 801a04a:	e10f      	b.n	801a26c <fn_08019EBC+0x3b0>
 801a04c:	22ac      	movs	r2, #172	@ 0xac
 801a04e:	01d2      	lsls	r2, r2, #7
 801a050:	589a      	ldr	r2, [r3, r2]
 801a052:	2a00      	cmp	r2, #0
 801a054:	d100      	bne.n	801a058 <fn_08019EBC+0x19c>
 801a056:	e16a      	b.n	801a32e <fn_08019EBC+0x472>
 801a058:	4a6f      	ldr	r2, [pc, #444]	@ (801a218 <fn_08019EBC+0x35c>)
 801a05a:	589a      	ldr	r2, [r3, r2]
 801a05c:	4295      	cmp	r5, r2
 801a05e:	d100      	bne.n	801a062 <fn_08019EBC+0x1a6>
 801a060:	e13f      	b.n	801a2e2 <fn_08019EBC+0x426>
 801a062:	4a6e      	ldr	r2, [pc, #440]	@ (801a21c <fn_08019EBC+0x360>)
 801a064:	589a      	ldr	r2, [r3, r2]
 801a066:	2a00      	cmp	r2, #0
 801a068:	d100      	bne.n	801a06c <fn_08019EBC+0x1b0>
 801a06a:	e163      	b.n	801a334 <fn_08019EBC+0x478>
 801a06c:	4a6c      	ldr	r2, [pc, #432]	@ (801a220 <fn_08019EBC+0x364>)
 801a06e:	589a      	ldr	r2, [r3, r2]
 801a070:	4295      	cmp	r5, r2
 801a072:	d100      	bne.n	801a076 <fn_08019EBC+0x1ba>
 801a074:	e13c      	b.n	801a2f0 <fn_08019EBC+0x434>
 801a076:	4a6b      	ldr	r2, [pc, #428]	@ (801a224 <fn_08019EBC+0x368>)
 801a078:	589a      	ldr	r2, [r3, r2]
 801a07a:	2a00      	cmp	r2, #0
 801a07c:	d100      	bne.n	801a080 <fn_08019EBC+0x1c4>
 801a07e:	e15c      	b.n	801a33a <fn_08019EBC+0x47e>
 801a080:	4a69      	ldr	r2, [pc, #420]	@ (801a228 <fn_08019EBC+0x36c>)
 801a082:	589a      	ldr	r2, [r3, r2]
 801a084:	4295      	cmp	r5, r2
 801a086:	d100      	bne.n	801a08a <fn_08019EBC+0x1ce>
 801a088:	e139      	b.n	801a2fe <fn_08019EBC+0x442>
 801a08a:	4a68      	ldr	r2, [pc, #416]	@ (801a22c <fn_08019EBC+0x370>)
 801a08c:	589a      	ldr	r2, [r3, r2]
 801a08e:	2a00      	cmp	r2, #0
 801a090:	d100      	bne.n	801a094 <fn_08019EBC+0x1d8>
 801a092:	e115      	b.n	801a2c0 <fn_08019EBC+0x404>
 801a094:	4a66      	ldr	r2, [pc, #408]	@ (801a230 <fn_08019EBC+0x374>)
 801a096:	589a      	ldr	r2, [r3, r2]
 801a098:	4295      	cmp	r5, r2
 801a09a:	d100      	bne.n	801a09e <fn_08019EBC+0x1e2>
 801a09c:	e136      	b.n	801a30c <fn_08019EBC+0x450>
 801a09e:	464a      	mov	r2, r9
 801a0a0:	4955      	ldr	r1, [pc, #340]	@ (801a1f8 <fn_08019EBC+0x33c>)
 801a0a2:	1912      	adds	r2, r2, r4
 801a0a4:	5859      	ldr	r1, [r3, r1]
 801a0a6:	0092      	lsls	r2, r2, #2
 801a0a8:	4442      	add	r2, r8
 801a0aa:	6892      	ldr	r2, [r2, #8]
 801a0ac:	6889      	ldr	r1, [r1, #8]
 801a0ae:	428a      	cmp	r2, r1
 801a0b0:	dc00      	bgt.n	801a0b4 <fn_08019EBC+0x1f8>
 801a0b2:	e093      	b.n	801a1dc <fn_08019EBC+0x320>
 801a0b4:	4952      	ldr	r1, [pc, #328]	@ (801a200 <fn_08019EBC+0x344>)
 801a0b6:	5859      	ldr	r1, [r3, r1]
 801a0b8:	6889      	ldr	r1, [r1, #8]
 801a0ba:	4291      	cmp	r1, r2
 801a0bc:	db00      	blt.n	801a0c0 <fn_08019EBC+0x204>
 801a0be:	e0cc      	b.n	801a25a <fn_08019EBC+0x39e>
 801a0c0:	4951      	ldr	r1, [pc, #324]	@ (801a208 <fn_08019EBC+0x34c>)
 801a0c2:	5859      	ldr	r1, [r3, r1]
 801a0c4:	6889      	ldr	r1, [r1, #8]
 801a0c6:	428a      	cmp	r2, r1
 801a0c8:	dc00      	bgt.n	801a0cc <fn_08019EBC+0x210>
 801a0ca:	e0cd      	b.n	801a268 <fn_08019EBC+0x3ac>
 801a0cc:	4950      	ldr	r1, [pc, #320]	@ (801a210 <fn_08019EBC+0x354>)
 801a0ce:	5859      	ldr	r1, [r3, r1]
 801a0d0:	6889      	ldr	r1, [r1, #8]
 801a0d2:	428a      	cmp	r2, r1
 801a0d4:	dc00      	bgt.n	801a0d8 <fn_08019EBC+0x21c>
 801a0d6:	e0ce      	b.n	801a276 <fn_08019EBC+0x3ba>
 801a0d8:	21ac      	movs	r1, #172	@ 0xac
 801a0da:	01c9      	lsls	r1, r1, #7
 801a0dc:	5859      	ldr	r1, [r3, r1]
 801a0de:	6889      	ldr	r1, [r1, #8]
 801a0e0:	428a      	cmp	r2, r1
 801a0e2:	dc00      	bgt.n	801a0e6 <fn_08019EBC+0x22a>
 801a0e4:	e102      	b.n	801a2ec <fn_08019EBC+0x430>
 801a0e6:	494d      	ldr	r1, [pc, #308]	@ (801a21c <fn_08019EBC+0x360>)
 801a0e8:	5859      	ldr	r1, [r3, r1]
 801a0ea:	6889      	ldr	r1, [r1, #8]
 801a0ec:	428a      	cmp	r2, r1
 801a0ee:	dc00      	bgt.n	801a0f2 <fn_08019EBC+0x236>
 801a0f0:	e103      	b.n	801a2fa <fn_08019EBC+0x43e>
 801a0f2:	494c      	ldr	r1, [pc, #304]	@ (801a224 <fn_08019EBC+0x368>)
 801a0f4:	5859      	ldr	r1, [r3, r1]
 801a0f6:	6889      	ldr	r1, [r1, #8]
 801a0f8:	428a      	cmp	r2, r1
 801a0fa:	dc00      	bgt.n	801a0fe <fn_08019EBC+0x242>
 801a0fc:	e104      	b.n	801a308 <fn_08019EBC+0x44c>
 801a0fe:	494b      	ldr	r1, [pc, #300]	@ (801a22c <fn_08019EBC+0x370>)
 801a100:	5859      	ldr	r1, [r3, r1]
 801a102:	6889      	ldr	r1, [r1, #8]
 801a104:	4291      	cmp	r1, r2
 801a106:	db1d      	blt.n	801a144 <fn_08019EBC+0x288>
 801a108:	2107      	movs	r1, #7
 801a10a:	004a      	lsls	r2, r1, #1
 801a10c:	1850      	adds	r0, r2, r1
 801a10e:	4e3a      	ldr	r6, [pc, #232]	@ (801a1f8 <fn_08019EBC+0x33c>)
 801a110:	0080      	lsls	r0, r0, #2
 801a112:	1818      	adds	r0, r3, r0
 801a114:	1980      	adds	r0, r0, r6
 801a116:	2600      	movs	r6, #0
 801a118:	6006      	str	r6, [r0, #0]
 801a11a:	1852      	adds	r2, r2, r1
 801a11c:	0092      	lsls	r2, r2, #2
 801a11e:	189b      	adds	r3, r3, r2
 801a120:	4a35      	ldr	r2, [pc, #212]	@ (801a1f8 <fn_08019EBC+0x33c>)
 801a122:	1898      	adds	r0, r3, r2
 801a124:	464a      	mov	r2, r9
 801a126:	1912      	adds	r2, r2, r4
 801a128:	0092      	lsls	r2, r2, #2
 801a12a:	4442      	add	r2, r8
 801a12c:	6002      	str	r2, [r0, #0]
 801a12e:	4a33      	ldr	r2, [pc, #204]	@ (801a1fc <fn_08019EBC+0x340>)
 801a130:	509d      	str	r5, [r3, r2]
 801a132:	4a40      	ldr	r2, [pc, #256]	@ (801a234 <fn_08019EBC+0x378>)
 801a134:	189b      	adds	r3, r3, r2
 801a136:	4652      	mov	r2, sl
 801a138:	0020      	movs	r0, r4
 801a13a:	801a      	strh	r2, [r3, #0]
 801a13c:	9b05      	ldr	r3, [sp, #20]
 801a13e:	9a03      	ldr	r2, [sp, #12]
 801a140:	f7ea fe04 	bl	8004d4c <fn_08004D4C>
 801a144:	b006      	add	sp, #24
 801a146:	bce0      	pop	{r5, r6, r7}
 801a148:	46ba      	mov	sl, r7
 801a14a:	46b1      	mov	r9, r6
 801a14c:	46a8      	mov	r8, r5
 801a14e:	bcf0      	pop	{r4, r5, r6, r7}
 801a150:	bc01      	pop	{r0}
 801a152:	4700      	bx	r0
 801a154:	2922      	cmp	r1, #34	@ 0x22
 801a156:	d004      	beq.n	801a162 <fn_08019EBC+0x2a6>
 801a158:	2300      	movs	r3, #0
 801a15a:	469a      	mov	sl, r3
 801a15c:	2951      	cmp	r1, #81	@ 0x51
 801a15e:	d000      	beq.n	801a162 <fn_08019EBC+0x2a6>
 801a160:	e6c6      	b.n	8019ef0 <fn_08019EBC+0x34>
 801a162:	2301      	movs	r3, #1
 801a164:	2601      	movs	r6, #1
 801a166:	469a      	mov	sl, r3
 801a168:	e6cb      	b.n	8019f02 <fn_08019EBC+0x46>
 801a16a:	9103      	str	r1, [sp, #12]
 801a16c:	e6e2      	b.n	8019f34 <fn_08019EBC+0x78>
 801a16e:	4a32      	ldr	r2, [pc, #200]	@ (801a238 <fn_08019EBC+0x37c>)
 801a170:	5e9a      	ldrsh	r2, [r3, r2]
 801a172:	4296      	cmp	r6, r2
 801a174:	d000      	beq.n	801a178 <fn_08019EBC+0x2bc>
 801a176:	e710      	b.n	8019f9a <fn_08019EBC+0xde>
 801a178:	2102      	movs	r1, #2
 801a17a:	004a      	lsls	r2, r1, #1
 801a17c:	1852      	adds	r2, r2, r1
 801a17e:	0092      	lsls	r2, r2, #2
 801a180:	491d      	ldr	r1, [pc, #116]	@ (801a1f8 <fn_08019EBC+0x33c>)
 801a182:	189a      	adds	r2, r3, r2
 801a184:	1852      	adds	r2, r2, r1
 801a186:	2100      	movs	r1, #0
 801a188:	6011      	str	r1, [r2, #0]
 801a18a:	e734      	b.n	8019ff6 <fn_08019EBC+0x13a>
 801a18c:	4a2b      	ldr	r2, [pc, #172]	@ (801a23c <fn_08019EBC+0x380>)
 801a18e:	5e9a      	ldrsh	r2, [r3, r2]
 801a190:	4296      	cmp	r6, r2
 801a192:	d000      	beq.n	801a196 <fn_08019EBC+0x2da>
 801a194:	e70a      	b.n	8019fac <fn_08019EBC+0xf0>
 801a196:	2103      	movs	r1, #3
 801a198:	e7ef      	b.n	801a17a <fn_08019EBC+0x2be>
 801a19a:	4a29      	ldr	r2, [pc, #164]	@ (801a240 <fn_08019EBC+0x384>)
 801a19c:	5e9a      	ldrsh	r2, [r3, r2]
 801a19e:	4296      	cmp	r6, r2
 801a1a0:	d000      	beq.n	801a1a4 <fn_08019EBC+0x2e8>
 801a1a2:	e70d      	b.n	8019fc0 <fn_08019EBC+0x104>
 801a1a4:	2104      	movs	r1, #4
 801a1a6:	e7e8      	b.n	801a17a <fn_08019EBC+0x2be>
 801a1a8:	4a26      	ldr	r2, [pc, #152]	@ (801a244 <fn_08019EBC+0x388>)
 801a1aa:	5e9a      	ldrsh	r2, [r3, r2]
 801a1ac:	4296      	cmp	r6, r2
 801a1ae:	d000      	beq.n	801a1b2 <fn_08019EBC+0x2f6>
 801a1b0:	e70f      	b.n	8019fd2 <fn_08019EBC+0x116>
 801a1b2:	2105      	movs	r1, #5
 801a1b4:	e7e1      	b.n	801a17a <fn_08019EBC+0x2be>
 801a1b6:	4a24      	ldr	r2, [pc, #144]	@ (801a248 <fn_08019EBC+0x38c>)
 801a1b8:	5e9a      	ldrsh	r2, [r3, r2]
 801a1ba:	4296      	cmp	r6, r2
 801a1bc:	d000      	beq.n	801a1c0 <fn_08019EBC+0x304>
 801a1be:	e711      	b.n	8019fe4 <fn_08019EBC+0x128>
 801a1c0:	2106      	movs	r1, #6
 801a1c2:	e7da      	b.n	801a17a <fn_08019EBC+0x2be>
 801a1c4:	4a21      	ldr	r2, [pc, #132]	@ (801a24c <fn_08019EBC+0x390>)
 801a1c6:	5e9a      	ldrsh	r2, [r3, r2]
 801a1c8:	2107      	movs	r1, #7
 801a1ca:	42b2      	cmp	r2, r6
 801a1cc:	d000      	beq.n	801a1d0 <fn_08019EBC+0x314>
 801a1ce:	e712      	b.n	8019ff6 <fn_08019EBC+0x13a>
 801a1d0:	e7d3      	b.n	801a17a <fn_08019EBC+0x2be>
 801a1d2:	4a18      	ldr	r2, [pc, #96]	@ (801a234 <fn_08019EBC+0x378>)
 801a1d4:	5e9a      	ldrsh	r2, [r3, r2]
 801a1d6:	4296      	cmp	r6, r2
 801a1d8:	d000      	beq.n	801a1dc <fn_08019EBC+0x320>
 801a1da:	e719      	b.n	801a010 <fn_08019EBC+0x154>
 801a1dc:	2100      	movs	r1, #0
 801a1de:	e794      	b.n	801a10a <fn_08019EBC+0x24e>
 801a1e0:	080258a6 	.word	0x080258a6
 801a1e4:	ffff7fff 	.word	0xffff7fff
 801a1e8:	0814a8e8 	.word	0x0814a8e8
 801a1ec:	0812f828 	.word	0x0812f828
 801a1f0:	030064c4 	.word	0x030064c4
 801a1f4:	00005630 	.word	0x00005630
 801a1f8:	000055d0 	.word	0x000055d0
 801a1fc:	000055d4 	.word	0x000055d4
 801a200:	000055dc 	.word	0x000055dc
 801a204:	000055e0 	.word	0x000055e0
 801a208:	000055e8 	.word	0x000055e8
 801a20c:	000055ec 	.word	0x000055ec
 801a210:	000055f4 	.word	0x000055f4
 801a214:	000055f8 	.word	0x000055f8
 801a218:	00005604 	.word	0x00005604
 801a21c:	0000560c 	.word	0x0000560c
 801a220:	00005610 	.word	0x00005610
 801a224:	00005618 	.word	0x00005618
 801a228:	0000561c 	.word	0x0000561c
 801a22c:	00005624 	.word	0x00005624
 801a230:	00005628 	.word	0x00005628
 801a234:	000055d8 	.word	0x000055d8
 801a238:	000055f0 	.word	0x000055f0
 801a23c:	000055fc 	.word	0x000055fc
 801a240:	00005608 	.word	0x00005608
 801a244:	00005614 	.word	0x00005614
 801a248:	00005620 	.word	0x00005620
 801a24c:	0000562c 	.word	0x0000562c
 801a250:	4a3b      	ldr	r2, [pc, #236]	@ (801a340 <fn_08019EBC+0x484>)
 801a252:	5e9a      	ldrsh	r2, [r3, r2]
 801a254:	4296      	cmp	r6, r2
 801a256:	d000      	beq.n	801a25a <fn_08019EBC+0x39e>
 801a258:	e6e4      	b.n	801a024 <fn_08019EBC+0x168>
 801a25a:	2101      	movs	r1, #1
 801a25c:	e755      	b.n	801a10a <fn_08019EBC+0x24e>
 801a25e:	4a39      	ldr	r2, [pc, #228]	@ (801a344 <fn_08019EBC+0x488>)
 801a260:	5e9a      	ldrsh	r2, [r3, r2]
 801a262:	4296      	cmp	r6, r2
 801a264:	d000      	beq.n	801a268 <fn_08019EBC+0x3ac>
 801a266:	e6e7      	b.n	801a038 <fn_08019EBC+0x17c>
 801a268:	2102      	movs	r1, #2
 801a26a:	e74e      	b.n	801a10a <fn_08019EBC+0x24e>
 801a26c:	4a36      	ldr	r2, [pc, #216]	@ (801a348 <fn_08019EBC+0x48c>)
 801a26e:	5e9a      	ldrsh	r2, [r3, r2]
 801a270:	4296      	cmp	r6, r2
 801a272:	d000      	beq.n	801a276 <fn_08019EBC+0x3ba>
 801a274:	e6ea      	b.n	801a04c <fn_08019EBC+0x190>
 801a276:	2103      	movs	r1, #3
 801a278:	e747      	b.n	801a10a <fn_08019EBC+0x24e>
 801a27a:	4f34      	ldr	r7, [pc, #208]	@ (801a34c <fn_08019EBC+0x490>)
 801a27c:	683b      	ldr	r3, [r7, #0]
 801a27e:	e659      	b.n	8019f34 <fn_08019EBC+0x78>
 801a280:	2a00      	cmp	r2, #0
 801a282:	d049      	beq.n	801a318 <fn_08019EBC+0x45c>
 801a284:	4a32      	ldr	r2, [pc, #200]	@ (801a350 <fn_08019EBC+0x494>)
 801a286:	589a      	ldr	r2, [r3, r2]
 801a288:	2a00      	cmp	r2, #0
 801a28a:	d047      	beq.n	801a31c <fn_08019EBC+0x460>
 801a28c:	4a31      	ldr	r2, [pc, #196]	@ (801a354 <fn_08019EBC+0x498>)
 801a28e:	589a      	ldr	r2, [r3, r2]
 801a290:	2a00      	cmp	r2, #0
 801a292:	d046      	beq.n	801a322 <fn_08019EBC+0x466>
 801a294:	4a30      	ldr	r2, [pc, #192]	@ (801a358 <fn_08019EBC+0x49c>)
 801a296:	589a      	ldr	r2, [r3, r2]
 801a298:	2a00      	cmp	r2, #0
 801a29a:	d045      	beq.n	801a328 <fn_08019EBC+0x46c>
 801a29c:	22ac      	movs	r2, #172	@ 0xac
 801a29e:	01d2      	lsls	r2, r2, #7
 801a2a0:	589a      	ldr	r2, [r3, r2]
 801a2a2:	2a00      	cmp	r2, #0
 801a2a4:	d043      	beq.n	801a32e <fn_08019EBC+0x472>
 801a2a6:	4a2d      	ldr	r2, [pc, #180]	@ (801a35c <fn_08019EBC+0x4a0>)
 801a2a8:	589a      	ldr	r2, [r3, r2]
 801a2aa:	2a00      	cmp	r2, #0
 801a2ac:	d042      	beq.n	801a334 <fn_08019EBC+0x478>
 801a2ae:	4a2c      	ldr	r2, [pc, #176]	@ (801a360 <fn_08019EBC+0x4a4>)
 801a2b0:	589a      	ldr	r2, [r3, r2]
 801a2b2:	2a00      	cmp	r2, #0
 801a2b4:	d041      	beq.n	801a33a <fn_08019EBC+0x47e>
 801a2b6:	4a2b      	ldr	r2, [pc, #172]	@ (801a364 <fn_08019EBC+0x4a8>)
 801a2b8:	589a      	ldr	r2, [r3, r2]
 801a2ba:	2a00      	cmp	r2, #0
 801a2bc:	d000      	beq.n	801a2c0 <fn_08019EBC+0x404>
 801a2be:	e6ee      	b.n	801a09e <fn_08019EBC+0x1e2>
 801a2c0:	2107      	movs	r1, #7
 801a2c2:	220e      	movs	r2, #14
 801a2c4:	e729      	b.n	801a11a <fn_08019EBC+0x25e>
 801a2c6:	4a28      	ldr	r2, [pc, #160]	@ (801a368 <fn_08019EBC+0x4ac>)
 801a2c8:	5e9a      	ldrsh	r2, [r3, r2]
 801a2ca:	4296      	cmp	r6, r2
 801a2cc:	d000      	beq.n	801a2d0 <fn_08019EBC+0x414>
 801a2ce:	e652      	b.n	8019f76 <fn_08019EBC+0xba>
 801a2d0:	2100      	movs	r1, #0
 801a2d2:	e752      	b.n	801a17a <fn_08019EBC+0x2be>
 801a2d4:	4a1a      	ldr	r2, [pc, #104]	@ (801a340 <fn_08019EBC+0x484>)
 801a2d6:	5e9a      	ldrsh	r2, [r3, r2]
 801a2d8:	4296      	cmp	r6, r2
 801a2da:	d000      	beq.n	801a2de <fn_08019EBC+0x422>
 801a2dc:	e654      	b.n	8019f88 <fn_08019EBC+0xcc>
 801a2de:	2101      	movs	r1, #1
 801a2e0:	e74b      	b.n	801a17a <fn_08019EBC+0x2be>
 801a2e2:	4a22      	ldr	r2, [pc, #136]	@ (801a36c <fn_08019EBC+0x4b0>)
 801a2e4:	5e9a      	ldrsh	r2, [r3, r2]
 801a2e6:	4296      	cmp	r6, r2
 801a2e8:	d000      	beq.n	801a2ec <fn_08019EBC+0x430>
 801a2ea:	e6ba      	b.n	801a062 <fn_08019EBC+0x1a6>
 801a2ec:	2104      	movs	r1, #4
 801a2ee:	e70c      	b.n	801a10a <fn_08019EBC+0x24e>
 801a2f0:	4a1f      	ldr	r2, [pc, #124]	@ (801a370 <fn_08019EBC+0x4b4>)
 801a2f2:	5e9a      	ldrsh	r2, [r3, r2]
 801a2f4:	4296      	cmp	r6, r2
 801a2f6:	d000      	beq.n	801a2fa <fn_08019EBC+0x43e>
 801a2f8:	e6bd      	b.n	801a076 <fn_08019EBC+0x1ba>
 801a2fa:	2105      	movs	r1, #5
 801a2fc:	e705      	b.n	801a10a <fn_08019EBC+0x24e>
 801a2fe:	4a1d      	ldr	r2, [pc, #116]	@ (801a374 <fn_08019EBC+0x4b8>)
 801a300:	5e9a      	ldrsh	r2, [r3, r2]
 801a302:	4296      	cmp	r6, r2
 801a304:	d000      	beq.n	801a308 <fn_08019EBC+0x44c>
 801a306:	e6c0      	b.n	801a08a <fn_08019EBC+0x1ce>
 801a308:	2106      	movs	r1, #6
 801a30a:	e6fe      	b.n	801a10a <fn_08019EBC+0x24e>
 801a30c:	4a1a      	ldr	r2, [pc, #104]	@ (801a378 <fn_08019EBC+0x4bc>)
 801a30e:	5e9a      	ldrsh	r2, [r3, r2]
 801a310:	42b2      	cmp	r2, r6
 801a312:	d000      	beq.n	801a316 <fn_08019EBC+0x45a>
 801a314:	e6c3      	b.n	801a09e <fn_08019EBC+0x1e2>
 801a316:	e6f7      	b.n	801a108 <fn_08019EBC+0x24c>
 801a318:	2100      	movs	r1, #0
 801a31a:	e6fe      	b.n	801a11a <fn_08019EBC+0x25e>
 801a31c:	2101      	movs	r1, #1
 801a31e:	2202      	movs	r2, #2
 801a320:	e6fb      	b.n	801a11a <fn_08019EBC+0x25e>
 801a322:	2102      	movs	r1, #2
 801a324:	2204      	movs	r2, #4
 801a326:	e6f8      	b.n	801a11a <fn_08019EBC+0x25e>
 801a328:	2103      	movs	r1, #3
 801a32a:	2206      	movs	r2, #6
 801a32c:	e6f5      	b.n	801a11a <fn_08019EBC+0x25e>
 801a32e:	2104      	movs	r1, #4
 801a330:	2208      	movs	r2, #8
 801a332:	e6f2      	b.n	801a11a <fn_08019EBC+0x25e>
 801a334:	2105      	movs	r1, #5
 801a336:	220a      	movs	r2, #10
 801a338:	e6ef      	b.n	801a11a <fn_08019EBC+0x25e>
 801a33a:	2106      	movs	r1, #6
 801a33c:	220c      	movs	r2, #12
 801a33e:	e6ec      	b.n	801a11a <fn_08019EBC+0x25e>
 801a340:	000055e4 	.word	0x000055e4
 801a344:	000055f0 	.word	0x000055f0
 801a348:	000055fc 	.word	0x000055fc
 801a34c:	030064c4 	.word	0x030064c4
 801a350:	000055dc 	.word	0x000055dc
 801a354:	000055e8 	.word	0x000055e8
 801a358:	000055f4 	.word	0x000055f4
 801a35c:	0000560c 	.word	0x0000560c
 801a360:	00005618 	.word	0x00005618
 801a364:	00005624 	.word	0x00005624
 801a368:	000055d8 	.word	0x000055d8
 801a36c:	00005608 	.word	0x00005608
 801a370:	00005614 	.word	0x00005614
 801a374:	00005620 	.word	0x00005620
 801a378:	0000562c 	.word	0x0000562c
