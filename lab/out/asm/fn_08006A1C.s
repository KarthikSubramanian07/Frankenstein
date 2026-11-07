fn_08006A1C:
 8006a1c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8006a1e:	46d6      	mov	lr, sl
 8006a20:	464f      	mov	r7, r9
 8006a22:	4646      	mov	r6, r8
 8006a24:	b5c0      	push	{r6, r7, lr}
 8006a26:	7813      	ldrb	r3, [r2, #0]
 8006a28:	4689      	mov	r9, r1
 8006a2a:	4682      	mov	sl, r0
 8006a2c:	0019      	movs	r1, r3
 8006a2e:	b082      	sub	sp, #8
 8006a30:	2b00      	cmp	r3, #0
 8006a32:	d02a      	beq.n	8006a8a <fn_08006A1C+0x6e>
 8006a34:	1c54      	adds	r4, r2, #1
 8006a36:	4a1b      	ldr	r2, [pc, #108]	@ (8006aa4 <fn_08006A1C+0x88>)
 8006a38:	0005      	movs	r5, r0
 8006a3a:	2703      	movs	r7, #3
 8006a3c:	4690      	mov	r8, r2
 8006a3e:	4e1a      	ldr	r6, [pc, #104]	@ (8006aa8 <fn_08006A1C+0x8c>)
 8006a40:	e004      	b.n	8006a4c <fn_08006A1C+0x30>
 8006a42:	3504      	adds	r5, #4
 8006a44:	7823      	ldrb	r3, [r4, #0]
 8006a46:	3401      	adds	r4, #1
 8006a48:	1e19      	subs	r1, r3, #0
 8006a4a:	d01e      	beq.n	8006a8a <fn_08006A1C+0x6e>
 8006a4c:	2b0a      	cmp	r3, #10
 8006a4e:	d024      	beq.n	8006a9a <fn_08006A1C+0x7e>
 8006a50:	5cf2      	ldrb	r2, [r6, r3]
 8006a52:	403a      	ands	r2, r7
 8006a54:	2a02      	cmp	r2, #2
 8006a56:	d101      	bne.n	8006a5c <fn_08006A1C+0x40>
 8006a58:	3b20      	subs	r3, #32
 8006a5a:	0019      	movs	r1, r3
 8006a5c:	000b      	movs	r3, r1
 8006a5e:	3b21      	subs	r3, #33	@ 0x21
 8006a60:	2b3e      	cmp	r3, #62	@ 0x3e
 8006a62:	d8ee      	bhi.n	8006a42 <fn_08006A1C+0x26>
 8006a64:	4643      	mov	r3, r8
 8006a66:	3177      	adds	r1, #119	@ 0x77
 8006a68:	681b      	ldr	r3, [r3, #0]
 8006a6a:	0089      	lsls	r1, r1, #2
 8006a6c:	185b      	adds	r3, r3, r1
 8006a6e:	685a      	ldr	r2, [r3, #4]
 8006a70:	2100      	movs	r1, #0
 8006a72:	5e53      	ldrsh	r3, [r2, r1]
 8006a74:	0028      	movs	r0, r5
 8006a76:	4649      	mov	r1, r9
 8006a78:	9301      	str	r3, [sp, #4]
 8006a7a:	f01e fdad 	bl	80255d8 <fn_080255D8>
 8006a7e:	9b01      	ldr	r3, [sp, #4]
 8006a80:	18ed      	adds	r5, r5, r3
 8006a82:	7823      	ldrb	r3, [r4, #0]
 8006a84:	3401      	adds	r4, #1
 8006a86:	1e19      	subs	r1, r3, #0
 8006a88:	d1e0      	bne.n	8006a4c <fn_08006A1C+0x30>
 8006a8a:	b002      	add	sp, #8
 8006a8c:	bce0      	pop	{r5, r6, r7}
 8006a8e:	46ba      	mov	sl, r7
 8006a90:	46b1      	mov	r9, r6
 8006a92:	46a8      	mov	r8, r5
 8006a94:	bcf0      	pop	{r4, r5, r6, r7}
 8006a96:	bc01      	pop	{r0}
 8006a98:	4700      	bx	r0
 8006a9a:	464b      	mov	r3, r9
 8006a9c:	330c      	adds	r3, #12
 8006a9e:	4699      	mov	r9, r3
 8006aa0:	4655      	mov	r5, sl
 8006aa2:	e7cf      	b.n	8006a44 <fn_08006A1C+0x28>
 8006aa4:	030064c4 	.word	0x030064c4
 8006aa8:	0814b48d 	.word	0x0814b48d
