fn_08011F54:
 8011f54:	b570      	push	{r4, r5, r6, lr}
 8011f56:	0004      	movs	r4, r0
 8011f58:	f7f4 fdd2 	bl	8006b00 <fn_08006B00>
 8011f5c:	2303      	movs	r3, #3
 8011f5e:	2256      	movs	r2, #86	@ 0x56
 8011f60:	4003      	ands	r3, r0
 8011f62:	5aa0      	ldrh	r0, [r4, r2]
 8011f64:	1ac0      	subs	r0, r0, r3
 8011f66:	1c03      	adds	r3, r0, #0
 8011f68:	0400      	lsls	r0, r0, #16
 8011f6a:	1400      	asrs	r0, r0, #16
 8011f6c:	2800      	cmp	r0, #0
 8011f6e:	dc00      	bgt.n	8011f72 <fn_08011F54+0x1e>
 8011f70:	2301      	movs	r3, #1
 8011f72:	2556      	movs	r5, #86	@ 0x56
 8011f74:	5363      	strh	r3, [r4, r5]
 8011f76:	6be1      	ldr	r1, [r4, #60]	@ 0x3c
 8011f78:	68e3      	ldr	r3, [r4, #12]
 8011f7a:	6c22      	ldr	r2, [r4, #64]	@ 0x40
 8011f7c:	1049      	asrs	r1, r1, #1
 8011f7e:	18c9      	adds	r1, r1, r3
 8011f80:	6923      	ldr	r3, [r4, #16]
 8011f82:	6c60      	ldr	r0, [r4, #68]	@ 0x44
 8011f84:	1052      	asrs	r2, r2, #1
 8011f86:	18d2      	adds	r2, r2, r3
 8011f88:	6963      	ldr	r3, [r4, #20]
 8011f8a:	1040      	asrs	r0, r0, #1
 8011f8c:	181b      	adds	r3, r3, r0
 8011f8e:	6163      	str	r3, [r4, #20]
 8011f90:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 8011f92:	60e1      	str	r1, [r4, #12]
 8011f94:	6122      	str	r2, [r4, #16]
 8011f96:	03db      	lsls	r3, r3, #15
 8011f98:	d402      	bmi.n	8011fa0 <fn_08011F54+0x4c>
 8011f9a:	bc70      	pop	{r4, r5, r6}
 8011f9c:	bc01      	pop	{r0}
 8011f9e:	4700      	bx	r0
 8011fa0:	2300      	movs	r3, #0
 8011fa2:	0020      	movs	r0, r4
 8011fa4:	f7fd fb74 	bl	800f690 <fn_0800F690>
 8011fa8:	2800      	cmp	r0, #0
 8011faa:	d1f6      	bne.n	8011f9a <fn_08011F54+0x46>
 8011fac:	4b19      	ldr	r3, [pc, #100]	@ (8012014 <fn_08011F54+0xc0>)
 8011fae:	681a      	ldr	r2, [r3, #0]
 8011fb0:	001e      	movs	r6, r3
 8011fb2:	235a      	movs	r3, #90	@ 0x5a
 8011fb4:	6460      	str	r0, [r4, #68]	@ 0x44
 8011fb6:	6420      	str	r0, [r4, #64]	@ 0x40
 8011fb8:	63e0      	str	r0, [r4, #60]	@ 0x3c
 8011fba:	5ce1      	ldrb	r1, [r4, r3]
 8011fbc:	23ea      	movs	r3, #234	@ 0xea
 8011fbe:	00db      	lsls	r3, r3, #3
 8011fc0:	58d3      	ldr	r3, [r2, r3]
 8011fc2:	225c      	movs	r2, #92	@ 0x5c
 8011fc4:	434a      	muls	r2, r1
 8011fc6:	189b      	adds	r3, r3, r2
 8011fc8:	8e19      	ldrh	r1, [r3, #48]	@ 0x30
 8011fca:	0020      	movs	r0, r4
 8011fcc:	f7ff f91e 	bl	801120c <fn_0801120C>
 8011fd0:	f7f4 fd96 	bl	8006b00 <fn_08006B00>
 8011fd4:	2303      	movs	r3, #3
 8011fd6:	4003      	ands	r3, r0
 8011fd8:	5b60      	ldrh	r0, [r4, r5]
 8011fda:	1ac0      	subs	r0, r0, r3
 8011fdc:	1c03      	adds	r3, r0, #0
 8011fde:	0400      	lsls	r0, r0, #16
 8011fe0:	1400      	asrs	r0, r0, #16
 8011fe2:	2800      	cmp	r0, #0
 8011fe4:	dc00      	bgt.n	8011fe8 <fn_08011F54+0x94>
 8011fe6:	2301      	movs	r3, #1
 8011fe8:	2256      	movs	r2, #86	@ 0x56
 8011fea:	52a3      	strh	r3, [r4, r2]
 8011fec:	4a0a      	ldr	r2, [pc, #40]	@ (8012018 <fn_08011F54+0xc4>)
 8011fee:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 8011ff0:	4013      	ands	r3, r2
 8011ff2:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8011ff4:	235a      	movs	r3, #90	@ 0x5a
 8011ff6:	5ce1      	ldrb	r1, [r4, r3]
 8011ff8:	23ea      	movs	r3, #234	@ 0xea
 8011ffa:	6832      	ldr	r2, [r6, #0]
 8011ffc:	00db      	lsls	r3, r3, #3
 8011ffe:	58d3      	ldr	r3, [r2, r3]
 8012000:	225c      	movs	r2, #92	@ 0x5c
 8012002:	434a      	muls	r2, r1
 8012004:	189b      	adds	r3, r3, r2
 8012006:	6b99      	ldr	r1, [r3, #56]	@ 0x38
 8012008:	2900      	cmp	r1, #0
 801200a:	d0c6      	beq.n	8011f9a <fn_08011F54+0x46>
 801200c:	0020      	movs	r0, r4
 801200e:	f008 f95b 	bl	801a2c8 <fn_0801A2C8>
 8012012:	e7c2      	b.n	8011f9a <fn_08011F54+0x46>
 8012014:	030064c4 	.word	0x030064c4	@ data_030064C4
 8012018:	fffeffff 	.word	0xfffeffff
