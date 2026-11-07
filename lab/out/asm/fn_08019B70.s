fn_08019B70:
 8019b70:	b530      	push	{r4, r5, lr}
 8019b72:	46c6      	mov	lr, r8
 8019b74:	b500      	push	{lr}
 8019b76:	b082      	sub	sp, #8
 8019b78:	2807      	cmp	r0, #7
 8019b7a:	d82e      	bhi.n	8019bda <fn_08019B70+0x6a>
 8019b7c:	4b1a      	ldr	r3, [pc, #104]	@ (8019be8 <fn_08019B70+0x78>)
 8019b7e:	681c      	ldr	r4, [r3, #0]
 8019b80:	239b      	movs	r3, #155	@ 0x9b
 8019b82:	00db      	lsls	r3, r3, #3
 8019b84:	469c      	mov	ip, r3
 8019b86:	0100      	lsls	r0, r0, #4
 8019b88:	1824      	adds	r4, r4, r0
 8019b8a:	44a4      	add	ip, r4
 8019b8c:	2300      	movs	r3, #0
 8019b8e:	4660      	mov	r0, ip
 8019b90:	6003      	str	r3, [r0, #0]
 8019b92:	7948      	ldrb	r0, [r1, #5]
 8019b94:	790b      	ldrb	r3, [r1, #4]
 8019b96:	0200      	lsls	r0, r0, #8
 8019b98:	4318      	orrs	r0, r3
 8019b9a:	798b      	ldrb	r3, [r1, #6]
 8019b9c:	041b      	lsls	r3, r3, #16
 8019b9e:	4303      	orrs	r3, r0
 8019ba0:	79c8      	ldrb	r0, [r1, #7]
 8019ba2:	0600      	lsls	r0, r0, #24
 8019ba4:	4318      	orrs	r0, r3
 8019ba6:	78cb      	ldrb	r3, [r1, #3]
 8019ba8:	788d      	ldrb	r5, [r1, #2]
 8019baa:	021b      	lsls	r3, r3, #8
 8019bac:	432b      	orrs	r3, r5
 8019bae:	4d0f      	ldr	r5, [pc, #60]	@ (8019bec <fn_08019B70+0x7c>)
 8019bb0:	195b      	adds	r3, r3, r5
 8019bb2:	2b00      	cmp	r3, #0
 8019bb4:	d111      	bne.n	8019bda <fn_08019B70+0x6a>
 8019bb6:	4243      	negs	r3, r0
 8019bb8:	4143      	adcs	r3, r0
 8019bba:	2b00      	cmp	r3, #0
 8019bbc:	d10d      	bne.n	8019bda <fn_08019B70+0x6a>
 8019bbe:	4d0c      	ldr	r5, [pc, #48]	@ (8019bf0 <fn_08019B70+0x80>)
 8019bc0:	46a8      	mov	r8, r5
 8019bc2:	44a0      	add	r8, r4
 8019bc4:	4645      	mov	r5, r8
 8019bc6:	602b      	str	r3, [r5, #0]
 8019bc8:	239c      	movs	r3, #156	@ 0x9c
 8019bca:	00db      	lsls	r3, r3, #3
 8019bcc:	50e0      	str	r0, [r4, r3]
 8019bce:	4b09      	ldr	r3, [pc, #36]	@ (8019bf4 <fn_08019B70+0x84>)
 8019bd0:	0152      	lsls	r2, r2, #5
 8019bd2:	50e2      	str	r2, [r4, r3]
 8019bd4:	4663      	mov	r3, ip
 8019bd6:	3108      	adds	r1, #8
 8019bd8:	6019      	str	r1, [r3, #0]
 8019bda:	b002      	add	sp, #8
 8019bdc:	bc20      	pop	{r5}
 8019bde:	46a8      	mov	r8, r5
 8019be0:	bc30      	pop	{r4, r5}
 8019be2:	bc01      	pop	{r0}
 8019be4:	4700      	bx	r0
 8019be6:	46c0      	nop			@ (mov r8, r8)
 8019be8:	030064c4 	.word	0x030064c4
 8019bec:	ffffcbbd 	.word	0xffffcbbd
 8019bf0:	000004dc 	.word	0x000004dc
 8019bf4:	000004e4 	.word	0x000004e4
