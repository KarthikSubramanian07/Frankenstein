fn_0800A458:
 800a458:	4b09      	ldr	r3, [pc, #36]	@ (800a480 <fn_0800A458+0x28>)
 800a45a:	681a      	ldr	r2, [r3, #0]
 800a45c:	2394      	movs	r3, #148	@ 0x94
 800a45e:	b510      	push	{r4, lr}
 800a460:	5cd3      	ldrb	r3, [r2, r3]
 800a462:	2139      	movs	r1, #57	@ 0x39
 800a464:	2b00      	cmp	r3, #0
 800a466:	d004      	beq.n	800a472 <fn_0800A458+0x1a>
 800a468:	2354      	movs	r3, #84	@ 0x54
 800a46a:	5ec3      	ldrsh	r3, [r0, r3]
 800a46c:	3101      	adds	r1, #1
 800a46e:	3332      	adds	r3, #50	@ 0x32
 800a470:	da04      	bge.n	800a47c <fn_0800A458+0x24>
 800a472:	f00f ff83 	bl	801a37c <fn_0801A37C>
 800a476:	bc10      	pop	{r4}
 800a478:	bc01      	pop	{r0}
 800a47a:	4700      	bx	r0
 800a47c:	3901      	subs	r1, #1
 800a47e:	e7f8      	b.n	800a472 <fn_0800A458+0x1a>
 800a480:	030064c4 	.word	0x030064c4
