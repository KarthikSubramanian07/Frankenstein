fn_0800698C:
 800698c:	b570      	push	{r4, r5, r6, lr}
 800698e:	0004      	movs	r4, r0
 8006990:	f019 ff88 	bl	80208a4 <fn_080208A4>
 8006994:	2800      	cmp	r0, #0
 8006996:	d015      	beq.n	80069c4 <fn_0800698C+0x38>
 8006998:	4b11      	ldr	r3, [pc, #68]	@ (80069e0 <fn_0800698C+0x54>)
 800699a:	681b      	ldr	r3, [r3, #0]
 800699c:	0022      	movs	r2, r4
 800699e:	469c      	mov	ip, r3
 80069a0:	1824      	adds	r4, r4, r0
 80069a2:	2503      	movs	r5, #3
 80069a4:	2000      	movs	r0, #0
 80069a6:	4e0f      	ldr	r6, [pc, #60]	@ (80069e4 <fn_0800698C+0x58>)
 80069a8:	7813      	ldrb	r3, [r2, #0]
 80069aa:	5cf1      	ldrb	r1, [r6, r3]
 80069ac:	4029      	ands	r1, r5
 80069ae:	2902      	cmp	r1, #2
 80069b0:	d100      	bne.n	80069b4 <fn_0800698C+0x28>
 80069b2:	3b20      	subs	r3, #32
 80069b4:	0019      	movs	r1, r3
 80069b6:	3921      	subs	r1, #33	@ 0x21
 80069b8:	293e      	cmp	r1, #62	@ 0x3e
 80069ba:	d906      	bls.n	80069ca <fn_0800698C+0x3e>
 80069bc:	3201      	adds	r2, #1
 80069be:	3004      	adds	r0, #4
 80069c0:	42a2      	cmp	r2, r4
 80069c2:	d1f1      	bne.n	80069a8 <fn_0800698C+0x1c>
 80069c4:	bc70      	pop	{r4, r5, r6}
 80069c6:	bc02      	pop	{r1}
 80069c8:	4708      	bx	r1
 80069ca:	3377      	adds	r3, #119	@ 0x77
 80069cc:	009b      	lsls	r3, r3, #2
 80069ce:	4463      	add	r3, ip
 80069d0:	685b      	ldr	r3, [r3, #4]
 80069d2:	2100      	movs	r1, #0
 80069d4:	5e5b      	ldrsh	r3, [r3, r1]
 80069d6:	3201      	adds	r2, #1
 80069d8:	18c0      	adds	r0, r0, r3
 80069da:	4294      	cmp	r4, r2
 80069dc:	d1e4      	bne.n	80069a8 <fn_0800698C+0x1c>
 80069de:	e7f1      	b.n	80069c4 <fn_0800698C+0x38>
 80069e0:	030064c4 	.word	0x030064c4
 80069e4:	0814b48d 	.word	0x0814b48d
