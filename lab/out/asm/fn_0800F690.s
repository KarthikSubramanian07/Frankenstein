fn_0800F690:
 800f690:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800f692:	000d      	movs	r5, r1
 800f694:	0016      	movs	r6, r2
 800f696:	2100      	movs	r1, #0
 800f698:	001f      	movs	r7, r3
 800f69a:	4b0a      	ldr	r3, [pc, #40]	@ (800f6c4 <fn_0800F690+0x34>)
 800f69c:	681a      	ldr	r2, [r3, #0]
 800f69e:	4b0a      	ldr	r3, [pc, #40]	@ (800f6c8 <fn_0800F690+0x38>)
 800f6a0:	52d1      	strh	r1, [r2, r3]
 800f6a2:	0032      	movs	r2, r6
 800f6a4:	0029      	movs	r1, r5
 800f6a6:	0004      	movs	r4, r0
 800f6a8:	f7ff fe94 	bl	800f3d4 <fn_0800F3D4>
 800f6ac:	2800      	cmp	r0, #0
 800f6ae:	d005      	beq.n	800f6bc <fn_0800F690+0x2c>
 800f6b0:	003b      	movs	r3, r7
 800f6b2:	0032      	movs	r2, r6
 800f6b4:	0029      	movs	r1, r5
 800f6b6:	0020      	movs	r0, r4
 800f6b8:	f7ff f986 	bl	800e9c8 <fn_0800E9C8>
 800f6bc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800f6be:	bc02      	pop	{r1}
 800f6c0:	4708      	bx	r1
 800f6c2:	46c0      	nop			@ (mov r8, r8)
 800f6c4:	030064c4 	.word	0x030064c4
 800f6c8:	00000924 	.word	0x00000924
