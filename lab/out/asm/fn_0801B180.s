fn_0801B180:
 801b180:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801b182:	46ce      	mov	lr, r9
 801b184:	4647      	mov	r7, r8
 801b186:	6883      	ldr	r3, [r0, #8]
 801b188:	681d      	ldr	r5, [r3, #0]
 801b18a:	6843      	ldr	r3, [r0, #4]
 801b18c:	0004      	movs	r4, r0
 801b18e:	b580      	push	{r7, lr}
 801b190:	42ab      	cmp	r3, r5
 801b192:	d10a      	bne.n	801b1aa <fn_0801B180+0x2a>
 801b194:	2900      	cmp	r1, #0
 801b196:	d13e      	bne.n	801b216 <fn_0801B180+0x96>
 801b198:	7e03      	ldrb	r3, [r0, #24]
 801b19a:	2b00      	cmp	r3, #0
 801b19c:	d14d      	bne.n	801b23a <fn_0801B180+0xba>
 801b19e:	bcc0      	pop	{r6, r7}
 801b1a0:	46b9      	mov	r9, r7
 801b1a2:	46b0      	mov	r8, r6
 801b1a4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801b1a6:	bc01      	pop	{r0}
 801b1a8:	4700      	bx	r0
 801b1aa:	2900      	cmp	r1, #0
 801b1ac:	d133      	bne.n	801b216 <fn_0801B180+0x96>
 801b1ae:	2316      	movs	r3, #22
 801b1b0:	5ec0      	ldrsh	r0, [r0, r3]
 801b1b2:	2800      	cmp	r0, #0
 801b1b4:	d02f      	beq.n	801b216 <fn_0801B180+0x96>
 801b1b6:	2310      	movs	r3, #16
 801b1b8:	5ee6      	ldrsh	r6, [r4, r3]
 801b1ba:	2312      	movs	r3, #18
 801b1bc:	5ee7      	ldrsh	r7, [r4, r3]
 801b1be:	4b35      	ldr	r3, [pc, #212]	@ (801b294 <fn_0801B180+0x114>)
 801b1c0:	681b      	ldr	r3, [r3, #0]
 801b1c2:	469c      	mov	ip, r3
 801b1c4:	00fa      	lsls	r2, r7, #3
 801b1c6:	01fb      	lsls	r3, r7, #7
 801b1c8:	1a9b      	subs	r3, r3, r2
 801b1ca:	005b      	lsls	r3, r3, #1
 801b1cc:	4698      	mov	r8, r3
 801b1ce:	4663      	mov	r3, ip
 801b1d0:	4a31      	ldr	r2, [pc, #196]	@ (801b298 <fn_0801B180+0x118>)
 801b1d2:	3f80      	subs	r7, #128	@ 0x80
 801b1d4:	589a      	ldr	r2, [r3, r2]
 801b1d6:	013b      	lsls	r3, r7, #4
 801b1d8:	1bdb      	subs	r3, r3, r7
 801b1da:	011b      	lsls	r3, r3, #4
 801b1dc:	44b0      	add	r8, r6
 801b1de:	199b      	adds	r3, r3, r6
 801b1e0:	4e2e      	ldr	r6, [pc, #184]	@ (801b29c <fn_0801B180+0x11c>)
 801b1e2:	199b      	adds	r3, r3, r6
 801b1e4:	2614      	movs	r6, #20
 801b1e6:	5fa7      	ldrsh	r7, [r4, r6]
 801b1e8:	2680      	movs	r6, #128	@ 0x80
 801b1ea:	087f      	lsrs	r7, r7, #1
 801b1ec:	0636      	lsls	r6, r6, #24
 801b1ee:	433e      	orrs	r6, r7
 801b1f0:	0037      	movs	r7, r6
 801b1f2:	4e2b      	ldr	r6, [pc, #172]	@ (801b2a0 <fn_0801B180+0x120>)
 801b1f4:	4442      	add	r2, r8
 801b1f6:	46b0      	mov	r8, r6
 801b1f8:	4e2a      	ldr	r6, [pc, #168]	@ (801b2a4 <fn_0801B180+0x124>)
 801b1fa:	46b1      	mov	r9, r6
 801b1fc:	4e2a      	ldr	r6, [pc, #168]	@ (801b2a8 <fn_0801B180+0x128>)
 801b1fe:	46b4      	mov	ip, r6
 801b200:	4646      	mov	r6, r8
 801b202:	6033      	str	r3, [r6, #0]
 801b204:	464e      	mov	r6, r9
 801b206:	6032      	str	r2, [r6, #0]
 801b208:	4666      	mov	r6, ip
 801b20a:	3801      	subs	r0, #1
 801b20c:	6037      	str	r7, [r6, #0]
 801b20e:	32f0      	adds	r2, #240	@ 0xf0
 801b210:	33f0      	adds	r3, #240	@ 0xf0
 801b212:	2800      	cmp	r0, #0
 801b214:	d1f4      	bne.n	801b200 <fn_0801B180+0x80>
 801b216:	2301      	movs	r3, #1
 801b218:	4059      	eors	r1, r3
 801b21a:	7621      	strb	r1, [r4, #24]
 801b21c:	1c6b      	adds	r3, r5, #1
 801b21e:	d101      	bne.n	801b224 <fn_0801B180+0xa4>
 801b220:	6065      	str	r5, [r4, #4]
 801b222:	e7bc      	b.n	801b19e <fn_0801B180+0x1e>
 801b224:	68e3      	ldr	r3, [r4, #12]
 801b226:	00aa      	lsls	r2, r5, #2
 801b228:	58d2      	ldr	r2, [r2, r3]
 801b22a:	2302      	movs	r3, #2
 801b22c:	5ee1      	ldrsh	r1, [r4, r3]
 801b22e:	2300      	movs	r3, #0
 801b230:	5ee0      	ldrsh	r0, [r4, r3]
 801b232:	f00a f9d1 	bl	80255d8 <fn_080255D8>
 801b236:	6065      	str	r5, [r4, #4]
 801b238:	e7b1      	b.n	801b19e <fn_0801B180+0x1e>
 801b23a:	f7e5 f921 	bl	8000480 <fn_08000480>
 801b23e:	2316      	movs	r3, #22
 801b240:	5ee2      	ldrsh	r2, [r4, r3]
 801b242:	2a00      	cmp	r2, #0
 801b244:	d023      	beq.n	801b28e <fn_0801B180+0x10e>
 801b246:	2312      	movs	r3, #18
 801b248:	5ee5      	ldrsh	r5, [r4, r3]
 801b24a:	2310      	movs	r3, #16
 801b24c:	5ee6      	ldrsh	r6, [r4, r3]
 801b24e:	4b11      	ldr	r3, [pc, #68]	@ (801b294 <fn_0801B180+0x114>)
 801b250:	01e9      	lsls	r1, r5, #7
 801b252:	681f      	ldr	r7, [r3, #0]
 801b254:	00eb      	lsls	r3, r5, #3
 801b256:	1ac9      	subs	r1, r1, r3
 801b258:	4b0f      	ldr	r3, [pc, #60]	@ (801b298 <fn_0801B180+0x118>)
 801b25a:	0049      	lsls	r1, r1, #1
 801b25c:	58fb      	ldr	r3, [r7, r3]
 801b25e:	1989      	adds	r1, r1, r6
 801b260:	185b      	adds	r3, r3, r1
 801b262:	0129      	lsls	r1, r5, #4
 801b264:	1b49      	subs	r1, r1, r5
 801b266:	0109      	lsls	r1, r1, #4
 801b268:	1989      	adds	r1, r1, r6
 801b26a:	1840      	adds	r0, r0, r1
 801b26c:	2114      	movs	r1, #20
 801b26e:	5e65      	ldrsh	r5, [r4, r1]
 801b270:	2180      	movs	r1, #128	@ 0x80
 801b272:	086d      	lsrs	r5, r5, #1
 801b274:	0609      	lsls	r1, r1, #24
 801b276:	4329      	orrs	r1, r5
 801b278:	4e09      	ldr	r6, [pc, #36]	@ (801b2a0 <fn_0801B180+0x120>)
 801b27a:	4f0a      	ldr	r7, [pc, #40]	@ (801b2a4 <fn_0801B180+0x124>)
 801b27c:	4d0a      	ldr	r5, [pc, #40]	@ (801b2a8 <fn_0801B180+0x128>)
 801b27e:	3a01      	subs	r2, #1
 801b280:	6030      	str	r0, [r6, #0]
 801b282:	603b      	str	r3, [r7, #0]
 801b284:	30f0      	adds	r0, #240	@ 0xf0
 801b286:	6029      	str	r1, [r5, #0]
 801b288:	33f0      	adds	r3, #240	@ 0xf0
 801b28a:	2a00      	cmp	r2, #0
 801b28c:	d1f7      	bne.n	801b27e <fn_0801B180+0xfe>
 801b28e:	2300      	movs	r3, #0
 801b290:	7623      	strb	r3, [r4, #24]
 801b292:	e784      	b.n	801b19e <fn_0801B180+0x1e>
 801b294:	030064c4 	.word	0x030064c4
 801b298:	00005a30 	.word	0x00005a30
 801b29c:	081300d4 	.word	0x081300d4
 801b2a0:	040000d4 	.word	0x040000d4
 801b2a4:	040000d8 	.word	0x040000d8
 801b2a8:	040000dc 	.word	0x040000dc
