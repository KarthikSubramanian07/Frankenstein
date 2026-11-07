fn_0801C6CC:
 801c6cc:	4684      	mov	ip, r0
 801c6ce:	0010      	movs	r0, r2
 801c6d0:	4a0b      	ldr	r2, [pc, #44]	@ (801c700 <fn_0801C6CC+0x34>)
 801c6d2:	6813      	ldr	r3, [r2, #0]
 801c6d4:	2294      	movs	r2, #148	@ 0x94
 801c6d6:	b500      	push	{lr}
 801c6d8:	5c9a      	ldrb	r2, [r3, r2]
 801c6da:	b083      	sub	sp, #12
 801c6dc:	2a02      	cmp	r2, #2
 801c6de:	d008      	beq.n	801c6f2 <fn_0801C6CC+0x26>
 801c6e0:	9100      	str	r1, [sp, #0]
 801c6e2:	4663      	mov	r3, ip
 801c6e4:	2109      	movs	r1, #9
 801c6e6:	4a07      	ldr	r2, [pc, #28]	@ (801c704 <fn_0801C6CC+0x38>)
 801c6e8:	f7e8 feb6 	bl	8005458 <fn_08005458>
 801c6ec:	b003      	add	sp, #12
 801c6ee:	bc01      	pop	{r0}
 801c6f0:	4700      	bx	r0
 801c6f2:	000b      	movs	r3, r1
 801c6f4:	4a04      	ldr	r2, [pc, #16]	@ (801c708 <fn_0801C6CC+0x3c>)
 801c6f6:	2109      	movs	r1, #9
 801c6f8:	f7e8 feae 	bl	8005458 <fn_08005458>
 801c6fc:	e7f6      	b.n	801c6ec <fn_0801C6CC+0x20>
 801c6fe:	46c0      	nop			@ (mov r8, r8)
 801c700:	030064c4 	.word	0x030064c4
 801c704:	0814aa00 	.word	0x0814aa00
 801c708:	0814a9f4 	.word	0x0814a9f4
