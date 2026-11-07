fn_0800D14C:
 800d14c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800d14e:	46c6      	mov	lr, r8
 800d150:	694a      	ldr	r2, [r1, #20]
 800d152:	000c      	movs	r4, r1
 800d154:	6943      	ldr	r3, [r0, #20]
 800d156:	6b89      	ldr	r1, [r1, #56]	@ 0x38
 800d158:	1a9b      	subs	r3, r3, r2
 800d15a:	0005      	movs	r5, r0
 800d15c:	2201      	movs	r2, #1
 800d15e:	b500      	push	{lr}
 800d160:	4299      	cmp	r1, r3
 800d162:	db00      	blt.n	800d166 <fn_0800D14C+0x1a>
 800d164:	2200      	movs	r2, #0
 800d166:	0612      	lsls	r2, r2, #24
 800d168:	d105      	bne.n	800d176 <fn_0800D14C+0x2a>
 800d16a:	49bf      	ldr	r1, [pc, #764]	@ (800d468 <fn_0800D14C+0x31c>)
 800d16c:	2201      	movs	r2, #1
 800d16e:	428b      	cmp	r3, r1
 800d170:	da06      	bge.n	800d180 <fn_0800D14C+0x34>
 800d172:	0612      	lsls	r2, r2, #24
 800d174:	d007      	beq.n	800d186 <fn_0800D14C+0x3a>
 800d176:	bc80      	pop	{r7}
 800d178:	46b8      	mov	r8, r7
 800d17a:	bcf0      	pop	{r4, r5, r6, r7}
 800d17c:	bc01      	pop	{r0}
 800d17e:	4700      	bx	r0
 800d180:	2200      	movs	r2, #0
 800d182:	0612      	lsls	r2, r2, #24
 800d184:	d1f7      	bne.n	800d176 <fn_0800D14C+0x2a>
 800d186:	0020      	movs	r0, r4
 800d188:	f005 f854 	bl	8012234 <fn_08012234>
 800d18c:	2354      	movs	r3, #84	@ 0x54
 800d18e:	5ee3      	ldrsh	r3, [r4, r3]
 800d190:	0006      	movs	r6, r0
 800d192:	2b00      	cmp	r3, #0
 800d194:	ddef      	ble.n	800d176 <fn_0800D14C+0x2a>
 800d196:	6cab      	ldr	r3, [r5, #72]	@ 0x48
 800d198:	881b      	ldrh	r3, [r3, #0]
 800d19a:	3b37      	subs	r3, #55	@ 0x37
 800d19c:	041b      	lsls	r3, r3, #16
 800d19e:	0c1b      	lsrs	r3, r3, #16
 800d1a0:	2b26      	cmp	r3, #38	@ 0x26
 800d1a2:	d803      	bhi.n	800d1ac <fn_0800D14C+0x60>
 800d1a4:	4ab1      	ldr	r2, [pc, #708]	@ (800d46c <fn_0800D14C+0x320>)
 800d1a6:	009b      	lsls	r3, r3, #2
 800d1a8:	58d3      	ldr	r3, [r2, r3]
 800d1aa:	469f      	mov	pc, r3
 800d1ac:	48b0      	ldr	r0, [pc, #704]	@ (800d470 <fn_0800D14C+0x324>)
 800d1ae:	f7f3 f9fb 	bl	80005a8 <fn_080005A8>
 800d1b2:	4cb0      	ldr	r4, [pc, #704]	@ (800d474 <fn_0800D14C+0x328>)
 800d1b4:	4fb0      	ldr	r7, [pc, #704]	@ (800d478 <fn_0800D14C+0x32c>)
 800d1b6:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 800d1b8:	021b      	lsls	r3, r3, #8
 800d1ba:	d503      	bpl.n	800d1c4 <fn_0800D14C+0x78>
 800d1bc:	22b0      	movs	r2, #176	@ 0xb0
 800d1be:	58b3      	ldr	r3, [r6, r2]
 800d1c0:	3301      	adds	r3, #1
 800d1c2:	50b3      	str	r3, [r6, r2]
 800d1c4:	0028      	movs	r0, r5
 800d1c6:	f003 ff77 	bl	80110b8 <fn_080110B8>
 800d1ca:	22c0      	movs	r2, #192	@ 0xc0
 800d1cc:	58b3      	ldr	r3, [r6, r2]
 800d1ce:	3306      	adds	r3, #6
 800d1d0:	50b3      	str	r3, [r6, r2]
 800d1d2:	6823      	ldr	r3, [r4, #0]
 800d1d4:	33e0      	adds	r3, #224	@ 0xe0
 800d1d6:	429e      	cmp	r6, r3
 800d1d8:	d1cd      	bne.n	800d176 <fn_0800D14C+0x2a>
 800d1da:	0039      	movs	r1, r7
 800d1dc:	6830      	ldr	r0, [r6, #0]
 800d1de:	f00d f873 	bl	801a2c8 <fn_0801A2C8>
 800d1e2:	e7c8      	b.n	800d176 <fn_0800D14C+0x2a>
 800d1e4:	23eb      	movs	r3, #235	@ 0xeb
 800d1e6:	4ca3      	ldr	r4, [pc, #652]	@ (800d474 <fn_0800D14C+0x328>)
 800d1e8:	6822      	ldr	r2, [r4, #0]
 800d1ea:	00db      	lsls	r3, r3, #3
 800d1ec:	58d3      	ldr	r3, [r2, r3]
 800d1ee:	6919      	ldr	r1, [r3, #16]
 800d1f0:	2364      	movs	r3, #100	@ 0x64
 800d1f2:	434b      	muls	r3, r1
 800d1f4:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
 800d1f6:	4283      	cmp	r3, r0
 800d1f8:	ddbd      	ble.n	800d176 <fn_0800D14C+0x2a>
 800d1fa:	62f3      	str	r3, [r6, #44]	@ 0x2c
 800d1fc:	4b9f      	ldr	r3, [pc, #636]	@ (800d47c <fn_0800D14C+0x330>)
 800d1fe:	6331      	str	r1, [r6, #48]	@ 0x30
 800d200:	58d3      	ldr	r3, [r2, r3]
 800d202:	681a      	ldr	r2, [r3, #0]
 800d204:	189b      	adds	r3, r3, r2
 800d206:	22b8      	movs	r2, #184	@ 0xb8
 800d208:	50b3      	str	r3, [r6, r2]
 800d20a:	e7d3      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d20c:	23eb      	movs	r3, #235	@ 0xeb
 800d20e:	4c99      	ldr	r4, [pc, #612]	@ (800d474 <fn_0800D14C+0x328>)
 800d210:	6822      	ldr	r2, [r4, #0]
 800d212:	00db      	lsls	r3, r3, #3
 800d214:	58d3      	ldr	r3, [r2, r3]
 800d216:	6959      	ldr	r1, [r3, #20]
 800d218:	2364      	movs	r3, #100	@ 0x64
 800d21a:	434b      	muls	r3, r1
 800d21c:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
 800d21e:	4283      	cmp	r3, r0
 800d220:	dda9      	ble.n	800d176 <fn_0800D14C+0x2a>
 800d222:	62f3      	str	r3, [r6, #44]	@ 0x2c
 800d224:	4b95      	ldr	r3, [pc, #596]	@ (800d47c <fn_0800D14C+0x330>)
 800d226:	6331      	str	r1, [r6, #48]	@ 0x30
 800d228:	58d3      	ldr	r3, [r2, r3]
 800d22a:	685a      	ldr	r2, [r3, #4]
 800d22c:	189b      	adds	r3, r3, r2
 800d22e:	22b8      	movs	r2, #184	@ 0xb8
 800d230:	50b3      	str	r3, [r6, r2]
 800d232:	e7bf      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d234:	21eb      	movs	r1, #235	@ 0xeb
 800d236:	4c8f      	ldr	r4, [pc, #572]	@ (800d474 <fn_0800D14C+0x328>)
 800d238:	6822      	ldr	r2, [r4, #0]
 800d23a:	00c9      	lsls	r1, r1, #3
 800d23c:	5851      	ldr	r1, [r2, r1]
 800d23e:	6a83      	ldr	r3, [r0, #40]	@ 0x28
 800d240:	6889      	ldr	r1, [r1, #8]
 800d242:	3301      	adds	r3, #1
 800d244:	428b      	cmp	r3, r1
 800d246:	dd00      	ble.n	800d24a <fn_0800D14C+0xfe>
 800d248:	000b      	movs	r3, r1
 800d24a:	2154      	movs	r1, #84	@ 0x54
 800d24c:	6830      	ldr	r0, [r6, #0]
 800d24e:	62b3      	str	r3, [r6, #40]	@ 0x28
 800d250:	5243      	strh	r3, [r0, r1]
 800d252:	4b8a      	ldr	r3, [pc, #552]	@ (800d47c <fn_0800D14C+0x330>)
 800d254:	58d3      	ldr	r3, [r2, r3]
 800d256:	689a      	ldr	r2, [r3, #8]
 800d258:	189b      	adds	r3, r3, r2
 800d25a:	22b8      	movs	r2, #184	@ 0xb8
 800d25c:	50b3      	str	r3, [r6, r2]
 800d25e:	e7a9      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d260:	23eb      	movs	r3, #235	@ 0xeb
 800d262:	4c84      	ldr	r4, [pc, #528]	@ (800d474 <fn_0800D14C+0x328>)
 800d264:	6822      	ldr	r2, [r4, #0]
 800d266:	00db      	lsls	r3, r3, #3
 800d268:	58d1      	ldr	r1, [r2, r3]
 800d26a:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
 800d26c:	68c8      	ldr	r0, [r1, #12]
 800d26e:	3301      	adds	r3, #1
 800d270:	4283      	cmp	r3, r0
 800d272:	dd00      	ble.n	800d276 <fn_0800D14C+0x12a>
 800d274:	0003      	movs	r3, r0
 800d276:	62f3      	str	r3, [r6, #44]	@ 0x2c
 800d278:	6b33      	ldr	r3, [r6, #48]	@ 0x30
 800d27a:	2b00      	cmp	r3, #0
 800d27c:	d101      	bne.n	800d282 <fn_0800D14C+0x136>
 800d27e:	690b      	ldr	r3, [r1, #16]
 800d280:	6333      	str	r3, [r6, #48]	@ 0x30
 800d282:	4b7e      	ldr	r3, [pc, #504]	@ (800d47c <fn_0800D14C+0x330>)
 800d284:	58d3      	ldr	r3, [r2, r3]
 800d286:	68da      	ldr	r2, [r3, #12]
 800d288:	189b      	adds	r3, r3, r2
 800d28a:	22b8      	movs	r2, #184	@ 0xb8
 800d28c:	50b3      	str	r3, [r6, r2]
 800d28e:	e791      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d290:	224c      	movs	r2, #76	@ 0x4c
 800d292:	5c83      	ldrb	r3, [r0, r2]
 800d294:	2b00      	cmp	r3, #0
 800d296:	d18c      	bne.n	800d1b2 <fn_0800D14C+0x66>
 800d298:	4c76      	ldr	r4, [pc, #472]	@ (800d474 <fn_0800D14C+0x328>)
 800d29a:	4b78      	ldr	r3, [pc, #480]	@ (800d47c <fn_0800D14C+0x330>)
 800d29c:	6821      	ldr	r1, [r4, #0]
 800d29e:	58cb      	ldr	r3, [r1, r3]
 800d2a0:	6a19      	ldr	r1, [r3, #32]
 800d2a2:	185b      	adds	r3, r3, r1
 800d2a4:	21b8      	movs	r1, #184	@ 0xb8
 800d2a6:	5073      	str	r3, [r6, r1]
 800d2a8:	23c0      	movs	r3, #192	@ 0xc0
 800d2aa:	39b2      	subs	r1, #178	@ 0xb2
 800d2ac:	50f1      	str	r1, [r6, r3]
 800d2ae:	3bbf      	subs	r3, #191	@ 0xbf
 800d2b0:	54b3      	strb	r3, [r6, r2]
 800d2b2:	e77f      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d2b4:	224e      	movs	r2, #78	@ 0x4e
 800d2b6:	5c83      	ldrb	r3, [r0, r2]
 800d2b8:	2b00      	cmp	r3, #0
 800d2ba:	d000      	beq.n	800d2be <fn_0800D14C+0x172>
 800d2bc:	e779      	b.n	800d1b2 <fn_0800D14C+0x66>
 800d2be:	4c6d      	ldr	r4, [pc, #436]	@ (800d474 <fn_0800D14C+0x328>)
 800d2c0:	4b6e      	ldr	r3, [pc, #440]	@ (800d47c <fn_0800D14C+0x330>)
 800d2c2:	6821      	ldr	r1, [r4, #0]
 800d2c4:	58cb      	ldr	r3, [r1, r3]
 800d2c6:	6a99      	ldr	r1, [r3, #40]	@ 0x28
 800d2c8:	e7eb      	b.n	800d2a2 <fn_0800D14C+0x156>
 800d2ca:	224d      	movs	r2, #77	@ 0x4d
 800d2cc:	5c83      	ldrb	r3, [r0, r2]
 800d2ce:	2b00      	cmp	r3, #0
 800d2d0:	d000      	beq.n	800d2d4 <fn_0800D14C+0x188>
 800d2d2:	e76e      	b.n	800d1b2 <fn_0800D14C+0x66>
 800d2d4:	4c67      	ldr	r4, [pc, #412]	@ (800d474 <fn_0800D14C+0x328>)
 800d2d6:	4b69      	ldr	r3, [pc, #420]	@ (800d47c <fn_0800D14C+0x330>)
 800d2d8:	6821      	ldr	r1, [r4, #0]
 800d2da:	58cb      	ldr	r3, [r1, r3]
 800d2dc:	6a59      	ldr	r1, [r3, #36]	@ 0x24
 800d2de:	e7e0      	b.n	800d2a2 <fn_0800D14C+0x156>
 800d2e0:	224f      	movs	r2, #79	@ 0x4f
 800d2e2:	5c83      	ldrb	r3, [r0, r2]
 800d2e4:	2b00      	cmp	r3, #0
 800d2e6:	d000      	beq.n	800d2ea <fn_0800D14C+0x19e>
 800d2e8:	e763      	b.n	800d1b2 <fn_0800D14C+0x66>
 800d2ea:	4c62      	ldr	r4, [pc, #392]	@ (800d474 <fn_0800D14C+0x328>)
 800d2ec:	4b63      	ldr	r3, [pc, #396]	@ (800d47c <fn_0800D14C+0x330>)
 800d2ee:	6821      	ldr	r1, [r4, #0]
 800d2f0:	58cb      	ldr	r3, [r1, r3]
 800d2f2:	6ad9      	ldr	r1, [r3, #44]	@ 0x2c
 800d2f4:	e7d5      	b.n	800d2a2 <fn_0800D14C+0x156>
 800d2f6:	2251      	movs	r2, #81	@ 0x51
 800d2f8:	5c83      	ldrb	r3, [r0, r2]
 800d2fa:	2b00      	cmp	r3, #0
 800d2fc:	d000      	beq.n	800d300 <fn_0800D14C+0x1b4>
 800d2fe:	e758      	b.n	800d1b2 <fn_0800D14C+0x66>
 800d300:	4c5c      	ldr	r4, [pc, #368]	@ (800d474 <fn_0800D14C+0x328>)
 800d302:	4b5e      	ldr	r3, [pc, #376]	@ (800d47c <fn_0800D14C+0x330>)
 800d304:	6821      	ldr	r1, [r4, #0]
 800d306:	58cb      	ldr	r3, [r1, r3]
 800d308:	6b59      	ldr	r1, [r3, #52]	@ 0x34
 800d30a:	e7ca      	b.n	800d2a2 <fn_0800D14C+0x156>
 800d30c:	2250      	movs	r2, #80	@ 0x50
 800d30e:	5c83      	ldrb	r3, [r0, r2]
 800d310:	2b00      	cmp	r3, #0
 800d312:	d000      	beq.n	800d316 <fn_0800D14C+0x1ca>
 800d314:	e74d      	b.n	800d1b2 <fn_0800D14C+0x66>
 800d316:	4c57      	ldr	r4, [pc, #348]	@ (800d474 <fn_0800D14C+0x328>)
 800d318:	4b58      	ldr	r3, [pc, #352]	@ (800d47c <fn_0800D14C+0x330>)
 800d31a:	6821      	ldr	r1, [r4, #0]
 800d31c:	58cb      	ldr	r3, [r1, r3]
 800d31e:	6b19      	ldr	r1, [r3, #48]	@ 0x30
 800d320:	e7bf      	b.n	800d2a2 <fn_0800D14C+0x156>
 800d322:	6a83      	ldr	r3, [r0, #40]	@ 0x28
 800d324:	2b63      	cmp	r3, #99	@ 0x63
 800d326:	dd00      	ble.n	800d32a <fn_0800D14C+0x1de>
 800d328:	e725      	b.n	800d176 <fn_0800D14C+0x2a>
 800d32a:	330a      	adds	r3, #10
 800d32c:	2b64      	cmp	r3, #100	@ 0x64
 800d32e:	dd00      	ble.n	800d332 <fn_0800D14C+0x1e6>
 800d330:	2364      	movs	r3, #100	@ 0x64
 800d332:	2254      	movs	r2, #84	@ 0x54
 800d334:	6831      	ldr	r1, [r6, #0]
 800d336:	4c4f      	ldr	r4, [pc, #316]	@ (800d474 <fn_0800D14C+0x328>)
 800d338:	62b3      	str	r3, [r6, #40]	@ 0x28
 800d33a:	528b      	strh	r3, [r1, r2]
 800d33c:	6822      	ldr	r2, [r4, #0]
 800d33e:	4b4f      	ldr	r3, [pc, #316]	@ (800d47c <fn_0800D14C+0x330>)
 800d340:	58d3      	ldr	r3, [r2, r3]
 800d342:	691a      	ldr	r2, [r3, #16]
 800d344:	189b      	adds	r3, r3, r2
 800d346:	22b8      	movs	r2, #184	@ 0xb8
 800d348:	50b3      	str	r3, [r6, r2]
 800d34a:	e733      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d34c:	6a83      	ldr	r3, [r0, #40]	@ 0x28
 800d34e:	2b63      	cmp	r3, #99	@ 0x63
 800d350:	dd00      	ble.n	800d354 <fn_0800D14C+0x208>
 800d352:	e710      	b.n	800d176 <fn_0800D14C+0x2a>
 800d354:	4c47      	ldr	r4, [pc, #284]	@ (800d474 <fn_0800D14C+0x328>)
 800d356:	3319      	adds	r3, #25
 800d358:	6802      	ldr	r2, [r0, #0]
 800d35a:	6821      	ldr	r1, [r4, #0]
 800d35c:	2b64      	cmp	r3, #100	@ 0x64
 800d35e:	dd00      	ble.n	800d362 <fn_0800D14C+0x216>
 800d360:	e2f3      	b.n	800d94a <fn_0800D14C+0x7fe>
 800d362:	6283      	str	r3, [r0, #40]	@ 0x28
 800d364:	2054      	movs	r0, #84	@ 0x54
 800d366:	5213      	strh	r3, [r2, r0]
 800d368:	4a44      	ldr	r2, [pc, #272]	@ (800d47c <fn_0800D14C+0x330>)
 800d36a:	588a      	ldr	r2, [r1, r2]
 800d36c:	2b31      	cmp	r3, #49	@ 0x31
 800d36e:	dd00      	ble.n	800d372 <fn_0800D14C+0x226>
 800d370:	e2ef      	b.n	800d952 <fn_0800D14C+0x806>
 800d372:	6993      	ldr	r3, [r2, #24]
 800d374:	18d2      	adds	r2, r2, r3
 800d376:	23b8      	movs	r3, #184	@ 0xb8
 800d378:	50f2      	str	r2, [r6, r3]
 800d37a:	e71b      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d37c:	23eb      	movs	r3, #235	@ 0xeb
 800d37e:	4c3d      	ldr	r4, [pc, #244]	@ (800d474 <fn_0800D14C+0x328>)
 800d380:	6822      	ldr	r2, [r4, #0]
 800d382:	00db      	lsls	r3, r3, #3
 800d384:	58d1      	ldr	r1, [r2, r3]
 800d386:	6a83      	ldr	r3, [r0, #40]	@ 0x28
 800d388:	69c8      	ldr	r0, [r1, #28]
 800d38a:	6989      	ldr	r1, [r1, #24]
 800d38c:	181b      	adds	r3, r3, r0
 800d38e:	428b      	cmp	r3, r1
 800d390:	dd00      	ble.n	800d394 <fn_0800D14C+0x248>
 800d392:	000b      	movs	r3, r1
 800d394:	2154      	movs	r1, #84	@ 0x54
 800d396:	6830      	ldr	r0, [r6, #0]
 800d398:	62b3      	str	r3, [r6, #40]	@ 0x28
 800d39a:	5243      	strh	r3, [r0, r1]
 800d39c:	4b37      	ldr	r3, [pc, #220]	@ (800d47c <fn_0800D14C+0x330>)
 800d39e:	58d3      	ldr	r3, [r2, r3]
 800d3a0:	69da      	ldr	r2, [r3, #28]
 800d3a2:	189b      	adds	r3, r3, r2
 800d3a4:	22b8      	movs	r2, #184	@ 0xb8
 800d3a6:	50b3      	str	r3, [r6, r2]
 800d3a8:	4f35      	ldr	r7, [pc, #212]	@ (800d480 <fn_0800D14C+0x334>)
 800d3aa:	e704      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d3ac:	6b43      	ldr	r3, [r0, #52]	@ 0x34
 800d3ae:	2b00      	cmp	r3, #0
 800d3b0:	db01      	blt.n	800d3b6 <fn_0800D14C+0x26a>
 800d3b2:	4b34      	ldr	r3, [pc, #208]	@ (800d484 <fn_0800D14C+0x338>)
 800d3b4:	6343      	str	r3, [r0, #52]	@ 0x34
 800d3b6:	4c2f      	ldr	r4, [pc, #188]	@ (800d474 <fn_0800D14C+0x328>)
 800d3b8:	4b30      	ldr	r3, [pc, #192]	@ (800d47c <fn_0800D14C+0x330>)
 800d3ba:	6822      	ldr	r2, [r4, #0]
 800d3bc:	58d3      	ldr	r3, [r2, r3]
 800d3be:	6b9a      	ldr	r2, [r3, #56]	@ 0x38
 800d3c0:	189b      	adds	r3, r3, r2
 800d3c2:	22b8      	movs	r2, #184	@ 0xb8
 800d3c4:	4f2e      	ldr	r7, [pc, #184]	@ (800d480 <fn_0800D14C+0x334>)
 800d3c6:	50b3      	str	r3, [r6, r2]
 800d3c8:	e6f5      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d3ca:	2294      	movs	r2, #148	@ 0x94
 800d3cc:	4c29      	ldr	r4, [pc, #164]	@ (800d474 <fn_0800D14C+0x328>)
 800d3ce:	6823      	ldr	r3, [r4, #0]
 800d3d0:	5c9a      	ldrb	r2, [r3, r2]
 800d3d2:	2a02      	cmp	r2, #2
 800d3d4:	d000      	beq.n	800d3d8 <fn_0800D14C+0x28c>
 800d3d6:	e6ce      	b.n	800d176 <fn_0800D14C+0x2a>
 800d3d8:	22eb      	movs	r2, #235	@ 0xeb
 800d3da:	00d2      	lsls	r2, r2, #3
 800d3dc:	589a      	ldr	r2, [r3, r2]
 800d3de:	6a11      	ldr	r1, [r2, #32]
 800d3e0:	6281      	str	r1, [r0, #40]	@ 0x28
 800d3e2:	6800      	ldr	r0, [r0, #0]
 800d3e4:	0007      	movs	r7, r0
 800d3e6:	2054      	movs	r0, #84	@ 0x54
 800d3e8:	5239      	strh	r1, [r7, r0]
 800d3ea:	6951      	ldr	r1, [r2, #20]
 800d3ec:	2264      	movs	r2, #100	@ 0x64
 800d3ee:	434a      	muls	r2, r1
 800d3f0:	6af0      	ldr	r0, [r6, #44]	@ 0x2c
 800d3f2:	4282      	cmp	r2, r0
 800d3f4:	dd01      	ble.n	800d3fa <fn_0800D14C+0x2ae>
 800d3f6:	6331      	str	r1, [r6, #48]	@ 0x30
 800d3f8:	62f2      	str	r2, [r6, #44]	@ 0x2c
 800d3fa:	4a20      	ldr	r2, [pc, #128]	@ (800d47c <fn_0800D14C+0x330>)
 800d3fc:	589b      	ldr	r3, [r3, r2]
 800d3fe:	6d1a      	ldr	r2, [r3, #80]	@ 0x50
 800d400:	189b      	adds	r3, r3, r2
 800d402:	22b8      	movs	r2, #184	@ 0xb8
 800d404:	4f1e      	ldr	r7, [pc, #120]	@ (800d480 <fn_0800D14C+0x334>)
 800d406:	50b3      	str	r3, [r6, r2]
 800d408:	e6d5      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d40a:	6c03      	ldr	r3, [r0, #64]	@ 0x40
 800d40c:	2b00      	cmp	r3, #0
 800d40e:	db01      	blt.n	800d414 <fn_0800D14C+0x2c8>
 800d410:	4b1d      	ldr	r3, [pc, #116]	@ (800d488 <fn_0800D14C+0x33c>)
 800d412:	6403      	str	r3, [r0, #64]	@ 0x40
 800d414:	4c17      	ldr	r4, [pc, #92]	@ (800d474 <fn_0800D14C+0x328>)
 800d416:	4b19      	ldr	r3, [pc, #100]	@ (800d47c <fn_0800D14C+0x330>)
 800d418:	6822      	ldr	r2, [r4, #0]
 800d41a:	58d3      	ldr	r3, [r2, r3]
 800d41c:	6c5a      	ldr	r2, [r3, #68]	@ 0x44
 800d41e:	189b      	adds	r3, r3, r2
 800d420:	22b8      	movs	r2, #184	@ 0xb8
 800d422:	4f17      	ldr	r7, [pc, #92]	@ (800d480 <fn_0800D14C+0x334>)
 800d424:	50b3      	str	r3, [r6, r2]
 800d426:	e6c6      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d428:	6c43      	ldr	r3, [r0, #68]	@ 0x44
 800d42a:	2b00      	cmp	r3, #0
 800d42c:	d000      	beq.n	800d430 <fn_0800D14C+0x2e4>
 800d42e:	e6a2      	b.n	800d176 <fn_0800D14C+0x2a>
 800d430:	4c10      	ldr	r4, [pc, #64]	@ (800d474 <fn_0800D14C+0x328>)
 800d432:	3301      	adds	r3, #1
 800d434:	6443      	str	r3, [r0, #68]	@ 0x44
 800d436:	6822      	ldr	r2, [r4, #0]
 800d438:	4b10      	ldr	r3, [pc, #64]	@ (800d47c <fn_0800D14C+0x330>)
 800d43a:	58d3      	ldr	r3, [r2, r3]
 800d43c:	6c9a      	ldr	r2, [r3, #72]	@ 0x48
 800d43e:	189b      	adds	r3, r3, r2
 800d440:	22b8      	movs	r2, #184	@ 0xb8
 800d442:	4f0f      	ldr	r7, [pc, #60]	@ (800d480 <fn_0800D14C+0x334>)
 800d444:	5083      	str	r3, [r0, r2]
 800d446:	e6b6      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d448:	6c83      	ldr	r3, [r0, #72]	@ 0x48
 800d44a:	2b00      	cmp	r3, #0
 800d44c:	db01      	blt.n	800d452 <fn_0800D14C+0x306>
 800d44e:	4b0f      	ldr	r3, [pc, #60]	@ (800d48c <fn_0800D14C+0x340>)
 800d450:	6483      	str	r3, [r0, #72]	@ 0x48
 800d452:	4c08      	ldr	r4, [pc, #32]	@ (800d474 <fn_0800D14C+0x328>)
 800d454:	4b09      	ldr	r3, [pc, #36]	@ (800d47c <fn_0800D14C+0x330>)
 800d456:	6822      	ldr	r2, [r4, #0]
 800d458:	58d3      	ldr	r3, [r2, r3]
 800d45a:	6cda      	ldr	r2, [r3, #76]	@ 0x4c
 800d45c:	189b      	adds	r3, r3, r2
 800d45e:	22b8      	movs	r2, #184	@ 0xb8
 800d460:	4f07      	ldr	r7, [pc, #28]	@ (800d480 <fn_0800D14C+0x334>)
 800d462:	50b3      	str	r3, [r6, r2]
 800d464:	e6a7      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d466:	46c0      	nop			@ (mov r8, r8)
 800d468:	fff80000 	.word	0xfff80000
 800d46c:	0812e5e0 	.word	0x0812e5e0
 800d470:	08149edc 	.word	0x08149edc
 800d474:	030064c4 	.word	0x030064c4
 800d478:	00008020 	.word	0x00008020
 800d47c:	0000075c 	.word	0x0000075c
 800d480:	0000805d 	.word	0x0000805d
 800d484:	0000041a 	.word	0x0000041a
 800d488:	00000834 	.word	0x00000834
 800d48c:	00001068 	.word	0x00001068
 800d490:	6a83      	ldr	r3, [r0, #40]	@ 0x28
 800d492:	2b63      	cmp	r3, #99	@ 0x63
 800d494:	dc07      	bgt.n	800d4a6 <fn_0800D14C+0x35a>
 800d496:	3364      	adds	r3, #100	@ 0x64
 800d498:	2b64      	cmp	r3, #100	@ 0x64
 800d49a:	dd00      	ble.n	800d49e <fn_0800D14C+0x352>
 800d49c:	2364      	movs	r3, #100	@ 0x64
 800d49e:	2254      	movs	r2, #84	@ 0x54
 800d4a0:	6831      	ldr	r1, [r6, #0]
 800d4a2:	62b3      	str	r3, [r6, #40]	@ 0x28
 800d4a4:	528b      	strh	r3, [r1, r2]
 800d4a6:	6bb3      	ldr	r3, [r6, #56]	@ 0x38
 800d4a8:	2b00      	cmp	r3, #0
 800d4aa:	db01      	blt.n	800d4b0 <fn_0800D14C+0x364>
 800d4ac:	2301      	movs	r3, #1
 800d4ae:	63b3      	str	r3, [r6, #56]	@ 0x38
 800d4b0:	4cc5      	ldr	r4, [pc, #788]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d4b2:	4bc6      	ldr	r3, [pc, #792]	@ (800d7cc <fn_0800D14C+0x680>)
 800d4b4:	6822      	ldr	r2, [r4, #0]
 800d4b6:	58d3      	ldr	r3, [r2, r3]
 800d4b8:	6bda      	ldr	r2, [r3, #60]	@ 0x3c
 800d4ba:	189b      	adds	r3, r3, r2
 800d4bc:	22b8      	movs	r2, #184	@ 0xb8
 800d4be:	50b3      	str	r3, [r6, r2]
 800d4c0:	2353      	movs	r3, #83	@ 0x53
 800d4c2:	5cf3      	ldrb	r3, [r6, r3]
 800d4c4:	2b00      	cmp	r3, #0
 800d4c6:	d100      	bne.n	800d4ca <fn_0800D14C+0x37e>
 800d4c8:	e76e      	b.n	800d3a8 <fn_0800D14C+0x25c>
 800d4ca:	2354      	movs	r3, #84	@ 0x54
 800d4cc:	2200      	movs	r2, #0
 800d4ce:	4fc0      	ldr	r7, [pc, #768]	@ (800d7d0 <fn_0800D14C+0x684>)
 800d4d0:	54f2      	strb	r2, [r6, r3]
 800d4d2:	e670      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d4d4:	2380      	movs	r3, #128	@ 0x80
 800d4d6:	6802      	ldr	r2, [r0, #0]
 800d4d8:	6cd1      	ldr	r1, [r2, #76]	@ 0x4c
 800d4da:	02db      	lsls	r3, r3, #11
 800d4dc:	430b      	orrs	r3, r1
 800d4de:	64d3      	str	r3, [r2, #76]	@ 0x4c
 800d4e0:	6bc3      	ldr	r3, [r0, #60]	@ 0x3c
 800d4e2:	2b00      	cmp	r3, #0
 800d4e4:	db01      	blt.n	800d4ea <fn_0800D14C+0x39e>
 800d4e6:	4bbb      	ldr	r3, [pc, #748]	@ (800d7d4 <fn_0800D14C+0x688>)
 800d4e8:	63c3      	str	r3, [r0, #60]	@ 0x3c
 800d4ea:	4cb7      	ldr	r4, [pc, #732]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d4ec:	4bb7      	ldr	r3, [pc, #732]	@ (800d7cc <fn_0800D14C+0x680>)
 800d4ee:	6822      	ldr	r2, [r4, #0]
 800d4f0:	58d3      	ldr	r3, [r2, r3]
 800d4f2:	6c1a      	ldr	r2, [r3, #64]	@ 0x40
 800d4f4:	189b      	adds	r3, r3, r2
 800d4f6:	22b8      	movs	r2, #184	@ 0xb8
 800d4f8:	4fb5      	ldr	r7, [pc, #724]	@ (800d7d0 <fn_0800D14C+0x684>)
 800d4fa:	50b3      	str	r3, [r6, r2]
 800d4fc:	e65b      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d4fe:	238c      	movs	r3, #140	@ 0x8c
 800d500:	58c1      	ldr	r1, [r0, r3]
 800d502:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 800d504:	6fc2      	ldr	r2, [r0, #124]	@ 0x7c
 800d506:	039b      	lsls	r3, r3, #14
 800d508:	d400      	bmi.n	800d50c <fn_0800D14C+0x3c0>
 800d50a:	e213      	b.n	800d934 <fn_0800D14C+0x7e8>
 800d50c:	4291      	cmp	r1, r2
 800d50e:	d100      	bne.n	800d512 <fn_0800D14C+0x3c6>
 800d510:	e631      	b.n	800d176 <fn_0800D14C+0x2a>
 800d512:	23eb      	movs	r3, #235	@ 0xeb
 800d514:	4cac      	ldr	r4, [pc, #688]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d516:	6820      	ldr	r0, [r4, #0]
 800d518:	00db      	lsls	r3, r3, #3
 800d51a:	58c3      	ldr	r3, [r0, r3]
 800d51c:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 800d51e:	469c      	mov	ip, r3
 800d520:	0fdb      	lsrs	r3, r3, #31
 800d522:	4463      	add	r3, ip
 800d524:	105b      	asrs	r3, r3, #1
 800d526:	27d6      	movs	r7, #214	@ 0xd6
 800d528:	4698      	mov	r8, r3
 800d52a:	2304      	movs	r3, #4
 800d52c:	5dc7      	ldrb	r7, [r0, r7]
 800d52e:	439f      	bics	r7, r3
 800d530:	d102      	bne.n	800d538 <fn_0800D14C+0x3ec>
 800d532:	4643      	mov	r3, r8
 800d534:	005b      	lsls	r3, r3, #1
 800d536:	4698      	mov	r8, r3
 800d538:	4643      	mov	r3, r8
 800d53a:	18d3      	adds	r3, r2, r3
 800d53c:	428b      	cmp	r3, r1
 800d53e:	dd00      	ble.n	800d542 <fn_0800D14C+0x3f6>
 800d540:	000b      	movs	r3, r1
 800d542:	67f3      	str	r3, [r6, #124]	@ 0x7c
 800d544:	2a00      	cmp	r2, #0
 800d546:	d10a      	bne.n	800d55e <fn_0800D14C+0x412>
 800d548:	2353      	movs	r3, #83	@ 0x53
 800d54a:	5cf3      	ldrb	r3, [r6, r3]
 800d54c:	2b00      	cmp	r3, #0
 800d54e:	d106      	bne.n	800d55e <fn_0800D14C+0x412>
 800d550:	6e73      	ldr	r3, [r6, #100]	@ 0x64
 800d552:	4293      	cmp	r3, r2
 800d554:	d100      	bne.n	800d558 <fn_0800D14C+0x40c>
 800d556:	e223      	b.n	800d9a0 <fn_0800D14C+0x854>
 800d558:	2354      	movs	r3, #84	@ 0x54
 800d55a:	3203      	adds	r2, #3
 800d55c:	54f2      	strb	r2, [r6, r3]
 800d55e:	4b9b      	ldr	r3, [pc, #620]	@ (800d7cc <fn_0800D14C+0x680>)
 800d560:	58c3      	ldr	r3, [r0, r3]
 800d562:	6d5a      	ldr	r2, [r3, #84]	@ 0x54
 800d564:	189b      	adds	r3, r3, r2
 800d566:	22b8      	movs	r2, #184	@ 0xb8
 800d568:	50b3      	str	r3, [r6, r2]
 800d56a:	e623      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d56c:	238c      	movs	r3, #140	@ 0x8c
 800d56e:	6fc2      	ldr	r2, [r0, #124]	@ 0x7c
 800d570:	58c3      	ldr	r3, [r0, r3]
 800d572:	469c      	mov	ip, r3
 800d574:	429a      	cmp	r2, r3
 800d576:	d100      	bne.n	800d57a <fn_0800D14C+0x42e>
 800d578:	e5fd      	b.n	800d176 <fn_0800D14C+0x2a>
 800d57a:	23eb      	movs	r3, #235	@ 0xeb
 800d57c:	4c92      	ldr	r4, [pc, #584]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d57e:	6820      	ldr	r0, [r4, #0]
 800d580:	00db      	lsls	r3, r3, #3
 800d582:	58c3      	ldr	r3, [r0, r3]
 800d584:	6c59      	ldr	r1, [r3, #68]	@ 0x44
 800d586:	008b      	lsls	r3, r1, #2
 800d588:	185b      	adds	r3, r3, r1
 800d58a:	21d6      	movs	r1, #214	@ 0xd6
 800d58c:	2704      	movs	r7, #4
 800d58e:	5c41      	ldrb	r1, [r0, r1]
 800d590:	43b9      	bics	r1, r7
 800d592:	d100      	bne.n	800d596 <fn_0800D14C+0x44a>
 800d594:	005b      	lsls	r3, r3, #1
 800d596:	18d3      	adds	r3, r2, r3
 800d598:	4563      	cmp	r3, ip
 800d59a:	dd00      	ble.n	800d59e <fn_0800D14C+0x452>
 800d59c:	4663      	mov	r3, ip
 800d59e:	67f3      	str	r3, [r6, #124]	@ 0x7c
 800d5a0:	2a00      	cmp	r2, #0
 800d5a2:	d10a      	bne.n	800d5ba <fn_0800D14C+0x46e>
 800d5a4:	2353      	movs	r3, #83	@ 0x53
 800d5a6:	5cf3      	ldrb	r3, [r6, r3]
 800d5a8:	2b00      	cmp	r3, #0
 800d5aa:	d106      	bne.n	800d5ba <fn_0800D14C+0x46e>
 800d5ac:	6e73      	ldr	r3, [r6, #100]	@ 0x64
 800d5ae:	2b00      	cmp	r3, #0
 800d5b0:	d100      	bne.n	800d5b4 <fn_0800D14C+0x468>
 800d5b2:	e1f9      	b.n	800d9a8 <fn_0800D14C+0x85c>
 800d5b4:	2354      	movs	r3, #84	@ 0x54
 800d5b6:	3203      	adds	r2, #3
 800d5b8:	54f2      	strb	r2, [r6, r3]
 800d5ba:	4b84      	ldr	r3, [pc, #528]	@ (800d7cc <fn_0800D14C+0x680>)
 800d5bc:	58c3      	ldr	r3, [r0, r3]
 800d5be:	6d9a      	ldr	r2, [r3, #88]	@ 0x58
 800d5c0:	189b      	adds	r3, r3, r2
 800d5c2:	22b8      	movs	r2, #184	@ 0xb8
 800d5c4:	50b3      	str	r3, [r6, r2]
 800d5c6:	e5f5      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d5c8:	2388      	movs	r3, #136	@ 0x88
 800d5ca:	58c2      	ldr	r2, [r0, r3]
 800d5cc:	3310      	adds	r3, #16
 800d5ce:	58c3      	ldr	r3, [r0, r3]
 800d5d0:	469c      	mov	ip, r3
 800d5d2:	429a      	cmp	r2, r3
 800d5d4:	d100      	bne.n	800d5d8 <fn_0800D14C+0x48c>
 800d5d6:	e5ce      	b.n	800d176 <fn_0800D14C+0x2a>
 800d5d8:	23eb      	movs	r3, #235	@ 0xeb
 800d5da:	21d6      	movs	r1, #214	@ 0xd6
 800d5dc:	2704      	movs	r7, #4
 800d5de:	4c7a      	ldr	r4, [pc, #488]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d5e0:	6820      	ldr	r0, [r4, #0]
 800d5e2:	00db      	lsls	r3, r3, #3
 800d5e4:	58c3      	ldr	r3, [r0, r3]
 800d5e6:	5c41      	ldrb	r1, [r0, r1]
 800d5e8:	6d1b      	ldr	r3, [r3, #80]	@ 0x50
 800d5ea:	43b9      	bics	r1, r7
 800d5ec:	d100      	bne.n	800d5f0 <fn_0800D14C+0x4a4>
 800d5ee:	005b      	lsls	r3, r3, #1
 800d5f0:	18d3      	adds	r3, r2, r3
 800d5f2:	4563      	cmp	r3, ip
 800d5f4:	dd00      	ble.n	800d5f8 <fn_0800D14C+0x4ac>
 800d5f6:	4663      	mov	r3, ip
 800d5f8:	2188      	movs	r1, #136	@ 0x88
 800d5fa:	5073      	str	r3, [r6, r1]
 800d5fc:	2a00      	cmp	r2, #0
 800d5fe:	d109      	bne.n	800d614 <fn_0800D14C+0x4c8>
 800d600:	2353      	movs	r3, #83	@ 0x53
 800d602:	5cf3      	ldrb	r3, [r6, r3]
 800d604:	2b00      	cmp	r3, #0
 800d606:	d105      	bne.n	800d614 <fn_0800D14C+0x4c8>
 800d608:	6eb3      	ldr	r3, [r6, #104]	@ 0x68
 800d60a:	2b00      	cmp	r3, #0
 800d60c:	d002      	beq.n	800d614 <fn_0800D14C+0x4c8>
 800d60e:	2354      	movs	r3, #84	@ 0x54
 800d610:	3204      	adds	r2, #4
 800d612:	54f2      	strb	r2, [r6, r3]
 800d614:	4b6d      	ldr	r3, [pc, #436]	@ (800d7cc <fn_0800D14C+0x680>)
 800d616:	58c3      	ldr	r3, [r0, r3]
 800d618:	6dda      	ldr	r2, [r3, #92]	@ 0x5c
 800d61a:	189b      	adds	r3, r3, r2
 800d61c:	22b8      	movs	r2, #184	@ 0xb8
 800d61e:	50b3      	str	r3, [r6, r2]
 800d620:	e5c8      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d622:	2388      	movs	r3, #136	@ 0x88
 800d624:	58c2      	ldr	r2, [r0, r3]
 800d626:	3310      	adds	r3, #16
 800d628:	58c3      	ldr	r3, [r0, r3]
 800d62a:	469c      	mov	ip, r3
 800d62c:	429a      	cmp	r2, r3
 800d62e:	d100      	bne.n	800d632 <fn_0800D14C+0x4e6>
 800d630:	e5a1      	b.n	800d176 <fn_0800D14C+0x2a>
 800d632:	23eb      	movs	r3, #235	@ 0xeb
 800d634:	4c64      	ldr	r4, [pc, #400]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d636:	6820      	ldr	r0, [r4, #0]
 800d638:	00db      	lsls	r3, r3, #3
 800d63a:	58c3      	ldr	r3, [r0, r3]
 800d63c:	6d19      	ldr	r1, [r3, #80]	@ 0x50
 800d63e:	008b      	lsls	r3, r1, #2
 800d640:	185b      	adds	r3, r3, r1
 800d642:	21d6      	movs	r1, #214	@ 0xd6
 800d644:	2704      	movs	r7, #4
 800d646:	5c41      	ldrb	r1, [r0, r1]
 800d648:	43b9      	bics	r1, r7
 800d64a:	d100      	bne.n	800d64e <fn_0800D14C+0x502>
 800d64c:	005b      	lsls	r3, r3, #1
 800d64e:	18d3      	adds	r3, r2, r3
 800d650:	4563      	cmp	r3, ip
 800d652:	dd00      	ble.n	800d656 <fn_0800D14C+0x50a>
 800d654:	4663      	mov	r3, ip
 800d656:	2188      	movs	r1, #136	@ 0x88
 800d658:	5073      	str	r3, [r6, r1]
 800d65a:	2a00      	cmp	r2, #0
 800d65c:	d109      	bne.n	800d672 <fn_0800D14C+0x526>
 800d65e:	2353      	movs	r3, #83	@ 0x53
 800d660:	5cf3      	ldrb	r3, [r6, r3]
 800d662:	2b00      	cmp	r3, #0
 800d664:	d105      	bne.n	800d672 <fn_0800D14C+0x526>
 800d666:	6eb3      	ldr	r3, [r6, #104]	@ 0x68
 800d668:	2b00      	cmp	r3, #0
 800d66a:	d002      	beq.n	800d672 <fn_0800D14C+0x526>
 800d66c:	2354      	movs	r3, #84	@ 0x54
 800d66e:	3204      	adds	r2, #4
 800d670:	54f2      	strb	r2, [r6, r3]
 800d672:	4b56      	ldr	r3, [pc, #344]	@ (800d7cc <fn_0800D14C+0x680>)
 800d674:	58c3      	ldr	r3, [r0, r3]
 800d676:	6e1a      	ldr	r2, [r3, #96]	@ 0x60
 800d678:	189b      	adds	r3, r3, r2
 800d67a:	22b8      	movs	r2, #184	@ 0xb8
 800d67c:	50b3      	str	r3, [r6, r2]
 800d67e:	e599      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d680:	2384      	movs	r3, #132	@ 0x84
 800d682:	58c2      	ldr	r2, [r0, r3]
 800d684:	3310      	adds	r3, #16
 800d686:	58c3      	ldr	r3, [r0, r3]
 800d688:	469c      	mov	ip, r3
 800d68a:	429a      	cmp	r2, r3
 800d68c:	d100      	bne.n	800d690 <fn_0800D14C+0x544>
 800d68e:	e572      	b.n	800d176 <fn_0800D14C+0x2a>
 800d690:	23eb      	movs	r3, #235	@ 0xeb
 800d692:	21d6      	movs	r1, #214	@ 0xd6
 800d694:	2704      	movs	r7, #4
 800d696:	4c4c      	ldr	r4, [pc, #304]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d698:	6820      	ldr	r0, [r4, #0]
 800d69a:	00db      	lsls	r3, r3, #3
 800d69c:	58c3      	ldr	r3, [r0, r3]
 800d69e:	5c41      	ldrb	r1, [r0, r1]
 800d6a0:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 800d6a2:	43b9      	bics	r1, r7
 800d6a4:	d100      	bne.n	800d6a8 <fn_0800D14C+0x55c>
 800d6a6:	005b      	lsls	r3, r3, #1
 800d6a8:	18d3      	adds	r3, r2, r3
 800d6aa:	4563      	cmp	r3, ip
 800d6ac:	dd00      	ble.n	800d6b0 <fn_0800D14C+0x564>
 800d6ae:	4663      	mov	r3, ip
 800d6b0:	2184      	movs	r1, #132	@ 0x84
 800d6b2:	5073      	str	r3, [r6, r1]
 800d6b4:	2a00      	cmp	r2, #0
 800d6b6:	d104      	bne.n	800d6c2 <fn_0800D14C+0x576>
 800d6b8:	2353      	movs	r3, #83	@ 0x53
 800d6ba:	5cf3      	ldrb	r3, [r6, r3]
 800d6bc:	2b01      	cmp	r3, #1
 800d6be:	d800      	bhi.n	800d6c2 <fn_0800D14C+0x576>
 800d6c0:	e166      	b.n	800d990 <fn_0800D14C+0x844>
 800d6c2:	4b42      	ldr	r3, [pc, #264]	@ (800d7cc <fn_0800D14C+0x680>)
 800d6c4:	58c3      	ldr	r3, [r0, r3]
 800d6c6:	6e5a      	ldr	r2, [r3, #100]	@ 0x64
 800d6c8:	189b      	adds	r3, r3, r2
 800d6ca:	22b8      	movs	r2, #184	@ 0xb8
 800d6cc:	50b3      	str	r3, [r6, r2]
 800d6ce:	e571      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d6d0:	2384      	movs	r3, #132	@ 0x84
 800d6d2:	58c2      	ldr	r2, [r0, r3]
 800d6d4:	3310      	adds	r3, #16
 800d6d6:	58c3      	ldr	r3, [r0, r3]
 800d6d8:	469c      	mov	ip, r3
 800d6da:	429a      	cmp	r2, r3
 800d6dc:	d100      	bne.n	800d6e0 <fn_0800D14C+0x594>
 800d6de:	e54a      	b.n	800d176 <fn_0800D14C+0x2a>
 800d6e0:	23eb      	movs	r3, #235	@ 0xeb
 800d6e2:	4c39      	ldr	r4, [pc, #228]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d6e4:	6820      	ldr	r0, [r4, #0]
 800d6e6:	00db      	lsls	r3, r3, #3
 800d6e8:	58c3      	ldr	r3, [r0, r3]
 800d6ea:	6cd9      	ldr	r1, [r3, #76]	@ 0x4c
 800d6ec:	008b      	lsls	r3, r1, #2
 800d6ee:	185b      	adds	r3, r3, r1
 800d6f0:	21d6      	movs	r1, #214	@ 0xd6
 800d6f2:	2704      	movs	r7, #4
 800d6f4:	5c41      	ldrb	r1, [r0, r1]
 800d6f6:	43b9      	bics	r1, r7
 800d6f8:	d100      	bne.n	800d6fc <fn_0800D14C+0x5b0>
 800d6fa:	005b      	lsls	r3, r3, #1
 800d6fc:	18d3      	adds	r3, r2, r3
 800d6fe:	4563      	cmp	r3, ip
 800d700:	dd00      	ble.n	800d704 <fn_0800D14C+0x5b8>
 800d702:	4663      	mov	r3, ip
 800d704:	2184      	movs	r1, #132	@ 0x84
 800d706:	5073      	str	r3, [r6, r1]
 800d708:	2a00      	cmp	r2, #0
 800d70a:	d104      	bne.n	800d716 <fn_0800D14C+0x5ca>
 800d70c:	2353      	movs	r3, #83	@ 0x53
 800d70e:	5cf3      	ldrb	r3, [r6, r3]
 800d710:	2b01      	cmp	r3, #1
 800d712:	d800      	bhi.n	800d716 <fn_0800D14C+0x5ca>
 800d714:	e134      	b.n	800d980 <fn_0800D14C+0x834>
 800d716:	4b2d      	ldr	r3, [pc, #180]	@ (800d7cc <fn_0800D14C+0x680>)
 800d718:	58c3      	ldr	r3, [r0, r3]
 800d71a:	6e9a      	ldr	r2, [r3, #104]	@ 0x68
 800d71c:	189b      	adds	r3, r3, r2
 800d71e:	22b8      	movs	r2, #184	@ 0xb8
 800d720:	50b3      	str	r3, [r6, r2]
 800d722:	e547      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d724:	2380      	movs	r3, #128	@ 0x80
 800d726:	58c2      	ldr	r2, [r0, r3]
 800d728:	3310      	adds	r3, #16
 800d72a:	58c3      	ldr	r3, [r0, r3]
 800d72c:	469c      	mov	ip, r3
 800d72e:	429a      	cmp	r2, r3
 800d730:	d100      	bne.n	800d734 <fn_0800D14C+0x5e8>
 800d732:	e520      	b.n	800d176 <fn_0800D14C+0x2a>
 800d734:	23eb      	movs	r3, #235	@ 0xeb
 800d736:	21d6      	movs	r1, #214	@ 0xd6
 800d738:	2704      	movs	r7, #4
 800d73a:	4c23      	ldr	r4, [pc, #140]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d73c:	6820      	ldr	r0, [r4, #0]
 800d73e:	00db      	lsls	r3, r3, #3
 800d740:	58c3      	ldr	r3, [r0, r3]
 800d742:	5c41      	ldrb	r1, [r0, r1]
 800d744:	6c9b      	ldr	r3, [r3, #72]	@ 0x48
 800d746:	43b9      	bics	r1, r7
 800d748:	d100      	bne.n	800d74c <fn_0800D14C+0x600>
 800d74a:	005b      	lsls	r3, r3, #1
 800d74c:	18d3      	adds	r3, r2, r3
 800d74e:	4563      	cmp	r3, ip
 800d750:	dd00      	ble.n	800d754 <fn_0800D14C+0x608>
 800d752:	4663      	mov	r3, ip
 800d754:	2180      	movs	r1, #128	@ 0x80
 800d756:	5073      	str	r3, [r6, r1]
 800d758:	2a00      	cmp	r2, #0
 800d75a:	d104      	bne.n	800d766 <fn_0800D14C+0x61a>
 800d75c:	2353      	movs	r3, #83	@ 0x53
 800d75e:	5cf3      	ldrb	r3, [r6, r3]
 800d760:	2b01      	cmp	r3, #1
 800d762:	d800      	bhi.n	800d766 <fn_0800D14C+0x61a>
 800d764:	e104      	b.n	800d970 <fn_0800D14C+0x824>
 800d766:	4b19      	ldr	r3, [pc, #100]	@ (800d7cc <fn_0800D14C+0x680>)
 800d768:	58c3      	ldr	r3, [r0, r3]
 800d76a:	6eda      	ldr	r2, [r3, #108]	@ 0x6c
 800d76c:	189b      	adds	r3, r3, r2
 800d76e:	22b8      	movs	r2, #184	@ 0xb8
 800d770:	50b3      	str	r3, [r6, r2]
 800d772:	e51f      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d774:	2380      	movs	r3, #128	@ 0x80
 800d776:	58c2      	ldr	r2, [r0, r3]
 800d778:	3310      	adds	r3, #16
 800d77a:	58c3      	ldr	r3, [r0, r3]
 800d77c:	469c      	mov	ip, r3
 800d77e:	429a      	cmp	r2, r3
 800d780:	d100      	bne.n	800d784 <fn_0800D14C+0x638>
 800d782:	e4f8      	b.n	800d176 <fn_0800D14C+0x2a>
 800d784:	23eb      	movs	r3, #235	@ 0xeb
 800d786:	4c10      	ldr	r4, [pc, #64]	@ (800d7c8 <fn_0800D14C+0x67c>)
 800d788:	6820      	ldr	r0, [r4, #0]
 800d78a:	00db      	lsls	r3, r3, #3
 800d78c:	58c3      	ldr	r3, [r0, r3]
 800d78e:	6c99      	ldr	r1, [r3, #72]	@ 0x48
 800d790:	008b      	lsls	r3, r1, #2
 800d792:	185b      	adds	r3, r3, r1
 800d794:	21d6      	movs	r1, #214	@ 0xd6
 800d796:	2704      	movs	r7, #4
 800d798:	5c41      	ldrb	r1, [r0, r1]
 800d79a:	43b9      	bics	r1, r7
 800d79c:	d100      	bne.n	800d7a0 <fn_0800D14C+0x654>
 800d79e:	005b      	lsls	r3, r3, #1
 800d7a0:	18d3      	adds	r3, r2, r3
 800d7a2:	4563      	cmp	r3, ip
 800d7a4:	dd00      	ble.n	800d7a8 <fn_0800D14C+0x65c>
 800d7a6:	4663      	mov	r3, ip
 800d7a8:	2180      	movs	r1, #128	@ 0x80
 800d7aa:	5073      	str	r3, [r6, r1]
 800d7ac:	2a00      	cmp	r2, #0
 800d7ae:	d104      	bne.n	800d7ba <fn_0800D14C+0x66e>
 800d7b0:	2353      	movs	r3, #83	@ 0x53
 800d7b2:	5cf3      	ldrb	r3, [r6, r3]
 800d7b4:	2b01      	cmp	r3, #1
 800d7b6:	d800      	bhi.n	800d7ba <fn_0800D14C+0x66e>
 800d7b8:	e0d2      	b.n	800d960 <fn_0800D14C+0x814>
 800d7ba:	4b04      	ldr	r3, [pc, #16]	@ (800d7cc <fn_0800D14C+0x680>)
 800d7bc:	58c3      	ldr	r3, [r0, r3]
 800d7be:	6f1a      	ldr	r2, [r3, #112]	@ 0x70
 800d7c0:	189b      	adds	r3, r3, r2
 800d7c2:	22b8      	movs	r2, #184	@ 0xb8
 800d7c4:	50b3      	str	r3, [r6, r2]
 800d7c6:	e4f5      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d7c8:	030064c4 	.word	0x030064c4
 800d7cc:	0000075c 	.word	0x0000075c
 800d7d0:	0000805d 	.word	0x0000805d
 800d7d4:	00000834 	.word	0x00000834
 800d7d8:	2352      	movs	r3, #82	@ 0x52
 800d7da:	5cc2      	ldrb	r2, [r0, r3]
 800d7dc:	2a00      	cmp	r2, #0
 800d7de:	d111      	bne.n	800d804 <fn_0800D14C+0x6b8>
 800d7e0:	218c      	movs	r1, #140	@ 0x8c
 800d7e2:	5842      	ldr	r2, [r0, r1]
 800d7e4:	0052      	lsls	r2, r2, #1
 800d7e6:	5042      	str	r2, [r0, r1]
 800d7e8:	3104      	adds	r1, #4
 800d7ea:	5842      	ldr	r2, [r0, r1]
 800d7ec:	0052      	lsls	r2, r2, #1
 800d7ee:	5042      	str	r2, [r0, r1]
 800d7f0:	3104      	adds	r1, #4
 800d7f2:	5842      	ldr	r2, [r0, r1]
 800d7f4:	0052      	lsls	r2, r2, #1
 800d7f6:	5042      	str	r2, [r0, r1]
 800d7f8:	3104      	adds	r1, #4
 800d7fa:	5842      	ldr	r2, [r0, r1]
 800d7fc:	0052      	lsls	r2, r2, #1
 800d7fe:	5042      	str	r2, [r0, r1]
 800d800:	2201      	movs	r2, #1
 800d802:	54c2      	strb	r2, [r0, r3]
 800d804:	2400      	movs	r4, #0
 800d806:	0621      	lsls	r1, r4, #24
 800d808:	2201      	movs	r2, #1
 800d80a:	0030      	movs	r0, r6
 800d80c:	0e09      	lsrs	r1, r1, #24
 800d80e:	3401      	adds	r4, #1
 800d810:	f7ff fb6a 	bl	800cee8 <fn_0800CEE8>
 800d814:	2c04      	cmp	r4, #4
 800d816:	d1f6      	bne.n	800d806 <fn_0800D14C+0x6ba>
 800d818:	4c65      	ldr	r4, [pc, #404]	@ (800d9b0 <fn_0800D14C+0x864>)
 800d81a:	4b66      	ldr	r3, [pc, #408]	@ (800d9b4 <fn_0800D14C+0x868>)
 800d81c:	6822      	ldr	r2, [r4, #0]
 800d81e:	58d3      	ldr	r3, [r2, r3]
 800d820:	6f5a      	ldr	r2, [r3, #116]	@ 0x74
 800d822:	189b      	adds	r3, r3, r2
 800d824:	22b8      	movs	r2, #184	@ 0xb8
 800d826:	50b3      	str	r3, [r6, r2]
 800d828:	e4c4      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d82a:	2200      	movs	r2, #0
 800d82c:	2106      	movs	r1, #6
 800d82e:	f7ff fbcd 	bl	800cfcc <fn_0800CFCC>
 800d832:	2800      	cmp	r0, #0
 800d834:	d100      	bne.n	800d838 <fn_0800D14C+0x6ec>
 800d836:	e49e      	b.n	800d176 <fn_0800D14C+0x2a>
 800d838:	4c5d      	ldr	r4, [pc, #372]	@ (800d9b0 <fn_0800D14C+0x864>)
 800d83a:	4b5e      	ldr	r3, [pc, #376]	@ (800d9b4 <fn_0800D14C+0x868>)
 800d83c:	6822      	ldr	r2, [r4, #0]
 800d83e:	58d3      	ldr	r3, [r2, r3]
 800d840:	6f9a      	ldr	r2, [r3, #120]	@ 0x78
 800d842:	189b      	adds	r3, r3, r2
 800d844:	22b8      	movs	r2, #184	@ 0xb8
 800d846:	4f5c      	ldr	r7, [pc, #368]	@ (800d9b8 <fn_0800D14C+0x86c>)
 800d848:	50b3      	str	r3, [r6, r2]
 800d84a:	e4b4      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d84c:	2200      	movs	r2, #0
 800d84e:	2104      	movs	r1, #4
 800d850:	f7ff fbbc 	bl	800cfcc <fn_0800CFCC>
 800d854:	2800      	cmp	r0, #0
 800d856:	d100      	bne.n	800d85a <fn_0800D14C+0x70e>
 800d858:	e48d      	b.n	800d176 <fn_0800D14C+0x2a>
 800d85a:	4c55      	ldr	r4, [pc, #340]	@ (800d9b0 <fn_0800D14C+0x864>)
 800d85c:	4b55      	ldr	r3, [pc, #340]	@ (800d9b4 <fn_0800D14C+0x868>)
 800d85e:	6822      	ldr	r2, [r4, #0]
 800d860:	58d3      	ldr	r3, [r2, r3]
 800d862:	2284      	movs	r2, #132	@ 0x84
 800d864:	589a      	ldr	r2, [r3, r2]
 800d866:	189b      	adds	r3, r3, r2
 800d868:	22b8      	movs	r2, #184	@ 0xb8
 800d86a:	4f53      	ldr	r7, [pc, #332]	@ (800d9b8 <fn_0800D14C+0x86c>)
 800d86c:	50b3      	str	r3, [r6, r2]
 800d86e:	e4a2      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d870:	234e      	movs	r3, #78	@ 0x4e
 800d872:	5cea      	ldrb	r2, [r5, r3]
 800d874:	0792      	lsls	r2, r2, #30
 800d876:	2103      	movs	r1, #3
 800d878:	0fd2      	lsrs	r2, r2, #31
 800d87a:	f7ff fba7 	bl	800cfcc <fn_0800CFCC>
 800d87e:	2800      	cmp	r0, #0
 800d880:	d100      	bne.n	800d884 <fn_0800D14C+0x738>
 800d882:	e478      	b.n	800d176 <fn_0800D14C+0x2a>
 800d884:	4c4a      	ldr	r4, [pc, #296]	@ (800d9b0 <fn_0800D14C+0x864>)
 800d886:	4b4b      	ldr	r3, [pc, #300]	@ (800d9b4 <fn_0800D14C+0x868>)
 800d888:	6822      	ldr	r2, [r4, #0]
 800d88a:	58d3      	ldr	r3, [r2, r3]
 800d88c:	6fda      	ldr	r2, [r3, #124]	@ 0x7c
 800d88e:	189b      	adds	r3, r3, r2
 800d890:	22b8      	movs	r2, #184	@ 0xb8
 800d892:	4f49      	ldr	r7, [pc, #292]	@ (800d9b8 <fn_0800D14C+0x86c>)
 800d894:	50b3      	str	r3, [r6, r2]
 800d896:	e48e      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d898:	2200      	movs	r2, #0
 800d89a:	2107      	movs	r1, #7
 800d89c:	f7ff fb96 	bl	800cfcc <fn_0800CFCC>
 800d8a0:	2800      	cmp	r0, #0
 800d8a2:	d100      	bne.n	800d8a6 <fn_0800D14C+0x75a>
 800d8a4:	e467      	b.n	800d176 <fn_0800D14C+0x2a>
 800d8a6:	4c42      	ldr	r4, [pc, #264]	@ (800d9b0 <fn_0800D14C+0x864>)
 800d8a8:	4b42      	ldr	r3, [pc, #264]	@ (800d9b4 <fn_0800D14C+0x868>)
 800d8aa:	6822      	ldr	r2, [r4, #0]
 800d8ac:	58d3      	ldr	r3, [r2, r3]
 800d8ae:	2280      	movs	r2, #128	@ 0x80
 800d8b0:	589a      	ldr	r2, [r3, r2]
 800d8b2:	189b      	adds	r3, r3, r2
 800d8b4:	22b8      	movs	r2, #184	@ 0xb8
 800d8b6:	4f40      	ldr	r7, [pc, #256]	@ (800d9b8 <fn_0800D14C+0x86c>)
 800d8b8:	50b3      	str	r3, [r6, r2]
 800d8ba:	e47c      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d8bc:	234e      	movs	r3, #78	@ 0x4e
 800d8be:	5cea      	ldrb	r2, [r5, r3]
 800d8c0:	0792      	lsls	r2, r2, #30
 800d8c2:	2102      	movs	r1, #2
 800d8c4:	0fd2      	lsrs	r2, r2, #31
 800d8c6:	f7ff fb81 	bl	800cfcc <fn_0800CFCC>
 800d8ca:	2800      	cmp	r0, #0
 800d8cc:	d100      	bne.n	800d8d0 <fn_0800D14C+0x784>
 800d8ce:	e452      	b.n	800d176 <fn_0800D14C+0x2a>
 800d8d0:	4c37      	ldr	r4, [pc, #220]	@ (800d9b0 <fn_0800D14C+0x864>)
 800d8d2:	4b38      	ldr	r3, [pc, #224]	@ (800d9b4 <fn_0800D14C+0x868>)
 800d8d4:	6822      	ldr	r2, [r4, #0]
 800d8d6:	58d3      	ldr	r3, [r2, r3]
 800d8d8:	228c      	movs	r2, #140	@ 0x8c
 800d8da:	589a      	ldr	r2, [r3, r2]
 800d8dc:	189b      	adds	r3, r3, r2
 800d8de:	22b8      	movs	r2, #184	@ 0xb8
 800d8e0:	4f35      	ldr	r7, [pc, #212]	@ (800d9b8 <fn_0800D14C+0x86c>)
 800d8e2:	50b3      	str	r3, [r6, r2]
 800d8e4:	e467      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d8e6:	234e      	movs	r3, #78	@ 0x4e
 800d8e8:	5cea      	ldrb	r2, [r5, r3]
 800d8ea:	0792      	lsls	r2, r2, #30
 800d8ec:	2108      	movs	r1, #8
 800d8ee:	0fd2      	lsrs	r2, r2, #31
 800d8f0:	f7ff fb6c 	bl	800cfcc <fn_0800CFCC>
 800d8f4:	2800      	cmp	r0, #0
 800d8f6:	d100      	bne.n	800d8fa <fn_0800D14C+0x7ae>
 800d8f8:	e43d      	b.n	800d176 <fn_0800D14C+0x2a>
 800d8fa:	4c2d      	ldr	r4, [pc, #180]	@ (800d9b0 <fn_0800D14C+0x864>)
 800d8fc:	4b2d      	ldr	r3, [pc, #180]	@ (800d9b4 <fn_0800D14C+0x868>)
 800d8fe:	6822      	ldr	r2, [r4, #0]
 800d900:	58d3      	ldr	r3, [r2, r3]
 800d902:	2290      	movs	r2, #144	@ 0x90
 800d904:	589a      	ldr	r2, [r3, r2]
 800d906:	189b      	adds	r3, r3, r2
 800d908:	22b8      	movs	r2, #184	@ 0xb8
 800d90a:	4f2b      	ldr	r7, [pc, #172]	@ (800d9b8 <fn_0800D14C+0x86c>)
 800d90c:	50b3      	str	r3, [r6, r2]
 800d90e:	e452      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d910:	2200      	movs	r2, #0
 800d912:	2105      	movs	r1, #5
 800d914:	f7ff fb5a 	bl	800cfcc <fn_0800CFCC>
 800d918:	2800      	cmp	r0, #0
 800d91a:	d100      	bne.n	800d91e <fn_0800D14C+0x7d2>
 800d91c:	e42b      	b.n	800d176 <fn_0800D14C+0x2a>
 800d91e:	4c24      	ldr	r4, [pc, #144]	@ (800d9b0 <fn_0800D14C+0x864>)
 800d920:	4b24      	ldr	r3, [pc, #144]	@ (800d9b4 <fn_0800D14C+0x868>)
 800d922:	6822      	ldr	r2, [r4, #0]
 800d924:	58d3      	ldr	r3, [r2, r3]
 800d926:	2288      	movs	r2, #136	@ 0x88
 800d928:	589a      	ldr	r2, [r3, r2]
 800d92a:	189b      	adds	r3, r3, r2
 800d92c:	22b8      	movs	r2, #184	@ 0xb8
 800d92e:	4f22      	ldr	r7, [pc, #136]	@ (800d9b8 <fn_0800D14C+0x86c>)
 800d930:	50b3      	str	r3, [r6, r2]
 800d932:	e440      	b.n	800d1b6 <fn_0800D14C+0x6a>
 800d934:	4291      	cmp	r1, r2
 800d936:	d101      	bne.n	800d93c <fn_0800D14C+0x7f0>
 800d938:	f7ff fc1d 	bl	800d176 <fn_0800D14C+0x2a>
 800d93c:	23eb      	movs	r3, #235	@ 0xeb
 800d93e:	4c1c      	ldr	r4, [pc, #112]	@ (800d9b0 <fn_0800D14C+0x864>)
 800d940:	6820      	ldr	r0, [r4, #0]
 800d942:	00db      	lsls	r3, r3, #3
 800d944:	58c3      	ldr	r3, [r0, r3]
 800d946:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 800d948:	e5ed      	b.n	800d526 <fn_0800D14C+0x3da>
 800d94a:	2364      	movs	r3, #100	@ 0x64
 800d94c:	6283      	str	r3, [r0, #40]	@ 0x28
 800d94e:	2054      	movs	r0, #84	@ 0x54
 800d950:	5213      	strh	r3, [r2, r0]
 800d952:	4b18      	ldr	r3, [pc, #96]	@ (800d9b4 <fn_0800D14C+0x868>)
 800d954:	58cb      	ldr	r3, [r1, r3]
 800d956:	695a      	ldr	r2, [r3, #20]
 800d958:	189b      	adds	r3, r3, r2
 800d95a:	22b8      	movs	r2, #184	@ 0xb8
 800d95c:	50b3      	str	r3, [r6, r2]
 800d95e:	e429      	b.n	800d1b4 <fn_0800D14C+0x68>
 800d960:	6e33      	ldr	r3, [r6, #96]	@ 0x60
 800d962:	2b00      	cmp	r3, #0
 800d964:	d100      	bne.n	800d968 <fn_0800D14C+0x81c>
 800d966:	e728      	b.n	800d7ba <fn_0800D14C+0x66e>
 800d968:	2354      	movs	r3, #84	@ 0x54
 800d96a:	3202      	adds	r2, #2
 800d96c:	54f2      	strb	r2, [r6, r3]
 800d96e:	e724      	b.n	800d7ba <fn_0800D14C+0x66e>
 800d970:	6e33      	ldr	r3, [r6, #96]	@ 0x60
 800d972:	2b00      	cmp	r3, #0
 800d974:	d100      	bne.n	800d978 <fn_0800D14C+0x82c>
 800d976:	e6f6      	b.n	800d766 <fn_0800D14C+0x61a>
 800d978:	2354      	movs	r3, #84	@ 0x54
 800d97a:	3202      	adds	r2, #2
 800d97c:	54f2      	strb	r2, [r6, r3]
 800d97e:	e6f2      	b.n	800d766 <fn_0800D14C+0x61a>
 800d980:	6ef3      	ldr	r3, [r6, #108]	@ 0x6c
 800d982:	2b00      	cmp	r3, #0
 800d984:	d100      	bne.n	800d988 <fn_0800D14C+0x83c>
 800d986:	e6c6      	b.n	800d716 <fn_0800D14C+0x5ca>
 800d988:	2354      	movs	r3, #84	@ 0x54
 800d98a:	3205      	adds	r2, #5
 800d98c:	54f2      	strb	r2, [r6, r3]
 800d98e:	e6c2      	b.n	800d716 <fn_0800D14C+0x5ca>
 800d990:	6ef3      	ldr	r3, [r6, #108]	@ 0x6c
 800d992:	2b00      	cmp	r3, #0
 800d994:	d100      	bne.n	800d998 <fn_0800D14C+0x84c>
 800d996:	e694      	b.n	800d6c2 <fn_0800D14C+0x576>
 800d998:	2354      	movs	r3, #84	@ 0x54
 800d99a:	3205      	adds	r2, #5
 800d99c:	54f2      	strb	r2, [r6, r3]
 800d99e:	e690      	b.n	800d6c2 <fn_0800D14C+0x576>
 800d9a0:	2354      	movs	r3, #84	@ 0x54
 800d9a2:	2201      	movs	r2, #1
 800d9a4:	54f2      	strb	r2, [r6, r3]
 800d9a6:	e5da      	b.n	800d55e <fn_0800D14C+0x412>
 800d9a8:	2354      	movs	r3, #84	@ 0x54
 800d9aa:	2201      	movs	r2, #1
 800d9ac:	54f2      	strb	r2, [r6, r3]
 800d9ae:	e604      	b.n	800d5ba <fn_0800D14C+0x46e>
 800d9b0:	030064c4 	.word	0x030064c4
 800d9b4:	0000075c 	.word	0x0000075c
 800d9b8:	00008021 	.word	0x00008021
