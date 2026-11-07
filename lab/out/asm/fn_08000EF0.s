fn_08000EF0:
 8000ef0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000ef2:	464f      	mov	r7, r9
 8000ef4:	4646      	mov	r6, r8
 8000ef6:	46d6      	mov	lr, sl
 8000ef8:	b5c0      	push	{r6, r7, lr}
 8000efa:	265c      	movs	r6, #92	@ 0x5c
 8000efc:	4b90      	ldr	r3, [pc, #576]	@ (8001140 <fn_08000EF0+0x250>)
 8000efe:	4699      	mov	r9, r3
 8000f00:	681b      	ldr	r3, [r3, #0]
 8000f02:	5d9a      	ldrb	r2, [r3, r6]
 8000f04:	2a00      	cmp	r2, #0
 8000f06:	d100      	bne.n	8000f0a <fn_08000EF0+0x1a>
 8000f08:	e10f      	b.n	800112a <fn_08000EF0+0x23a>
 8000f0a:	4a8e      	ldr	r2, [pc, #568]	@ (8001144 <fn_08000EF0+0x254>)
 8000f0c:	4692      	mov	sl, r2
 8000f0e:	225c      	movs	r2, #92	@ 0x5c
 8000f10:	2100      	movs	r1, #0
 8000f12:	5499      	strb	r1, [r3, r2]
 8000f14:	3280      	adds	r2, #128	@ 0x80
 8000f16:	6d59      	ldr	r1, [r3, #84]	@ 0x54
 8000f18:	589a      	ldr	r2, [r3, r2]
 8000f1a:	4291      	cmp	r1, r2
 8000f1c:	d105      	bne.n	8000f2a <fn_08000EF0+0x3a>
 8000f1e:	22d8      	movs	r2, #216	@ 0xd8
 8000f20:	6d99      	ldr	r1, [r3, #88]	@ 0x58
 8000f22:	589a      	ldr	r2, [r3, r2]
 8000f24:	4291      	cmp	r1, r2
 8000f26:	d100      	bne.n	8000f2a <fn_08000EF0+0x3a>
 8000f28:	e091      	b.n	800104e <fn_08000EF0+0x15e>
 8000f2a:	4887      	ldr	r0, [pc, #540]	@ (8001148 <fn_08000EF0+0x258>)
 8000f2c:	4a87      	ldr	r2, [pc, #540]	@ (800114c <fn_08000EF0+0x25c>)
 8000f2e:	6298      	str	r0, [r3, #40]	@ 0x28
 8000f30:	6258      	str	r0, [r3, #36]	@ 0x24
 8000f32:	5899      	ldr	r1, [r3, r2]
 8000f34:	2900      	cmp	r1, #0
 8000f36:	dc00      	bgt.n	8000f3a <fn_08000EF0+0x4a>
 8000f38:	e0e5      	b.n	8001106 <fn_08000EF0+0x216>
 8000f3a:	4e85      	ldr	r6, [pc, #532]	@ (8001150 <fn_08000EF0+0x260>)
 8000f3c:	0149      	lsls	r1, r1, #5
 8000f3e:	468c      	mov	ip, r1
 8000f40:	0035      	movs	r5, r6
 8000f42:	0007      	movs	r7, r0
 8000f44:	3204      	adds	r2, #4
 8000f46:	589a      	ldr	r2, [r3, r2]
 8000f48:	62de      	str	r6, [r3, #44]	@ 0x2c
 8000f4a:	4494      	add	ip, r2
 8000f4c:	8811      	ldrh	r1, [r2, #0]
 8000f4e:	8854      	ldrh	r4, [r2, #2]
 8000f50:	0409      	lsls	r1, r1, #16
 8000f52:	0424      	lsls	r4, r4, #16
 8000f54:	42b9      	cmp	r1, r7
 8000f56:	da01      	bge.n	8000f5c <fn_08000EF0+0x6c>
 8000f58:	000f      	movs	r7, r1
 8000f5a:	6259      	str	r1, [r3, #36]	@ 0x24
 8000f5c:	42a9      	cmp	r1, r5
 8000f5e:	dd01      	ble.n	8000f64 <fn_08000EF0+0x74>
 8000f60:	000d      	movs	r5, r1
 8000f62:	62d9      	str	r1, [r3, #44]	@ 0x2c
 8000f64:	4284      	cmp	r4, r0
 8000f66:	da01      	bge.n	8000f6c <fn_08000EF0+0x7c>
 8000f68:	0020      	movs	r0, r4
 8000f6a:	629c      	str	r4, [r3, #40]	@ 0x28
 8000f6c:	42a6      	cmp	r6, r4
 8000f6e:	da00      	bge.n	8000f72 <fn_08000EF0+0x82>
 8000f70:	0026      	movs	r6, r4
 8000f72:	8894      	ldrh	r4, [r2, #4]
 8000f74:	88d1      	ldrh	r1, [r2, #6]
 8000f76:	0424      	lsls	r4, r4, #16
 8000f78:	0409      	lsls	r1, r1, #16
 8000f7a:	42bc      	cmp	r4, r7
 8000f7c:	da00      	bge.n	8000f80 <fn_08000EF0+0x90>
 8000f7e:	625c      	str	r4, [r3, #36]	@ 0x24
 8000f80:	42ac      	cmp	r4, r5
 8000f82:	dd00      	ble.n	8000f86 <fn_08000EF0+0x96>
 8000f84:	62dc      	str	r4, [r3, #44]	@ 0x2c
 8000f86:	4281      	cmp	r1, r0
 8000f88:	da00      	bge.n	8000f8c <fn_08000EF0+0x9c>
 8000f8a:	6299      	str	r1, [r3, #40]	@ 0x28
 8000f8c:	42b1      	cmp	r1, r6
 8000f8e:	dc00      	bgt.n	8000f92 <fn_08000EF0+0xa2>
 8000f90:	e093      	b.n	80010ba <fn_08000EF0+0x1ca>
 8000f92:	3220      	adds	r2, #32
 8000f94:	000e      	movs	r6, r1
 8000f96:	6319      	str	r1, [r3, #48]	@ 0x30
 8000f98:	6add      	ldr	r5, [r3, #44]	@ 0x2c
 8000f9a:	6a5f      	ldr	r7, [r3, #36]	@ 0x24
 8000f9c:	6a98      	ldr	r0, [r3, #40]	@ 0x28
 8000f9e:	4562      	cmp	r2, ip
 8000fa0:	d1d4      	bne.n	8000f4c <fn_08000EF0+0x5c>
 8000fa2:	112a      	asrs	r2, r5, #4
 8000fa4:	113f      	asrs	r7, r7, #4
 8000fa6:	1bd1      	subs	r1, r2, r7
 8000fa8:	4688      	mov	r8, r1
 8000faa:	1100      	asrs	r0, r0, #4
 8000fac:	1136      	asrs	r6, r6, #4
 8000fae:	631e      	str	r6, [r3, #48]	@ 0x30
 8000fb0:	1a36      	subs	r6, r6, r0
 8000fb2:	62da      	str	r2, [r3, #44]	@ 0x2c
 8000fb4:	6359      	str	r1, [r3, #52]	@ 0x34
 8000fb6:	6298      	str	r0, [r3, #40]	@ 0x28
 8000fb8:	639e      	str	r6, [r3, #56]	@ 0x38
 8000fba:	625f      	str	r7, [r3, #36]	@ 0x24
 8000fbc:	17cb      	asrs	r3, r1, #31
 8000fbe:	18ca      	adds	r2, r1, r3
 8000fc0:	405a      	eors	r2, r3
 8000fc2:	2100      	movs	r1, #0
 8000fc4:	20f0      	movs	r0, #240	@ 0xf0
 8000fc6:	f024 fb2f 	bl	8025628 <fn_08025628>
 8000fca:	4643      	mov	r3, r8
 8000fcc:	0006      	movs	r6, r0
 8000fce:	2b00      	cmp	r3, #0
 8000fd0:	da00      	bge.n	8000fd4 <fn_08000EF0+0xe4>
 8000fd2:	e0a8      	b.n	8001126 <fn_08000EF0+0x236>
 8000fd4:	464b      	mov	r3, r9
 8000fd6:	681b      	ldr	r3, [r3, #0]
 8000fd8:	6b9f      	ldr	r7, [r3, #56]	@ 0x38
 8000fda:	17fb      	asrs	r3, r7, #31
 8000fdc:	18fa      	adds	r2, r7, r3
 8000fde:	405a      	eors	r2, r3
 8000fe0:	2100      	movs	r1, #0
 8000fe2:	2080      	movs	r0, #128	@ 0x80
 8000fe4:	f024 fb20 	bl	8025628 <fn_08025628>
 8000fe8:	0003      	movs	r3, r0
 8000fea:	2f00      	cmp	r7, #0
 8000fec:	da00      	bge.n	8000ff0 <fn_08000EF0+0x100>
 8000fee:	e081      	b.n	80010f4 <fn_08000EF0+0x204>
 8000ff0:	464a      	mov	r2, r9
 8000ff2:	6817      	ldr	r7, [r2, #0]
 8000ff4:	42b3      	cmp	r3, r6
 8000ff6:	dd00      	ble.n	8000ffa <fn_08000EF0+0x10a>
 8000ff8:	e075      	b.n	80010e6 <fn_08000EF0+0x1f6>
 8000ffa:	2280      	movs	r2, #128	@ 0x80
 8000ffc:	63fb      	str	r3, [r7, #60]	@ 0x3c
 8000ffe:	2100      	movs	r1, #0
 8001000:	0292      	lsls	r2, r2, #10
 8001002:	2080      	movs	r0, #128	@ 0x80
 8001004:	f024 fb10 	bl	8025628 <fn_08025628>
 8001008:	464b      	mov	r3, r9
 800100a:	6438      	str	r0, [r7, #64]	@ 0x40
 800100c:	681f      	ldr	r7, [r3, #0]
 800100e:	6bfe      	ldr	r6, [r7, #60]	@ 0x3c
 8001010:	17f3      	asrs	r3, r6, #31
 8001012:	18f2      	adds	r2, r6, r3
 8001014:	405a      	eors	r2, r3
 8001016:	4690      	mov	r8, r2
 8001018:	0411      	lsls	r1, r2, #16
 800101a:	1410      	asrs	r0, r2, #16
 800101c:	4a4d      	ldr	r2, [pc, #308]	@ (8001154 <fn_08000EF0+0x264>)
 800101e:	f024 fb03 	bl	8025628 <fn_08025628>
 8001022:	2e00      	cmp	r6, #0
 8001024:	db61      	blt.n	80010ea <fn_08000EF0+0x1fa>
 8001026:	6c3b      	ldr	r3, [r7, #64]	@ 0x40
 8001028:	4283      	cmp	r3, r0
 800102a:	da4e      	bge.n	80010ca <fn_08000EF0+0x1da>
 800102c:	4642      	mov	r2, r8
 800102e:	2100      	movs	r1, #0
 8001030:	2001      	movs	r0, #1
 8001032:	64fe      	str	r6, [r7, #76]	@ 0x4c
 8001034:	f024 faf8 	bl	8025628 <fn_08025628>
 8001038:	2e00      	cmp	r6, #0
 800103a:	db62      	blt.n	8001102 <fn_08000EF0+0x212>
 800103c:	464b      	mov	r3, r9
 800103e:	22dc      	movs	r2, #220	@ 0xdc
 8001040:	6538      	str	r0, [r7, #80]	@ 0x50
 8001042:	681b      	ldr	r3, [r3, #0]
 8001044:	589a      	ldr	r2, [r3, r2]
 8001046:	655a      	str	r2, [r3, #84]	@ 0x54
 8001048:	22d8      	movs	r2, #216	@ 0xd8
 800104a:	589a      	ldr	r2, [r3, r2]
 800104c:	659a      	str	r2, [r3, #88]	@ 0x58
 800104e:	2101      	movs	r1, #1
 8001050:	781a      	ldrb	r2, [r3, #0]
 8001052:	430a      	orrs	r2, r1
 8001054:	701a      	strb	r2, [r3, #0]
 8001056:	464b      	mov	r3, r9
 8001058:	681c      	ldr	r4, [r3, #0]
 800105a:	4b3b      	ldr	r3, [pc, #236]	@ (8001148 <fn_08000EF0+0x258>)
 800105c:	20f0      	movs	r0, #240	@ 0xf0
 800105e:	6463      	str	r3, [r4, #68]	@ 0x44
 8001060:	2300      	movs	r3, #0
 8001062:	6d27      	ldr	r7, [r4, #80]	@ 0x50
 8001064:	60a3      	str	r3, [r4, #8]
 8001066:	0039      	movs	r1, r7
 8001068:	6063      	str	r3, [r4, #4]
 800106a:	0400      	lsls	r0, r0, #16
 800106c:	f024 fb0e 	bl	802568c <fn_0802568C>
 8001070:	0006      	movs	r6, r0
 8001072:	61e0      	str	r0, [r4, #28]
 8001074:	2080      	movs	r0, #128	@ 0x80
 8001076:	0039      	movs	r1, r7
 8001078:	0400      	lsls	r0, r0, #16
 800107a:	f024 fb07 	bl	802568c <fn_0802568C>
 800107e:	23e0      	movs	r3, #224	@ 0xe0
 8001080:	6220      	str	r0, [r4, #32]
 8001082:	58e1      	ldr	r1, [r4, r3]
 8001084:	0ff2      	lsrs	r2, r6, #31
 8001086:	68cb      	ldr	r3, [r1, #12]
 8001088:	1992      	adds	r2, r2, r6
 800108a:	1052      	asrs	r2, r2, #1
 800108c:	111b      	asrs	r3, r3, #4
 800108e:	1a9b      	subs	r3, r3, r2
 8001090:	60e3      	str	r3, [r4, #12]
 8001092:	0fc2      	lsrs	r2, r0, #31
 8001094:	690b      	ldr	r3, [r1, #16]
 8001096:	1812      	adds	r2, r2, r0
 8001098:	1052      	asrs	r2, r2, #1
 800109a:	111b      	asrs	r3, r3, #4
 800109c:	1a9b      	subs	r3, r3, r2
 800109e:	6123      	str	r3, [r4, #16]
 80010a0:	f7ff fab4 	bl	800060c <fn_0800060C>
 80010a4:	4650      	mov	r0, sl
 80010a6:	3010      	adds	r0, #16
 80010a8:	f01a fb94 	bl	801b7d4 <fn_0801B7D4>
 80010ac:	bce0      	pop	{r5, r6, r7}
 80010ae:	46ba      	mov	sl, r7
 80010b0:	46b1      	mov	r9, r6
 80010b2:	46a8      	mov	r8, r5
 80010b4:	bcf0      	pop	{r4, r5, r6, r7}
 80010b6:	bc01      	pop	{r0}
 80010b8:	4700      	bx	r0
 80010ba:	3220      	adds	r2, #32
 80010bc:	6add      	ldr	r5, [r3, #44]	@ 0x2c
 80010be:	6a5f      	ldr	r7, [r3, #36]	@ 0x24
 80010c0:	6a98      	ldr	r0, [r3, #40]	@ 0x28
 80010c2:	4562      	cmp	r2, ip
 80010c4:	d000      	beq.n	80010c8 <fn_08000EF0+0x1d8>
 80010c6:	e741      	b.n	8000f4c <fn_08000EF0+0x5c>
 80010c8:	e76b      	b.n	8000fa2 <fn_08000EF0+0xb2>
 80010ca:	17c3      	asrs	r3, r0, #31
 80010cc:	18c2      	adds	r2, r0, r3
 80010ce:	405a      	eors	r2, r3
 80010d0:	0006      	movs	r6, r0
 80010d2:	4690      	mov	r8, r2
 80010d4:	2100      	movs	r1, #0
 80010d6:	4642      	mov	r2, r8
 80010d8:	2001      	movs	r0, #1
 80010da:	64fe      	str	r6, [r7, #76]	@ 0x4c
 80010dc:	f024 faa4 	bl	8025628 <fn_08025628>
 80010e0:	2e00      	cmp	r6, #0
 80010e2:	daab      	bge.n	800103c <fn_08000EF0+0x14c>
 80010e4:	e00d      	b.n	8001102 <fn_08000EF0+0x212>
 80010e6:	0033      	movs	r3, r6
 80010e8:	e787      	b.n	8000ffa <fn_08000EF0+0x10a>
 80010ea:	6c3b      	ldr	r3, [r7, #64]	@ 0x40
 80010ec:	4240      	negs	r0, r0
 80010ee:	4283      	cmp	r3, r0
 80010f0:	db9c      	blt.n	800102c <fn_08000EF0+0x13c>
 80010f2:	e7ea      	b.n	80010ca <fn_08000EF0+0x1da>
 80010f4:	464a      	mov	r2, r9
 80010f6:	4243      	negs	r3, r0
 80010f8:	6817      	ldr	r7, [r2, #0]
 80010fa:	42b3      	cmp	r3, r6
 80010fc:	dc00      	bgt.n	8001100 <fn_08000EF0+0x210>
 80010fe:	e77c      	b.n	8000ffa <fn_08000EF0+0x10a>
 8001100:	e7f1      	b.n	80010e6 <fn_08000EF0+0x1f6>
 8001102:	4240      	negs	r0, r0
 8001104:	e79a      	b.n	800103c <fn_08000EF0+0x14c>
 8001106:	20f8      	movs	r0, #248	@ 0xf8
 8001108:	4913      	ldr	r1, [pc, #76]	@ (8001158 <fn_08000EF0+0x268>)
 800110a:	4a14      	ldr	r2, [pc, #80]	@ (800115c <fn_08000EF0+0x26c>)
 800110c:	0600      	lsls	r0, r0, #24
 800110e:	62d8      	str	r0, [r3, #44]	@ 0x2c
 8001110:	6259      	str	r1, [r3, #36]	@ 0x24
 8001112:	635a      	str	r2, [r3, #52]	@ 0x34
 8001114:	6318      	str	r0, [r3, #48]	@ 0x30
 8001116:	6299      	str	r1, [r3, #40]	@ 0x28
 8001118:	639a      	str	r2, [r3, #56]	@ 0x38
 800111a:	2100      	movs	r1, #0
 800111c:	20f0      	movs	r0, #240	@ 0xf0
 800111e:	4a10      	ldr	r2, [pc, #64]	@ (8001160 <fn_08000EF0+0x270>)
 8001120:	f024 fa82 	bl	8025628 <fn_08025628>
 8001124:	0006      	movs	r6, r0
 8001126:	4276      	negs	r6, r6
 8001128:	e754      	b.n	8000fd4 <fn_08000EF0+0xe4>
 800112a:	701a      	strb	r2, [r3, #0]
 800112c:	4b05      	ldr	r3, [pc, #20]	@ (8001144 <fn_08000EF0+0x254>)
 800112e:	0018      	movs	r0, r3
 8001130:	469a      	mov	sl, r3
 8001132:	f01a fb4f 	bl	801b7d4 <fn_0801B7D4>
 8001136:	464b      	mov	r3, r9
 8001138:	2201      	movs	r2, #1
 800113a:	681b      	ldr	r3, [r3, #0]
 800113c:	559a      	strb	r2, [r3, r6]
 800113e:	e6e6      	b.n	8000f0e <fn_08000EF0+0x1e>
 8001140:	030064c4 	.word	0x030064c4
 8001144:	08025728 	.word	0x08025728
 8001148:	7fffffff 	.word	0x7fffffff
 800114c:	00000dfc 	.word	0x00000dfc
 8001150:	80000001 	.word	0x80000001
 8001154:	0000b333 	.word	0x0000b333
 8001158:	07ffffff 	.word	0x07ffffff
 800115c:	f0000001 	.word	0xf0000001
 8001160:	0fffffff 	.word	0x0fffffff
