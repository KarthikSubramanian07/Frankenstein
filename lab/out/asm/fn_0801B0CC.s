fn_0801B0CC:
 801b0cc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801b0ce:	46ce      	mov	lr, r9
 801b0d0:	4647      	mov	r7, r8
 801b0d2:	6883      	ldr	r3, [r0, #8]
 801b0d4:	681d      	ldr	r5, [r3, #0]
 801b0d6:	6843      	ldr	r3, [r0, #4]
 801b0d8:	0004      	movs	r4, r0
 801b0da:	b580      	push	{r7, lr}
 801b0dc:	42ab      	cmp	r3, r5
 801b0de:	d10a      	bne.n	801b0f6 <fn_0801B0CC+0x2a>
 801b0e0:	2900      	cmp	r1, #0
 801b0e2:	d13e      	bne.n	801b162 <fn_0801B0CC+0x96>
 801b0e4:	7e03      	ldrb	r3, [r0, #24]
 801b0e6:	2b00      	cmp	r3, #0
 801b0e8:	d14d      	bne.n	801b186 <fn_0801B0CC+0xba>
 801b0ea:	bcc0      	pop	{r6, r7}
 801b0ec:	46b9      	mov	r9, r7
 801b0ee:	46b0      	mov	r8, r6
 801b0f0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801b0f2:	bc01      	pop	{r0}
 801b0f4:	4700      	bx	r0
 801b0f6:	2900      	cmp	r1, #0
 801b0f8:	d133      	bne.n	801b162 <fn_0801B0CC+0x96>
 801b0fa:	2316      	movs	r3, #22
 801b0fc:	5ec0      	ldrsh	r0, [r0, r3]
 801b0fe:	2800      	cmp	r0, #0
 801b100:	d02f      	beq.n	801b162 <fn_0801B0CC+0x96>
 801b102:	2310      	movs	r3, #16
 801b104:	5ee6      	ldrsh	r6, [r4, r3]
 801b106:	2312      	movs	r3, #18
 801b108:	5ee7      	ldrsh	r7, [r4, r3]
 801b10a:	4b35      	ldr	r3, [pc, #212]	@ (801b1e0 <fn_0801B0CC+0x114>)
 801b10c:	681b      	ldr	r3, [r3, #0]
 801b10e:	469c      	mov	ip, r3
 801b110:	00fa      	lsls	r2, r7, #3
 801b112:	01fb      	lsls	r3, r7, #7
 801b114:	1a9b      	subs	r3, r3, r2
 801b116:	005b      	lsls	r3, r3, #1
 801b118:	4698      	mov	r8, r3
 801b11a:	4663      	mov	r3, ip
 801b11c:	4a31      	ldr	r2, [pc, #196]	@ (801b1e4 <fn_0801B0CC+0x118>)
 801b11e:	3f80      	subs	r7, #128	@ 0x80
 801b120:	589a      	ldr	r2, [r3, r2]
 801b122:	013b      	lsls	r3, r7, #4
 801b124:	1bdb      	subs	r3, r3, r7
 801b126:	011b      	lsls	r3, r3, #4
 801b128:	44b0      	add	r8, r6
 801b12a:	199b      	adds	r3, r3, r6
 801b12c:	4e2e      	ldr	r6, [pc, #184]	@ (801b1e8 <fn_0801B0CC+0x11c>)
 801b12e:	199b      	adds	r3, r3, r6
 801b130:	2614      	movs	r6, #20
 801b132:	5fa7      	ldrsh	r7, [r4, r6]
 801b134:	2680      	movs	r6, #128	@ 0x80
 801b136:	087f      	lsrs	r7, r7, #1
 801b138:	0636      	lsls	r6, r6, #24
 801b13a:	433e      	orrs	r6, r7
 801b13c:	0037      	movs	r7, r6
 801b13e:	4e2b      	ldr	r6, [pc, #172]	@ (801b1ec <fn_0801B0CC+0x120>)
 801b140:	4442      	add	r2, r8
 801b142:	46b0      	mov	r8, r6
 801b144:	4e2a      	ldr	r6, [pc, #168]	@ (801b1f0 <fn_0801B0CC+0x124>)
 801b146:	46b1      	mov	r9, r6
 801b148:	4e2a      	ldr	r6, [pc, #168]	@ (801b1f4 <fn_0801B0CC+0x128>)
 801b14a:	46b4      	mov	ip, r6
 801b14c:	4646      	mov	r6, r8
 801b14e:	6033      	str	r3, [r6, #0]
 801b150:	464e      	mov	r6, r9
 801b152:	6032      	str	r2, [r6, #0]
 801b154:	4666      	mov	r6, ip
 801b156:	3801      	subs	r0, #1
 801b158:	6037      	str	r7, [r6, #0]
 801b15a:	32f0      	adds	r2, #240	@ 0xf0
 801b15c:	33f0      	adds	r3, #240	@ 0xf0
 801b15e:	2800      	cmp	r0, #0
 801b160:	d1f4      	bne.n	801b14c <fn_0801B0CC+0x80>
 801b162:	2301      	movs	r3, #1
 801b164:	4059      	eors	r1, r3
 801b166:	7621      	strb	r1, [r4, #24]
 801b168:	1c6b      	adds	r3, r5, #1
 801b16a:	d101      	bne.n	801b170 <fn_0801B0CC+0xa4>
 801b16c:	6065      	str	r5, [r4, #4]
 801b16e:	e7bc      	b.n	801b0ea <fn_0801B0CC+0x1e>
 801b170:	68e3      	ldr	r3, [r4, #12]
 801b172:	00aa      	lsls	r2, r5, #2
 801b174:	58d2      	ldr	r2, [r2, r3]
 801b176:	2302      	movs	r3, #2
 801b178:	5ee1      	ldrsh	r1, [r4, r3]
 801b17a:	2300      	movs	r3, #0
 801b17c:	5ee0      	ldrsh	r0, [r4, r3]
 801b17e:	f00a f9d3 	bl	8025528 <fn_08025528>
 801b182:	6065      	str	r5, [r4, #4]
 801b184:	e7b1      	b.n	801b0ea <fn_0801B0CC+0x1e>
 801b186:	f7e5 f97b 	bl	8000480 <fn_08000480>
 801b18a:	2316      	movs	r3, #22
 801b18c:	5ee2      	ldrsh	r2, [r4, r3]
 801b18e:	2a00      	cmp	r2, #0
 801b190:	d023      	beq.n	801b1da <fn_0801B0CC+0x10e>
 801b192:	2312      	movs	r3, #18
 801b194:	5ee5      	ldrsh	r5, [r4, r3]
 801b196:	2310      	movs	r3, #16
 801b198:	5ee6      	ldrsh	r6, [r4, r3]
 801b19a:	4b11      	ldr	r3, [pc, #68]	@ (801b1e0 <fn_0801B0CC+0x114>)
 801b19c:	01e9      	lsls	r1, r5, #7
 801b19e:	681f      	ldr	r7, [r3, #0]
 801b1a0:	00eb      	lsls	r3, r5, #3
 801b1a2:	1ac9      	subs	r1, r1, r3
 801b1a4:	4b0f      	ldr	r3, [pc, #60]	@ (801b1e4 <fn_0801B0CC+0x118>)
 801b1a6:	0049      	lsls	r1, r1, #1
 801b1a8:	58fb      	ldr	r3, [r7, r3]
 801b1aa:	1989      	adds	r1, r1, r6
 801b1ac:	185b      	adds	r3, r3, r1
 801b1ae:	0129      	lsls	r1, r5, #4
 801b1b0:	1b49      	subs	r1, r1, r5
 801b1b2:	0109      	lsls	r1, r1, #4
 801b1b4:	1989      	adds	r1, r1, r6
 801b1b6:	1840      	adds	r0, r0, r1
 801b1b8:	2114      	movs	r1, #20
 801b1ba:	5e65      	ldrsh	r5, [r4, r1]
 801b1bc:	2180      	movs	r1, #128	@ 0x80
 801b1be:	086d      	lsrs	r5, r5, #1
 801b1c0:	0609      	lsls	r1, r1, #24
 801b1c2:	4329      	orrs	r1, r5
 801b1c4:	4e09      	ldr	r6, [pc, #36]	@ (801b1ec <fn_0801B0CC+0x120>)
 801b1c6:	4f0a      	ldr	r7, [pc, #40]	@ (801b1f0 <fn_0801B0CC+0x124>)
 801b1c8:	4d0a      	ldr	r5, [pc, #40]	@ (801b1f4 <fn_0801B0CC+0x128>)
 801b1ca:	3a01      	subs	r2, #1
 801b1cc:	6030      	str	r0, [r6, #0]
 801b1ce:	603b      	str	r3, [r7, #0]
 801b1d0:	30f0      	adds	r0, #240	@ 0xf0
 801b1d2:	6029      	str	r1, [r5, #0]
 801b1d4:	33f0      	adds	r3, #240	@ 0xf0
 801b1d6:	2a00      	cmp	r2, #0
 801b1d8:	d1f7      	bne.n	801b1ca <fn_0801B0CC+0xfe>
 801b1da:	2300      	movs	r3, #0
 801b1dc:	7623      	strb	r3, [r4, #24]
 801b1de:	e784      	b.n	801b0ea <fn_0801B0CC+0x1e>
 801b1e0:	030064c4 	.word	0x030064c4
 801b1e4:	00005a30 	.word	0x00005a30
 801b1e8:	08130000 	.word	0x08130000
 801b1ec:	040000d4 	.word	0x040000d4
 801b1f0:	040000d8 	.word	0x040000d8
 801b1f4:	040000dc 	.word	0x040000dc
