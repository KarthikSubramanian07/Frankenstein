fn_080129A4:
 80129a4:	2353      	movs	r3, #83	@ 0x53
 80129a6:	b5f0      	push	{r4, r5, r6, r7, lr}
 80129a8:	5cc5      	ldrb	r5, [r0, r3]
 80129aa:	4b36      	ldr	r3, [pc, #216]	@ (8012a84 <fn_080129A4+0xe0>)
 80129ac:	001f      	movs	r7, r3
 80129ae:	0004      	movs	r4, r0
 80129b0:	0028      	movs	r0, r5
 80129b2:	4e35      	ldr	r6, [pc, #212]	@ (8012a88 <fn_080129A4+0xe4>)
 80129b4:	3728      	adds	r7, #40	@ 0x28
 80129b6:	681a      	ldr	r2, [r3, #0]
 80129b8:	2a09      	cmp	r2, #9
 80129ba:	d803      	bhi.n	80129c4 <fn_080129A4+0x20>
 80129bc:	0091      	lsls	r1, r2, #2
 80129be:	5871      	ldr	r1, [r6, r1]
 80129c0:	468f      	mov	pc, r1
 80129c2:	0010      	movs	r0, r2
 80129c4:	42a8      	cmp	r0, r5
 80129c6:	d102      	bne.n	80129ce <fn_080129A4+0x2a>
 80129c8:	3304      	adds	r3, #4
 80129ca:	42bb      	cmp	r3, r7
 80129cc:	d1f3      	bne.n	80129b6 <fn_080129A4+0x12>
 80129ce:	bcf0      	pop	{r4, r5, r6, r7}
 80129d0:	bc02      	pop	{r1}
 80129d2:	4708      	bx	r1
 80129d4:	6fa2      	ldr	r2, [r4, #120]	@ 0x78
 80129d6:	2a00      	cmp	r2, #0
 80129d8:	d0f4      	beq.n	80129c4 <fn_080129A4+0x20>
 80129da:	4a2c      	ldr	r2, [pc, #176]	@ (8012a8c <fn_080129A4+0xe8>)
 80129dc:	6811      	ldr	r1, [r2, #0]
 80129de:	2294      	movs	r2, #148	@ 0x94
 80129e0:	5c8a      	ldrb	r2, [r1, r2]
 80129e2:	2a02      	cmp	r2, #2
 80129e4:	d1ee      	bne.n	80129c4 <fn_080129A4+0x20>
 80129e6:	327e      	adds	r2, #126	@ 0x7e
 80129e8:	58a2      	ldr	r2, [r4, r2]
 80129ea:	2a01      	cmp	r2, #1
 80129ec:	ddea      	ble.n	80129c4 <fn_080129A4+0x20>
 80129ee:	2008      	movs	r0, #8
 80129f0:	e7e8      	b.n	80129c4 <fn_080129A4+0x20>
 80129f2:	6f62      	ldr	r2, [r4, #116]	@ 0x74
 80129f4:	2a00      	cmp	r2, #0
 80129f6:	d0e5      	beq.n	80129c4 <fn_080129A4+0x20>
 80129f8:	2007      	movs	r0, #7
 80129fa:	e7e3      	b.n	80129c4 <fn_080129A4+0x20>
 80129fc:	6f22      	ldr	r2, [r4, #112]	@ 0x70
 80129fe:	2a00      	cmp	r2, #0
 8012a00:	d0e0      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a02:	4a22      	ldr	r2, [pc, #136]	@ (8012a8c <fn_080129A4+0xe8>)
 8012a04:	6811      	ldr	r1, [r2, #0]
 8012a06:	2294      	movs	r2, #148	@ 0x94
 8012a08:	5c8a      	ldrb	r2, [r1, r2]
 8012a0a:	2a00      	cmp	r2, #0
 8012a0c:	d0da      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a0e:	2284      	movs	r2, #132	@ 0x84
 8012a10:	58a2      	ldr	r2, [r4, r2]
 8012a12:	2a27      	cmp	r2, #39	@ 0x27
 8012a14:	ddd6      	ble.n	80129c4 <fn_080129A4+0x20>
 8012a16:	2006      	movs	r0, #6
 8012a18:	e7d4      	b.n	80129c4 <fn_080129A4+0x20>
 8012a1a:	6ee2      	ldr	r2, [r4, #108]	@ 0x6c
 8012a1c:	2a00      	cmp	r2, #0
 8012a1e:	d0d1      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a20:	2284      	movs	r2, #132	@ 0x84
 8012a22:	58a2      	ldr	r2, [r4, r2]
 8012a24:	2a00      	cmp	r2, #0
 8012a26:	d0cd      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a28:	4a18      	ldr	r2, [pc, #96]	@ (8012a8c <fn_080129A4+0xe8>)
 8012a2a:	6811      	ldr	r1, [r2, #0]
 8012a2c:	2294      	movs	r2, #148	@ 0x94
 8012a2e:	5c8a      	ldrb	r2, [r1, r2]
 8012a30:	2a00      	cmp	r2, #0
 8012a32:	d0c7      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a34:	2005      	movs	r0, #5
 8012a36:	e7c5      	b.n	80129c4 <fn_080129A4+0x20>
 8012a38:	2288      	movs	r2, #136	@ 0x88
 8012a3a:	58a2      	ldr	r2, [r4, r2]
 8012a3c:	2a00      	cmp	r2, #0
 8012a3e:	d0c1      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a40:	6ea2      	ldr	r2, [r4, #104]	@ 0x68
 8012a42:	2a00      	cmp	r2, #0
 8012a44:	d0be      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a46:	2004      	movs	r0, #4
 8012a48:	e7bc      	b.n	80129c4 <fn_080129A4+0x20>
 8012a4a:	6fe2      	ldr	r2, [r4, #124]	@ 0x7c
 8012a4c:	2a00      	cmp	r2, #0
 8012a4e:	d0b9      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a50:	6e62      	ldr	r2, [r4, #100]	@ 0x64
 8012a52:	2a00      	cmp	r2, #0
 8012a54:	d0b6      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a56:	2003      	movs	r0, #3
 8012a58:	e7b4      	b.n	80129c4 <fn_080129A4+0x20>
 8012a5a:	2280      	movs	r2, #128	@ 0x80
 8012a5c:	58a2      	ldr	r2, [r4, r2]
 8012a5e:	2a00      	cmp	r2, #0
 8012a60:	d0b0      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a62:	6e22      	ldr	r2, [r4, #96]	@ 0x60
 8012a64:	2a00      	cmp	r2, #0
 8012a66:	d0ad      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a68:	2002      	movs	r0, #2
 8012a6a:	e7ab      	b.n	80129c4 <fn_080129A4+0x20>
 8012a6c:	6fe2      	ldr	r2, [r4, #124]	@ 0x7c
 8012a6e:	2a00      	cmp	r2, #0
 8012a70:	d0a8      	beq.n	80129c4 <fn_080129A4+0x20>
 8012a72:	2001      	movs	r0, #1
 8012a74:	e7a6      	b.n	80129c4 <fn_080129A4+0x20>
 8012a76:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
 8012a78:	4251      	negs	r1, r2
 8012a7a:	414a      	adcs	r2, r1
 8012a7c:	4252      	negs	r2, r2
 8012a7e:	4010      	ands	r0, r2
 8012a80:	e7a0      	b.n	80129c4 <fn_080129A4+0x20>
 8012a82:	46c0      	nop			@ (mov r8, r8)
 8012a84:	0812e790 	.word	0x0812e790
 8012a88:	0812e6b4 	.word	0x0812e6b4
 8012a8c:	030064c4 	.word	0x030064c4
