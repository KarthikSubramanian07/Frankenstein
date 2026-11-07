fn_0800DFE0:
 800dfe0:	b5f0      	push	{r4, r5, r6, r7, lr}
 800dfe2:	464f      	mov	r7, r9
 800dfe4:	46d6      	mov	lr, sl
 800dfe6:	4646      	mov	r6, r8
 800dfe8:	4b2a      	ldr	r3, [pc, #168]	@ (800e094 <fn_0800DFE0+0xb4>)
 800dfea:	4698      	mov	r8, r3
 800dfec:	4b2a      	ldr	r3, [pc, #168]	@ (800e098 <fn_0800DFE0+0xb8>)
 800dfee:	2401      	movs	r4, #1
 800dff0:	b5c0      	push	{r6, r7, lr}
 800dff2:	27df      	movs	r7, #223	@ 0xdf
 800dff4:	4681      	mov	r9, r0
 800dff6:	469a      	mov	sl, r3
 800dff8:	4264      	negs	r4, r4
 800dffa:	013f      	lsls	r7, r7, #4
 800dffc:	0021      	movs	r1, r4
 800dffe:	4648      	mov	r0, r9
 800e000:	f007 f89a 	bl	8015138 <fn_08015138>
 800e004:	1e04      	subs	r4, r0, #0
 800e006:	db3d      	blt.n	800e084 <fn_0800DFE0+0xa4>
 800e008:	4643      	mov	r3, r8
 800e00a:	681a      	ldr	r2, [r3, #0]
 800e00c:	00a3      	lsls	r3, r4, #2
 800e00e:	59d5      	ldr	r5, [r2, r7]
 800e010:	191b      	adds	r3, r3, r4
 800e012:	00db      	lsls	r3, r3, #3
 800e014:	18ed      	adds	r5, r5, r3
 800e016:	0029      	movs	r1, r5
 800e018:	2002      	movs	r0, #2
 800e01a:	f007 fa2b 	bl	8015474 <fn_08015474>
 800e01e:	2800      	cmp	r0, #0
 800e020:	d1ec      	bne.n	800dffc <fn_0800DFE0+0x1c>
 800e022:	2200      	movs	r2, #0
 800e024:	2103      	movs	r1, #3
 800e026:	3024      	adds	r0, #36	@ 0x24
 800e028:	f00f fb80 	bl	801d72c <fn_0801D72C>
 800e02c:	0006      	movs	r6, r0
 800e02e:	2224      	movs	r2, #36	@ 0x24
 800e030:	2100      	movs	r1, #0
 800e032:	f012 fd05 	bl	8020a40 <fn_08020A40>
 800e036:	0030      	movs	r0, r6
 800e038:	f00a faca 	bl	80185d0 <fn_080185D0>
 800e03c:	2323      	movs	r3, #35	@ 0x23
 800e03e:	61f3      	str	r3, [r6, #28]
 800e040:	3b1e      	subs	r3, #30
 800e042:	6233      	str	r3, [r6, #32]
 800e044:	4653      	mov	r3, sl
 800e046:	60b3      	str	r3, [r6, #8]
 800e048:	2326      	movs	r3, #38	@ 0x26
 800e04a:	60f5      	str	r5, [r6, #12]
 800e04c:	5ce9      	ldrb	r1, [r5, r3]
 800e04e:	0028      	movs	r0, r5
 800e050:	61b1      	str	r1, [r6, #24]
 800e052:	f007 f8bf 	bl	80151d4 <fn_080151D4>
 800e056:	69b3      	ldr	r3, [r6, #24]
 800e058:	1ac3      	subs	r3, r0, r3
 800e05a:	1e5a      	subs	r2, r3, #1
 800e05c:	4193      	sbcs	r3, r2
 800e05e:	221f      	movs	r2, #31
 800e060:	425b      	negs	r3, r3
 800e062:	4018      	ands	r0, r3
 800e064:	6170      	str	r0, [r6, #20]
 800e066:	8c2b      	ldrh	r3, [r5, #32]
 800e068:	4393      	bics	r3, r2
 800e06a:	842b      	strh	r3, [r5, #32]
 800e06c:	f7f8 fd48 	bl	8006b00 <fn_08006B00>
 800e070:	2307      	movs	r3, #7
 800e072:	4003      	ands	r3, r0
 800e074:	3301      	adds	r3, #1
 800e076:	0021      	movs	r1, r4
 800e078:	4648      	mov	r0, r9
 800e07a:	6133      	str	r3, [r6, #16]
 800e07c:	f007 f85c 	bl	8015138 <fn_08015138>
 800e080:	1e04      	subs	r4, r0, #0
 800e082:	dac1      	bge.n	800e008 <fn_0800DFE0+0x28>
 800e084:	2001      	movs	r0, #1
 800e086:	bce0      	pop	{r5, r6, r7}
 800e088:	46ba      	mov	sl, r7
 800e08a:	46b1      	mov	r9, r6
 800e08c:	46a8      	mov	r8, r5
 800e08e:	bcf0      	pop	{r4, r5, r6, r7}
 800e090:	bc02      	pop	{r1}
 800e092:	4708      	bx	r1
 800e094:	030064c4 	.word	0x030064c4
 800e098:	0800dd95 	.word	0x0800dd95
