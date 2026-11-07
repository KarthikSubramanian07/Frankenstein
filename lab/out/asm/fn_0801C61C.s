fn_0801C61C:
 801c61c:	4684      	mov	ip, r0
 801c61e:	0010      	movs	r0, r2
 801c620:	4a0b      	ldr	r2, [pc, #44]	@ (801c650 <fn_0801C61C+0x34>)
 801c622:	6813      	ldr	r3, [r2, #0]
 801c624:	2294      	movs	r2, #148	@ 0x94
 801c626:	b500      	push	{lr}
 801c628:	5c9a      	ldrb	r2, [r3, r2]
 801c62a:	b083      	sub	sp, #12
 801c62c:	2a02      	cmp	r2, #2
 801c62e:	d008      	beq.n	801c642 <fn_0801C61C+0x26>
 801c630:	9100      	str	r1, [sp, #0]
 801c632:	4663      	mov	r3, ip
 801c634:	2109      	movs	r1, #9
 801c636:	4a07      	ldr	r2, [pc, #28]	@ (801c654 <fn_0801C61C+0x38>)
 801c638:	f7e8 ff0e 	bl	8005458 <fn_08005458>
 801c63c:	b003      	add	sp, #12
 801c63e:	bc01      	pop	{r0}
 801c640:	4700      	bx	r0
 801c642:	000b      	movs	r3, r1
 801c644:	4a04      	ldr	r2, [pc, #16]	@ (801c658 <fn_0801C61C+0x3c>)
 801c646:	2109      	movs	r1, #9
 801c648:	f7e8 ff06 	bl	8005458 <fn_08005458>
 801c64c:	e7f6      	b.n	801c63c <fn_0801C61C+0x20>
 801c64e:	46c0      	nop			@ (mov r8, r8)
 801c650:	030064c4 	.word	0x030064c4
 801c654:	0814a92c 	.word	0x0814a92c
 801c658:	0814a920 	.word	0x0814a920
