fn_0801C2EC:
 801c2ec:	b510      	push	{r4, lr}
 801c2ee:	0004      	movs	r4, r0
 801c2f0:	480b      	ldr	r0, [pc, #44]	@ (801c320 <fn_0801C2EC+0x34>)
 801c2f2:	f001 f91d 	bl	801d530 <fn_0801D530>
 801c2f6:	f001 f98f 	bl	801d618 <fn_0801D618>
 801c2fa:	4b0a      	ldr	r3, [pc, #40]	@ (801c324 <fn_0801C2EC+0x38>)
 801c2fc:	681a      	ldr	r2, [r3, #0]
 801c2fe:	2c04      	cmp	r4, #4
 801c300:	dd09      	ble.n	801c316 <fn_0801C2EC+0x2a>
 801c302:	2404      	movs	r4, #4
 801c304:	00e3      	lsls	r3, r4, #3
 801c306:	1b1b      	subs	r3, r3, r4
 801c308:	029b      	lsls	r3, r3, #10
 801c30a:	18c0      	adds	r0, r0, r3
 801c30c:	4b06      	ldr	r3, [pc, #24]	@ (801c328 <fn_0801C2EC+0x3c>)
 801c30e:	50d0      	str	r0, [r2, r3]
 801c310:	bc10      	pop	{r4}
 801c312:	bc01      	pop	{r0}
 801c314:	4700      	bx	r0
 801c316:	43e3      	mvns	r3, r4
 801c318:	17db      	asrs	r3, r3, #31
 801c31a:	401c      	ands	r4, r3
 801c31c:	e7f2      	b.n	801c304 <fn_0801C2EC+0x18>
 801c31e:	46c0      	nop			@ (mov r8, r8)
 801c320:	0814a9ec 	.word	0x0814a9ec
 801c324:	030064c4 	.word	0x030064c4
 801c328:	00000744 	.word	0x00000744
