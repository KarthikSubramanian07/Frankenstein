fn_0801C23C:
 801c23c:	b510      	push	{r4, lr}
 801c23e:	0004      	movs	r4, r0
 801c240:	480b      	ldr	r0, [pc, #44]	@ (801c270 <fn_0801C23C+0x34>)
 801c242:	f001 f91d 	bl	801d480 <fn_0801D480>
 801c246:	f001 f98f 	bl	801d568 <fn_0801D568>
 801c24a:	4b0a      	ldr	r3, [pc, #40]	@ (801c274 <fn_0801C23C+0x38>)
 801c24c:	681a      	ldr	r2, [r3, #0]
 801c24e:	2c04      	cmp	r4, #4
 801c250:	dd09      	ble.n	801c266 <fn_0801C23C+0x2a>
 801c252:	2404      	movs	r4, #4
 801c254:	00e3      	lsls	r3, r4, #3
 801c256:	1b1b      	subs	r3, r3, r4
 801c258:	029b      	lsls	r3, r3, #10
 801c25a:	18c0      	adds	r0, r0, r3
 801c25c:	4b06      	ldr	r3, [pc, #24]	@ (801c278 <fn_0801C23C+0x3c>)
 801c25e:	50d0      	str	r0, [r2, r3]
 801c260:	bc10      	pop	{r4}
 801c262:	bc01      	pop	{r0}
 801c264:	4700      	bx	r0
 801c266:	43e3      	mvns	r3, r4
 801c268:	17db      	asrs	r3, r3, #31
 801c26a:	401c      	ands	r4, r3
 801c26c:	e7f2      	b.n	801c254 <fn_0801C23C+0x18>
 801c26e:	46c0      	nop			@ (mov r8, r8)
 801c270:	0814a918 	.word	0x0814a918
 801c274:	030064c4 	.word	0x030064c4
 801c278:	00000744 	.word	0x00000744
