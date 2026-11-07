fn_08019ABC:
 8019abc:	b530      	push	{r4, r5, lr}
 8019abe:	46c6      	mov	lr, r8
 8019ac0:	b500      	push	{lr}
 8019ac2:	b082      	sub	sp, #8
 8019ac4:	2807      	cmp	r0, #7
 8019ac6:	d82e      	bhi.n	8019b26 <fn_08019ABC+0x6a>
 8019ac8:	4b1a      	ldr	r3, [pc, #104]	@ (8019b34 <fn_08019ABC+0x78>)
 8019aca:	681c      	ldr	r4, [r3, #0]
 8019acc:	239b      	movs	r3, #155	@ 0x9b
 8019ace:	00db      	lsls	r3, r3, #3
 8019ad0:	469c      	mov	ip, r3
 8019ad2:	0100      	lsls	r0, r0, #4
 8019ad4:	1824      	adds	r4, r4, r0
 8019ad6:	44a4      	add	ip, r4
 8019ad8:	2300      	movs	r3, #0
 8019ada:	4660      	mov	r0, ip
 8019adc:	6003      	str	r3, [r0, #0]
 8019ade:	7948      	ldrb	r0, [r1, #5]
 8019ae0:	790b      	ldrb	r3, [r1, #4]
 8019ae2:	0200      	lsls	r0, r0, #8
 8019ae4:	4318      	orrs	r0, r3
 8019ae6:	798b      	ldrb	r3, [r1, #6]
 8019ae8:	041b      	lsls	r3, r3, #16
 8019aea:	4303      	orrs	r3, r0
 8019aec:	79c8      	ldrb	r0, [r1, #7]
 8019aee:	0600      	lsls	r0, r0, #24
 8019af0:	4318      	orrs	r0, r3
 8019af2:	78cb      	ldrb	r3, [r1, #3]
 8019af4:	788d      	ldrb	r5, [r1, #2]
 8019af6:	021b      	lsls	r3, r3, #8
 8019af8:	432b      	orrs	r3, r5
 8019afa:	4d0f      	ldr	r5, [pc, #60]	@ (8019b38 <fn_08019ABC+0x7c>)
 8019afc:	195b      	adds	r3, r3, r5
 8019afe:	2b00      	cmp	r3, #0
 8019b00:	d111      	bne.n	8019b26 <fn_08019ABC+0x6a>
 8019b02:	4243      	negs	r3, r0
 8019b04:	4143      	adcs	r3, r0
 8019b06:	2b00      	cmp	r3, #0
 8019b08:	d10d      	bne.n	8019b26 <fn_08019ABC+0x6a>
 8019b0a:	4d0c      	ldr	r5, [pc, #48]	@ (8019b3c <fn_08019ABC+0x80>)
 8019b0c:	46a8      	mov	r8, r5
 8019b0e:	44a0      	add	r8, r4
 8019b10:	4645      	mov	r5, r8
 8019b12:	602b      	str	r3, [r5, #0]
 8019b14:	239c      	movs	r3, #156	@ 0x9c
 8019b16:	00db      	lsls	r3, r3, #3
 8019b18:	50e0      	str	r0, [r4, r3]
 8019b1a:	4b09      	ldr	r3, [pc, #36]	@ (8019b40 <fn_08019ABC+0x84>)
 8019b1c:	0152      	lsls	r2, r2, #5
 8019b1e:	50e2      	str	r2, [r4, r3]
 8019b20:	4663      	mov	r3, ip
 8019b22:	3108      	adds	r1, #8
 8019b24:	6019      	str	r1, [r3, #0]
 8019b26:	b002      	add	sp, #8
 8019b28:	bc20      	pop	{r5}
 8019b2a:	46a8      	mov	r8, r5
 8019b2c:	bc30      	pop	{r4, r5}
 8019b2e:	bc01      	pop	{r0}
 8019b30:	4700      	bx	r0
 8019b32:	46c0      	nop			@ (mov r8, r8)
 8019b34:	030064c4 	.word	0x030064c4
 8019b38:	ffffcbbd 	.word	0xffffcbbd
 8019b3c:	000004dc 	.word	0x000004dc
 8019b40:	000004e4 	.word	0x000004e4
