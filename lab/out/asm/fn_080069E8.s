fn_080069E8:
 80069e8:	4b0b      	ldr	r3, [pc, #44]	@ (8006a18 <fn_080069E8+0x30>)
 80069ea:	681a      	ldr	r2, [r3, #0]
 80069ec:	2399      	movs	r3, #153	@ 0x99
 80069ee:	009b      	lsls	r3, r3, #2
 80069f0:	58d3      	ldr	r3, [r2, r3]
 80069f2:	7802      	ldrb	r2, [r0, #0]
 80069f4:	2102      	movs	r1, #2
 80069f6:	5e59      	ldrsh	r1, [r3, r1]
 80069f8:	2a00      	cmp	r2, #0
 80069fa:	d00a      	beq.n	8006a12 <fn_080069E8+0x2a>
 80069fc:	1c43      	adds	r3, r0, #1
 80069fe:	0008      	movs	r0, r1
 8006a00:	2a0a      	cmp	r2, #10
 8006a02:	d100      	bne.n	8006a06 <fn_080069E8+0x1e>
 8006a04:	1840      	adds	r0, r0, r1
 8006a06:	3301      	adds	r3, #1
 8006a08:	1e5a      	subs	r2, r3, #1
 8006a0a:	7812      	ldrb	r2, [r2, #0]
 8006a0c:	2a00      	cmp	r2, #0
 8006a0e:	d1f7      	bne.n	8006a00 <fn_080069E8+0x18>
 8006a10:	4770      	bx	lr
 8006a12:	0008      	movs	r0, r1
 8006a14:	e7fc      	b.n	8006a10 <fn_080069E8+0x28>
 8006a16:	46c0      	nop			@ (mov r8, r8)
 8006a18:	030064c4 	.word	0x030064c4
