fn_08012118:
 8012118:	b5f0      	push	{r4, r5, r6, r7, lr}
 801211a:	2280      	movs	r2, #128	@ 0x80
 801211c:	464f      	mov	r7, r9
 801211e:	4646      	mov	r6, r8
 8012120:	46d6      	mov	lr, sl
 8012122:	6a04      	ldr	r4, [r0, #32]
 8012124:	b5c0      	push	{r6, r7, lr}
 8012126:	4689      	mov	r9, r1
 8012128:	04d2      	lsls	r2, r2, #19
 801212a:	0021      	movs	r1, r4
 801212c:	0005      	movs	r5, r0
 801212e:	f7fd fcc3 	bl	800fab8 <fn_0800FAB8>
 8012132:	4b3d      	ldr	r3, [pc, #244]	@ (8012228 <fn_08012118+0x110>)
 8012134:	4e3d      	ldr	r6, [pc, #244]	@ (801222c <fn_08012118+0x114>)
 8012136:	4698      	mov	r8, r3
 8012138:	681b      	ldr	r3, [r3, #0]
 801213a:	599b      	ldr	r3, [r3, r6]
 801213c:	0007      	movs	r7, r0
 801213e:	2b00      	cmp	r3, #0
 8012140:	d04c      	beq.n	80121dc <fn_08012118+0xc4>
 8012142:	2380      	movs	r3, #128	@ 0x80
 8012144:	696a      	ldr	r2, [r5, #20]
 8012146:	039b      	lsls	r3, r3, #14
 8012148:	18d2      	adds	r2, r2, r3
 801214a:	6929      	ldr	r1, [r5, #16]
 801214c:	464b      	mov	r3, r9
 801214e:	68e8      	ldr	r0, [r5, #12]
 8012150:	f7fe fe4c 	bl	8010dec <fn_08010DEC>
 8012154:	4643      	mov	r3, r8
 8012156:	681a      	ldr	r2, [r3, #0]
 8012158:	235a      	movs	r3, #90	@ 0x5a
 801215a:	5cc1      	ldrb	r1, [r0, r3]
 801215c:	23ea      	movs	r3, #234	@ 0xea
 801215e:	00db      	lsls	r3, r3, #3
 8012160:	58d3      	ldr	r3, [r2, r3]
 8012162:	225c      	movs	r2, #92	@ 0x5c
 8012164:	434a      	muls	r2, r1
 8012166:	189b      	adds	r3, r3, r2
 8012168:	6919      	ldr	r1, [r3, #16]
 801216a:	0006      	movs	r6, r0
 801216c:	2900      	cmp	r1, #0
 801216e:	d132      	bne.n	80121d6 <fn_08012118+0xbe>
 8012170:	0030      	movs	r0, r6
 8012172:	0029      	movs	r1, r5
 8012174:	3050      	adds	r0, #80	@ 0x50
 8012176:	f006 fa1b 	bl	80185b0 <fn_080185B0>
 801217a:	4643      	mov	r3, r8
 801217c:	681a      	ldr	r2, [r3, #0]
 801217e:	235a      	movs	r3, #90	@ 0x5a
 8012180:	6234      	str	r4, [r6, #32]
 8012182:	5cf1      	ldrb	r1, [r6, r3]
 8012184:	23ea      	movs	r3, #234	@ 0xea
 8012186:	00db      	lsls	r3, r3, #3
 8012188:	58d3      	ldr	r3, [r2, r3]
 801218a:	225c      	movs	r2, #92	@ 0x5c
 801218c:	434a      	muls	r2, r1
 801218e:	189b      	adds	r3, r3, r2
 8012190:	6bdd      	ldr	r5, [r3, #60]	@ 0x3c
 8012192:	2380      	movs	r3, #128	@ 0x80
 8012194:	4a26      	ldr	r2, [pc, #152]	@ (8012230 <fn_08012118+0x118>)
 8012196:	4690      	mov	r8, r2
 8012198:	0ce4      	lsrs	r4, r4, #19
 801219a:	011b      	lsls	r3, r3, #4
 801219c:	18e3      	adds	r3, r4, r3
 801219e:	009b      	lsls	r3, r3, #2
 80121a0:	58d1      	ldr	r1, [r2, r3]
 80121a2:	0028      	movs	r0, r5
 80121a4:	f013 fa1a 	bl	80255dc <fn_080255DC>
 80121a8:	4643      	mov	r3, r8
 80121aa:	00a4      	lsls	r4, r4, #2
 80121ac:	58e1      	ldr	r1, [r4, r3]
 80121ae:	63f0      	str	r0, [r6, #60]	@ 0x3c
 80121b0:	0028      	movs	r0, r5
 80121b2:	f013 fa13 	bl	80255dc <fn_080255DC>
 80121b6:	0039      	movs	r1, r7
 80121b8:	6430      	str	r0, [r6, #64]	@ 0x40
 80121ba:	0028      	movs	r0, r5
 80121bc:	f013 fa0e 	bl	80255dc <fn_080255DC>
 80121c0:	6470      	str	r0, [r6, #68]	@ 0x44
 80121c2:	0030      	movs	r0, r6
 80121c4:	f7ff fec6 	bl	8011f54 <fn_08011F54>
 80121c8:	bce0      	pop	{r5, r6, r7}
 80121ca:	46ba      	mov	sl, r7
 80121cc:	46b1      	mov	r9, r6
 80121ce:	46a8      	mov	r8, r5
 80121d0:	bcf0      	pop	{r4, r5, r6, r7}
 80121d2:	bc01      	pop	{r0}
 80121d4:	4700      	bx	r0
 80121d6:	f008 f877 	bl	801a2c8 <fn_0801A2C8>
 80121da:	e7c9      	b.n	8012170 <fn_08012118+0x58>
 80121dc:	2380      	movs	r3, #128	@ 0x80
 80121de:	04db      	lsls	r3, r3, #19
 80121e0:	469c      	mov	ip, r3
 80121e2:	2280      	movs	r2, #128	@ 0x80
 80121e4:	44a4      	add	ip, r4
 80121e6:	4661      	mov	r1, ip
 80121e8:	0028      	movs	r0, r5
 80121ea:	04d2      	lsls	r2, r2, #19
 80121ec:	46e2      	mov	sl, ip
 80121ee:	f7fd fc63 	bl	800fab8 <fn_0800FAB8>
 80121f2:	4643      	mov	r3, r8
 80121f4:	681b      	ldr	r3, [r3, #0]
 80121f6:	599b      	ldr	r3, [r3, r6]
 80121f8:	0007      	movs	r7, r0
 80121fa:	2b00      	cmp	r3, #0
 80121fc:	d111      	bne.n	8012222 <fn_08012118+0x10a>
 80121fe:	23fc      	movs	r3, #252	@ 0xfc
 8012200:	2280      	movs	r2, #128	@ 0x80
 8012202:	061b      	lsls	r3, r3, #24
 8012204:	18e4      	adds	r4, r4, r3
 8012206:	0021      	movs	r1, r4
 8012208:	0028      	movs	r0, r5
 801220a:	04d2      	lsls	r2, r2, #19
 801220c:	f7fd fc54 	bl	800fab8 <fn_0800FAB8>
 8012210:	4643      	mov	r3, r8
 8012212:	681b      	ldr	r3, [r3, #0]
 8012214:	599b      	ldr	r3, [r3, r6]
 8012216:	0007      	movs	r7, r0
 8012218:	2b00      	cmp	r3, #0
 801221a:	d192      	bne.n	8012142 <fn_08012118+0x2a>
 801221c:	2700      	movs	r7, #0
 801221e:	6a2c      	ldr	r4, [r5, #32]
 8012220:	e78f      	b.n	8012142 <fn_08012118+0x2a>
 8012222:	4654      	mov	r4, sl
 8012224:	e78d      	b.n	8012142 <fn_08012118+0x2a>
 8012226:	46c0      	nop			@ (mov r8, r8)
 8012228:	030064c4 	.word	0x030064c4
 801222c:	000008f4 	.word	0x000008f4
 8012230:	081397cc 	.word	0x081397cc
