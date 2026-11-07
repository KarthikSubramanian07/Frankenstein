fn_08006F18:
 8006f18:	4b11      	ldr	r3, [pc, #68]	@ (8006f60 <fn_08006F18+0x48>)
 8006f1a:	b5f0      	push	{r4, r5, r6, r7, lr}
 8006f1c:	4a11      	ldr	r2, [pc, #68]	@ (8006f64 <fn_08006F18+0x4c>)
 8006f1e:	681d      	ldr	r5, [r3, #0]
 8006f20:	4b11      	ldr	r3, [pc, #68]	@ (8006f68 <fn_08006F18+0x50>)
 8006f22:	2600      	movs	r6, #0
 8006f24:	18eb      	adds	r3, r5, r3
 8006f26:	4f11      	ldr	r7, [pc, #68]	@ (8006f6c <fn_08006F18+0x54>)
 8006f28:	18ad      	adds	r5, r5, r2
 8006f2a:	e002      	b.n	8006f32 <fn_08006F18+0x1a>
 8006f2c:	3304      	adds	r3, #4
 8006f2e:	429d      	cmp	r5, r3
 8006f30:	d011      	beq.n	8006f56 <fn_08006F18+0x3e>
 8006f32:	681a      	ldr	r2, [r3, #0]
 8006f34:	2a00      	cmp	r2, #0
 8006f36:	d0f9      	beq.n	8006f2c <fn_08006F18+0x14>
 8006f38:	241c      	movs	r4, #28
 8006f3a:	5f01      	ldrsh	r1, [r0, r4]
 8006f3c:	6b94      	ldr	r4, [r2, #56]	@ 0x38
 8006f3e:	428c      	cmp	r4, r1
 8006f40:	d1f4      	bne.n	8006f2c <fn_08006F18+0x14>
 8006f42:	6b51      	ldr	r1, [r2, #52]	@ 0x34
 8006f44:	2900      	cmp	r1, #0
 8006f46:	d1f1      	bne.n	8006f2c <fn_08006F18+0x14>
 8006f48:	6bd1      	ldr	r1, [r2, #60]	@ 0x3c
 8006f4a:	3304      	adds	r3, #4
 8006f4c:	2601      	movs	r6, #1
 8006f4e:	6351      	str	r1, [r2, #52]	@ 0x34
 8006f50:	6097      	str	r7, [r2, #8]
 8006f52:	429d      	cmp	r5, r3
 8006f54:	d1ed      	bne.n	8006f32 <fn_08006F18+0x1a>
 8006f56:	0030      	movs	r0, r6
 8006f58:	bcf0      	pop	{r4, r5, r6, r7}
 8006f5a:	bc02      	pop	{r1}
 8006f5c:	4708      	bx	r1
 8006f5e:	46c0      	nop			@ (mov r8, r8)
 8006f60:	030064c4 	.word	0x030064c4
 8006f64:	0000085c 	.word	0x0000085c
 8006f68:	000007dc 	.word	0x000007dc
 8006f6c:	08006b61 	.word	0x08006b61
