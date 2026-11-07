fn_0801D534:
 801d534:	b510      	push	{r4, lr}
 801d536:	2800      	cmp	r0, #0
 801d538:	db0b      	blt.n	801d552 <fn_0801D534+0x1e>
 801d53a:	4b09      	ldr	r3, [pc, #36]	@ (801d560 <fn_0801D534+0x2c>)
 801d53c:	685a      	ldr	r2, [r3, #4]
 801d53e:	4290      	cmp	r0, r2
 801d540:	da07      	bge.n	801d552 <fn_0801D534+0x1e>
 801d542:	689a      	ldr	r2, [r3, #8]
 801d544:	0100      	lsls	r0, r0, #4
 801d546:	1880      	adds	r0, r0, r2
 801d548:	18c0      	adds	r0, r0, r3
 801d54a:	6840      	ldr	r0, [r0, #4]
 801d54c:	bc10      	pop	{r4}
 801d54e:	bc02      	pop	{r1}
 801d550:	4708      	bx	r1
 801d552:	0001      	movs	r1, r0
 801d554:	4803      	ldr	r0, [pc, #12]	@ (801d564 <fn_0801D534+0x30>)
 801d556:	f7e3 f827 	bl	80005a8 <fn_080005A8>
 801d55a:	2000      	movs	r0, #0
 801d55c:	e7f6      	b.n	801d54c <fn_0801D534+0x18>
 801d55e:	46c0      	nop			@ (mov r8, r8)
 801d560:	08156b80 	.word	0x08156b80
 801d564:	0814a9dc 	.word	0x0814a9dc
