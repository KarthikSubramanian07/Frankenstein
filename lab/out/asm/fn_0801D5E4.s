fn_0801D5E4:
 801d5e4:	b510      	push	{r4, lr}
 801d5e6:	2800      	cmp	r0, #0
 801d5e8:	db0b      	blt.n	801d602 <fn_0801D5E4+0x1e>
 801d5ea:	4b09      	ldr	r3, [pc, #36]	@ (801d610 <fn_0801D5E4+0x2c>)
 801d5ec:	685a      	ldr	r2, [r3, #4]
 801d5ee:	4290      	cmp	r0, r2
 801d5f0:	da07      	bge.n	801d602 <fn_0801D5E4+0x1e>
 801d5f2:	689a      	ldr	r2, [r3, #8]
 801d5f4:	0100      	lsls	r0, r0, #4
 801d5f6:	1880      	adds	r0, r0, r2
 801d5f8:	18c0      	adds	r0, r0, r3
 801d5fa:	6840      	ldr	r0, [r0, #4]
 801d5fc:	bc10      	pop	{r4}
 801d5fe:	bc02      	pop	{r1}
 801d600:	4708      	bx	r1
 801d602:	0001      	movs	r1, r0
 801d604:	4803      	ldr	r0, [pc, #12]	@ (801d614 <fn_0801D5E4+0x30>)
 801d606:	f7e2 ffcf 	bl	80005a8 <fn_080005A8>
 801d60a:	2000      	movs	r0, #0
 801d60c:	e7f6      	b.n	801d5fc <fn_0801D5E4+0x18>
 801d60e:	46c0      	nop			@ (mov r8, r8)
 801d610:	08156c40 	.word	0x08156c40
 801d614:	0814aab0 	.word	0x0814aab0
