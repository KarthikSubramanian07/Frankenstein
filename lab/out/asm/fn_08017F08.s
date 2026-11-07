fn_08017F08:
 8017f08:	b5f0      	push	{r4, r5, r6, r7, lr}
 8017f0a:	46d6      	mov	lr, sl
 8017f0c:	464f      	mov	r7, r9
 8017f0e:	4646      	mov	r6, r8
 8017f10:	4681      	mov	r9, r0
 8017f12:	4692      	mov	sl, r2
 8017f14:	b5c0      	push	{r6, r7, lr}
 8017f16:	2900      	cmp	r1, #0
 8017f18:	d102      	bne.n	8017f20 <fn_08017F08+0x18>
 8017f1a:	6cd3      	ldr	r3, [r2, #76]	@ 0x4c
 8017f1c:	03db      	lsls	r3, r3, #15
 8017f1e:	d507      	bpl.n	8017f30 <fn_08017F08+0x28>
 8017f20:	2000      	movs	r0, #0
 8017f22:	bce0      	pop	{r5, r6, r7}
 8017f24:	46ba      	mov	sl, r7
 8017f26:	46b1      	mov	r9, r6
 8017f28:	46a8      	mov	r8, r5
 8017f2a:	bcf0      	pop	{r4, r5, r6, r7}
 8017f2c:	bc02      	pop	{r1}
 8017f2e:	4708      	bx	r1
 8017f30:	4b45      	ldr	r3, [pc, #276]	@ (8018048 <fn_08017F08+0x140>)
 8017f32:	2601      	movs	r6, #1
 8017f34:	4698      	mov	r8, r3
 8017f36:	4d45      	ldr	r5, [pc, #276]	@ (801804c <fn_08017F08+0x144>)
 8017f38:	4276      	negs	r6, r6
 8017f3a:	0031      	movs	r1, r6
 8017f3c:	4648      	mov	r0, r9
 8017f3e:	f7fd f8a1 	bl	8015084 <fn_08015084>
 8017f42:	1e06      	subs	r6, r0, #0
 8017f44:	dbec      	blt.n	8017f20 <fn_08017F08+0x18>
 8017f46:	2400      	movs	r4, #0
 8017f48:	275a      	movs	r7, #90	@ 0x5a
 8017f4a:	0020      	movs	r0, r4
 8017f4c:	f000 fb1c 	bl	8018588 <fn_08018588>
 8017f50:	1e04      	subs	r4, r0, #0
 8017f52:	d0f2      	beq.n	8017f3a <fn_08017F08+0x32>
 8017f54:	68a3      	ldr	r3, [r4, #8]
 8017f56:	42ab      	cmp	r3, r5
 8017f58:	d1f7      	bne.n	8017f4a <fn_08017F08+0x42>
 8017f5a:	5de3      	ldrb	r3, [r4, r7]
 8017f5c:	2b29      	cmp	r3, #41	@ 0x29
 8017f5e:	d1f4      	bne.n	8017f4a <fn_08017F08+0x42>
 8017f60:	4643      	mov	r3, r8
 8017f62:	6819      	ldr	r1, [r3, #0]
 8017f64:	23df      	movs	r3, #223	@ 0xdf
 8017f66:	011b      	lsls	r3, r3, #4
 8017f68:	58cb      	ldr	r3, [r1, r3]
 8017f6a:	6ae2      	ldr	r2, [r4, #44]	@ 0x2c
 8017f6c:	1ad2      	subs	r2, r2, r3
 8017f6e:	10d2      	asrs	r2, r2, #3
 8017f70:	0053      	lsls	r3, r2, #1
 8017f72:	189b      	adds	r3, r3, r2
 8017f74:	0119      	lsls	r1, r3, #4
 8017f76:	185b      	adds	r3, r3, r1
 8017f78:	0219      	lsls	r1, r3, #8
 8017f7a:	185b      	adds	r3, r3, r1
 8017f7c:	0419      	lsls	r1, r3, #16
 8017f7e:	185b      	adds	r3, r3, r1
 8017f80:	009b      	lsls	r3, r3, #2
 8017f82:	189b      	adds	r3, r3, r2
 8017f84:	42b3      	cmp	r3, r6
 8017f86:	d1e0      	bne.n	8017f4a <fn_08017F08+0x42>
 8017f88:	4650      	mov	r0, sl
 8017f8a:	6943      	ldr	r3, [r0, #20]
 8017f8c:	68c6      	ldr	r6, [r0, #12]
 8017f8e:	4698      	mov	r8, r3
 8017f90:	6907      	ldr	r7, [r0, #16]
 8017f92:	f7fa f94f 	bl	8012234 <fn_08012234>
 8017f96:	68e1      	ldr	r1, [r4, #12]
 8017f98:	1e05      	subs	r5, r0, #0
 8017f9a:	6922      	ldr	r2, [r4, #16]
 8017f9c:	d002      	beq.n	8017fa4 <fn_08017F08+0x9c>
 8017f9e:	682b      	ldr	r3, [r5, #0]
 8017fa0:	4553      	cmp	r3, sl
 8017fa2:	d043      	beq.n	801802c <fn_08017F08+0x124>
 8017fa4:	2300      	movs	r3, #0
 8017fa6:	4650      	mov	r0, sl
 8017fa8:	f7f7 f8f2 	bl	800f190 <fn_0800F190>
 8017fac:	2800      	cmp	r0, #0
 8017fae:	d0b7      	beq.n	8017f20 <fn_08017F08+0x18>
 8017fb0:	4652      	mov	r2, sl
 8017fb2:	2500      	movs	r5, #0
 8017fb4:	6b13      	ldr	r3, [r2, #48]	@ 0x30
 8017fb6:	6153      	str	r3, [r2, #20]
 8017fb8:	2327      	movs	r3, #39	@ 0x27
 8017fba:	4642      	mov	r2, r8
 8017fbc:	0039      	movs	r1, r7
 8017fbe:	0030      	movs	r0, r6
 8017fc0:	f7f8 ff14 	bl	8010dec <fn_08010DEC>
 8017fc4:	2123      	movs	r1, #35	@ 0x23
 8017fc6:	f002 f97f 	bl	801a2c8 <fn_0801A2C8>
 8017fca:	6a23      	ldr	r3, [r4, #32]
 8017fcc:	4820      	ldr	r0, [pc, #128]	@ (8018050 <fn_08017F08+0x148>)
 8017fce:	0cdb      	lsrs	r3, r3, #19
 8017fd0:	0099      	lsls	r1, r3, #2
 8017fd2:	580e      	ldr	r6, [r1, r0]
 8017fd4:	00b1      	lsls	r1, r6, #2
 8017fd6:	1989      	adds	r1, r1, r6
 8017fd8:	6926      	ldr	r6, [r4, #16]
 8017fda:	0089      	lsls	r1, r1, #2
 8017fdc:	1989      	adds	r1, r1, r6
 8017fde:	2680      	movs	r6, #128	@ 0x80
 8017fe0:	4657      	mov	r7, sl
 8017fe2:	0136      	lsls	r6, r6, #4
 8017fe4:	199b      	adds	r3, r3, r6
 8017fe6:	009b      	lsls	r3, r3, #2
 8017fe8:	58c3      	ldr	r3, [r0, r3]
 8017fea:	0098      	lsls	r0, r3, #2
 8017fec:	18c0      	adds	r0, r0, r3
 8017fee:	68e3      	ldr	r3, [r4, #12]
 8017ff0:	0080      	lsls	r0, r0, #2
 8017ff2:	697a      	ldr	r2, [r7, #20]
 8017ff4:	18c0      	adds	r0, r0, r3
 8017ff6:	2327      	movs	r3, #39	@ 0x27
 8017ff8:	f7f8 fef8 	bl	8010dec <fn_08010DEC>
 8017ffc:	2123      	movs	r1, #35	@ 0x23
 8017ffe:	f002 f963 	bl	801a2c8 <fn_0801A2C8>
 8018002:	0038      	movs	r0, r7
 8018004:	f7fa f916 	bl	8012234 <fn_08012234>
 8018008:	2800      	cmp	r0, #0
 801800a:	d002      	beq.n	8018012 <fn_08017F08+0x10a>
 801800c:	235c      	movs	r3, #92	@ 0x5c
 801800e:	2212      	movs	r2, #18
 8018010:	54fa      	strb	r2, [r7, r3]
 8018012:	4652      	mov	r2, sl
 8018014:	6a23      	ldr	r3, [r4, #32]
 8018016:	6213      	str	r3, [r2, #32]
 8018018:	2300      	movs	r3, #0
 801801a:	6453      	str	r3, [r2, #68]	@ 0x44
 801801c:	6413      	str	r3, [r2, #64]	@ 0x40
 801801e:	63d3      	str	r3, [r2, #60]	@ 0x3c
 8018020:	2d00      	cmp	r5, #0
 8018022:	d001      	beq.n	8018028 <fn_08017F08+0x120>
 8018024:	626b      	str	r3, [r5, #36]	@ 0x24
 8018026:	622b      	str	r3, [r5, #32]
 8018028:	2001      	movs	r0, #1
 801802a:	e77a      	b.n	8017f22 <fn_08017F08+0x1a>
 801802c:	2300      	movs	r3, #0
 801802e:	4650      	mov	r0, sl
 8018030:	f7f7 f8ae 	bl	800f190 <fn_0800F190>
 8018034:	2800      	cmp	r0, #0
 8018036:	d100      	bne.n	801803a <fn_08017F08+0x132>
 8018038:	e772      	b.n	8017f20 <fn_08017F08+0x18>
 801803a:	4653      	mov	r3, sl
 801803c:	6b1a      	ldr	r2, [r3, #48]	@ 0x30
 801803e:	615a      	str	r2, [r3, #20]
 8018040:	696b      	ldr	r3, [r5, #20]
 8018042:	189b      	adds	r3, r3, r2
 8018044:	612b      	str	r3, [r5, #16]
 8018046:	e7b7      	b.n	8017fb8 <fn_08017F08+0xb0>
 8018048:	030064c4 	.word	0x030064c4
 801804c:	03001618 	.word	0x03001618
 8018050:	081397cc 	.word	0x081397cc
