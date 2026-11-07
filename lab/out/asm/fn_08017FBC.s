fn_08017FBC:
 8017fbc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8017fbe:	46d6      	mov	lr, sl
 8017fc0:	464f      	mov	r7, r9
 8017fc2:	4646      	mov	r6, r8
 8017fc4:	4681      	mov	r9, r0
 8017fc6:	4692      	mov	sl, r2
 8017fc8:	b5c0      	push	{r6, r7, lr}
 8017fca:	2900      	cmp	r1, #0
 8017fcc:	d102      	bne.n	8017fd4 <fn_08017FBC+0x18>
 8017fce:	6cd3      	ldr	r3, [r2, #76]	@ 0x4c
 8017fd0:	03db      	lsls	r3, r3, #15
 8017fd2:	d507      	bpl.n	8017fe4 <fn_08017FBC+0x28>
 8017fd4:	2000      	movs	r0, #0
 8017fd6:	bce0      	pop	{r5, r6, r7}
 8017fd8:	46ba      	mov	sl, r7
 8017fda:	46b1      	mov	r9, r6
 8017fdc:	46a8      	mov	r8, r5
 8017fde:	bcf0      	pop	{r4, r5, r6, r7}
 8017fe0:	bc02      	pop	{r1}
 8017fe2:	4708      	bx	r1
 8017fe4:	4b45      	ldr	r3, [pc, #276]	@ (80180fc <fn_08017FBC+0x140>)
 8017fe6:	2601      	movs	r6, #1
 8017fe8:	4698      	mov	r8, r3
 8017fea:	4d45      	ldr	r5, [pc, #276]	@ (8018100 <fn_08017FBC+0x144>)
 8017fec:	4276      	negs	r6, r6
 8017fee:	0031      	movs	r1, r6
 8017ff0:	4648      	mov	r0, r9
 8017ff2:	f7fd f8a1 	bl	8015138 <fn_08015138>
 8017ff6:	1e06      	subs	r6, r0, #0
 8017ff8:	dbec      	blt.n	8017fd4 <fn_08017FBC+0x18>
 8017ffa:	2400      	movs	r4, #0
 8017ffc:	275a      	movs	r7, #90	@ 0x5a
 8017ffe:	0020      	movs	r0, r4
 8018000:	f000 fb1c 	bl	801863c <fn_0801863C>
 8018004:	1e04      	subs	r4, r0, #0
 8018006:	d0f2      	beq.n	8017fee <fn_08017FBC+0x32>
 8018008:	68a3      	ldr	r3, [r4, #8]
 801800a:	42ab      	cmp	r3, r5
 801800c:	d1f7      	bne.n	8017ffe <fn_08017FBC+0x42>
 801800e:	5de3      	ldrb	r3, [r4, r7]
 8018010:	2b29      	cmp	r3, #41	@ 0x29
 8018012:	d1f4      	bne.n	8017ffe <fn_08017FBC+0x42>
 8018014:	4643      	mov	r3, r8
 8018016:	6819      	ldr	r1, [r3, #0]
 8018018:	23df      	movs	r3, #223	@ 0xdf
 801801a:	011b      	lsls	r3, r3, #4
 801801c:	58cb      	ldr	r3, [r1, r3]
 801801e:	6ae2      	ldr	r2, [r4, #44]	@ 0x2c
 8018020:	1ad2      	subs	r2, r2, r3
 8018022:	10d2      	asrs	r2, r2, #3
 8018024:	0053      	lsls	r3, r2, #1
 8018026:	189b      	adds	r3, r3, r2
 8018028:	0119      	lsls	r1, r3, #4
 801802a:	185b      	adds	r3, r3, r1
 801802c:	0219      	lsls	r1, r3, #8
 801802e:	185b      	adds	r3, r3, r1
 8018030:	0419      	lsls	r1, r3, #16
 8018032:	185b      	adds	r3, r3, r1
 8018034:	009b      	lsls	r3, r3, #2
 8018036:	189b      	adds	r3, r3, r2
 8018038:	42b3      	cmp	r3, r6
 801803a:	d1e0      	bne.n	8017ffe <fn_08017FBC+0x42>
 801803c:	4650      	mov	r0, sl
 801803e:	6943      	ldr	r3, [r0, #20]
 8018040:	68c6      	ldr	r6, [r0, #12]
 8018042:	4698      	mov	r8, r3
 8018044:	6907      	ldr	r7, [r0, #16]
 8018046:	f7fa f8f5 	bl	8012234 <fn_08012234>
 801804a:	68e1      	ldr	r1, [r4, #12]
 801804c:	1e05      	subs	r5, r0, #0
 801804e:	6922      	ldr	r2, [r4, #16]
 8018050:	d002      	beq.n	8018058 <fn_08017FBC+0x9c>
 8018052:	682b      	ldr	r3, [r5, #0]
 8018054:	4553      	cmp	r3, sl
 8018056:	d043      	beq.n	80180e0 <fn_08017FBC+0x124>
 8018058:	2300      	movs	r3, #0
 801805a:	4650      	mov	r0, sl
 801805c:	f7f7 f898 	bl	800f190 <fn_0800F190>
 8018060:	2800      	cmp	r0, #0
 8018062:	d0b7      	beq.n	8017fd4 <fn_08017FBC+0x18>
 8018064:	4652      	mov	r2, sl
 8018066:	2500      	movs	r5, #0
 8018068:	6b13      	ldr	r3, [r2, #48]	@ 0x30
 801806a:	6153      	str	r3, [r2, #20]
 801806c:	2327      	movs	r3, #39	@ 0x27
 801806e:	4642      	mov	r2, r8
 8018070:	0039      	movs	r1, r7
 8018072:	0030      	movs	r0, r6
 8018074:	f7f8 feba 	bl	8010dec <fn_08010DEC>
 8018078:	2123      	movs	r1, #35	@ 0x23
 801807a:	f002 f97f 	bl	801a37c <fn_0801A37C>
 801807e:	6a23      	ldr	r3, [r4, #32]
 8018080:	4820      	ldr	r0, [pc, #128]	@ (8018104 <fn_08017FBC+0x148>)
 8018082:	0cdb      	lsrs	r3, r3, #19
 8018084:	0099      	lsls	r1, r3, #2
 8018086:	580e      	ldr	r6, [r1, r0]
 8018088:	00b1      	lsls	r1, r6, #2
 801808a:	1989      	adds	r1, r1, r6
 801808c:	6926      	ldr	r6, [r4, #16]
 801808e:	0089      	lsls	r1, r1, #2
 8018090:	1989      	adds	r1, r1, r6
 8018092:	2680      	movs	r6, #128	@ 0x80
 8018094:	4657      	mov	r7, sl
 8018096:	0136      	lsls	r6, r6, #4
 8018098:	199b      	adds	r3, r3, r6
 801809a:	009b      	lsls	r3, r3, #2
 801809c:	58c3      	ldr	r3, [r0, r3]
 801809e:	0098      	lsls	r0, r3, #2
 80180a0:	18c0      	adds	r0, r0, r3
 80180a2:	68e3      	ldr	r3, [r4, #12]
 80180a4:	0080      	lsls	r0, r0, #2
 80180a6:	697a      	ldr	r2, [r7, #20]
 80180a8:	18c0      	adds	r0, r0, r3
 80180aa:	2327      	movs	r3, #39	@ 0x27
 80180ac:	f7f8 fe9e 	bl	8010dec <fn_08010DEC>
 80180b0:	2123      	movs	r1, #35	@ 0x23
 80180b2:	f002 f963 	bl	801a37c <fn_0801A37C>
 80180b6:	0038      	movs	r0, r7
 80180b8:	f7fa f8bc 	bl	8012234 <fn_08012234>
 80180bc:	2800      	cmp	r0, #0
 80180be:	d002      	beq.n	80180c6 <fn_08017FBC+0x10a>
 80180c0:	235c      	movs	r3, #92	@ 0x5c
 80180c2:	2212      	movs	r2, #18
 80180c4:	54fa      	strb	r2, [r7, r3]
 80180c6:	4652      	mov	r2, sl
 80180c8:	6a23      	ldr	r3, [r4, #32]
 80180ca:	6213      	str	r3, [r2, #32]
 80180cc:	2300      	movs	r3, #0
 80180ce:	6453      	str	r3, [r2, #68]	@ 0x44
 80180d0:	6413      	str	r3, [r2, #64]	@ 0x40
 80180d2:	63d3      	str	r3, [r2, #60]	@ 0x3c
 80180d4:	2d00      	cmp	r5, #0
 80180d6:	d001      	beq.n	80180dc <fn_08017FBC+0x120>
 80180d8:	626b      	str	r3, [r5, #36]	@ 0x24
 80180da:	622b      	str	r3, [r5, #32]
 80180dc:	2001      	movs	r0, #1
 80180de:	e77a      	b.n	8017fd6 <fn_08017FBC+0x1a>
 80180e0:	2300      	movs	r3, #0
 80180e2:	4650      	mov	r0, sl
 80180e4:	f7f7 f854 	bl	800f190 <fn_0800F190>
 80180e8:	2800      	cmp	r0, #0
 80180ea:	d100      	bne.n	80180ee <fn_08017FBC+0x132>
 80180ec:	e772      	b.n	8017fd4 <fn_08017FBC+0x18>
 80180ee:	4653      	mov	r3, sl
 80180f0:	6b1a      	ldr	r2, [r3, #48]	@ 0x30
 80180f2:	615a      	str	r2, [r3, #20]
 80180f4:	696b      	ldr	r3, [r5, #20]
 80180f6:	189b      	adds	r3, r3, r2
 80180f8:	612b      	str	r3, [r5, #16]
 80180fa:	e7b7      	b.n	801806c <fn_08017FBC+0xb0>
 80180fc:	030064c4 	.word	0x030064c4
 8018100:	03001618 	.word	0x03001618
 8018104:	081398a0 	.word	0x081398a0
