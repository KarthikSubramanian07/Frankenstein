fn_08018B60:
 8018b60:	b5f0      	push	{r4, r5, r6, r7, lr}
 8018b62:	46de      	mov	lr, fp
 8018b64:	4657      	mov	r7, sl
 8018b66:	464e      	mov	r6, r9
 8018b68:	4645      	mov	r5, r8
 8018b6a:	b5e0      	push	{r5, r6, r7, lr}
 8018b6c:	b087      	sub	sp, #28
 8018b6e:	0001      	movs	r1, r0
 8018b70:	2208      	movs	r2, #8
 8018b72:	a803      	add	r0, sp, #12
 8018b74:	f008 fc74 	bl	8021460 <fn_08021460>
 8018b78:	2300      	movs	r3, #0
 8018b7a:	466a      	mov	r2, sp
 8018b7c:	a803      	add	r0, sp, #12
 8018b7e:	7513      	strb	r3, [r2, #20]
 8018b80:	f007 ff1a 	bl	80209b8 <fn_080209B8>
 8018b84:	4b2a      	ldr	r3, [pc, #168]	@ (8018c30 <fn_08018B60+0xd0>)
 8018b86:	681a      	ldr	r2, [r3, #0]
 8018b88:	4b2a      	ldr	r3, [pc, #168]	@ (8018c34 <fn_08018B60+0xd4>)
 8018b8a:	58d0      	ldr	r0, [r2, r3]
 8018b8c:	9201      	str	r2, [sp, #4]
 8018b8e:	2800      	cmp	r0, #0
 8018b90:	d005      	beq.n	8018b9e <fn_08018B60+0x3e>
 8018b92:	2208      	movs	r2, #8
 8018b94:	a903      	add	r1, sp, #12
 8018b96:	f008 fdf3 	bl	8021780 <fn_08021780>
 8018b9a:	2800      	cmp	r0, #0
 8018b9c:	d03d      	beq.n	8018c1a <fn_08018B60+0xba>
 8018b9e:	4826      	ldr	r0, [pc, #152]	@ (8018c38 <fn_08018B60+0xd8>)
 8018ba0:	f004 fca0 	bl	801d4e4 <fn_0801D4E4>
 8018ba4:	3001      	adds	r0, #1
 8018ba6:	d03f      	beq.n	8018c28 <fn_08018B60+0xc8>
 8018ba8:	4823      	ldr	r0, [pc, #140]	@ (8018c38 <fn_08018B60+0xd8>)
 8018baa:	f004 fcc1 	bl	801d530 <fn_0801D530>
 8018bae:	f004 fd33 	bl	801d618 <fn_0801D618>
 8018bb2:	1d03      	adds	r3, r0, #4
 8018bb4:	4682      	mov	sl, r0
 8018bb6:	469b      	mov	fp, r3
 8018bb8:	4b20      	ldr	r3, [pc, #128]	@ (8018c3c <fn_08018B60+0xdc>)
 8018bba:	9a01      	ldr	r2, [sp, #4]
 8018bbc:	58d3      	ldr	r3, [r2, r3]
 8018bbe:	4698      	mov	r8, r3
 8018bc0:	2b00      	cmp	r3, #0
 8018bc2:	dd2e      	ble.n	8018c22 <fn_08018B60+0xc2>
 8018bc4:	481e      	ldr	r0, [pc, #120]	@ (8018c40 <fn_08018B60+0xe0>)
 8018bc6:	f004 fcb3 	bl	801d530 <fn_0801D530>
 8018bca:	f004 fd25 	bl	801d618 <fn_0801D618>
 8018bce:	0006      	movs	r6, r0
 8018bd0:	ce08      	ldmia	r6!, {r3}
 8018bd2:	0007      	movs	r7, r0
 8018bd4:	4699      	mov	r9, r3
 8018bd6:	2400      	movs	r4, #0
 8018bd8:	e003      	b.n	8018be2 <fn_08018B60+0x82>
 8018bda:	3401      	adds	r4, #1
 8018bdc:	3604      	adds	r6, #4
 8018bde:	4544      	cmp	r4, r8
 8018be0:	d01f      	beq.n	8018c22 <fn_08018B60+0xc2>
 8018be2:	45a1      	cmp	r9, r4
 8018be4:	d101      	bne.n	8018bea <fn_08018B60+0x8a>
 8018be6:	4657      	mov	r7, sl
 8018be8:	465e      	mov	r6, fp
 8018bea:	6835      	ldr	r5, [r6, #0]
 8018bec:	197d      	adds	r5, r7, r5
 8018bee:	2208      	movs	r2, #8
 8018bf0:	0029      	movs	r1, r5
 8018bf2:	a803      	add	r0, sp, #12
 8018bf4:	f008 fdc4 	bl	8021780 <fn_08021780>
 8018bf8:	2800      	cmp	r0, #0
 8018bfa:	d1ee      	bne.n	8018bda <fn_08018B60+0x7a>
 8018bfc:	4b0d      	ldr	r3, [pc, #52]	@ (8018c34 <fn_08018B60+0xd4>)
 8018bfe:	9a01      	ldr	r2, [sp, #4]
 8018c00:	50d5      	str	r5, [r2, r3]
 8018c02:	4b10      	ldr	r3, [pc, #64]	@ (8018c44 <fn_08018B60+0xe4>)
 8018c04:	50d4      	str	r4, [r2, r3]
 8018c06:	0020      	movs	r0, r4
 8018c08:	b007      	add	sp, #28
 8018c0a:	bcf0      	pop	{r4, r5, r6, r7}
 8018c0c:	46bb      	mov	fp, r7
 8018c0e:	46b2      	mov	sl, r6
 8018c10:	46a9      	mov	r9, r5
 8018c12:	46a0      	mov	r8, r4
 8018c14:	bcf0      	pop	{r4, r5, r6, r7}
 8018c16:	bc02      	pop	{r1}
 8018c18:	4708      	bx	r1
 8018c1a:	4b0a      	ldr	r3, [pc, #40]	@ (8018c44 <fn_08018B60+0xe4>)
 8018c1c:	9a01      	ldr	r2, [sp, #4]
 8018c1e:	58d4      	ldr	r4, [r2, r3]
 8018c20:	e7f1      	b.n	8018c06 <fn_08018B60+0xa6>
 8018c22:	2401      	movs	r4, #1
 8018c24:	4264      	negs	r4, r4
 8018c26:	e7ee      	b.n	8018c06 <fn_08018B60+0xa6>
 8018c28:	2300      	movs	r3, #0
 8018c2a:	469b      	mov	fp, r3
 8018c2c:	469a      	mov	sl, r3
 8018c2e:	e7c3      	b.n	8018bb8 <fn_08018B60+0x58>
 8018c30:	030064c4 	.word	0x030064c4
 8018c34:	00001118 	.word	0x00001118
 8018c38:	0814a2f8 	.word	0x0814a2f8
 8018c3c:	00001114 	.word	0x00001114
 8018c40:	0814a304 	.word	0x0814a304
 8018c44:	0000111c 	.word	0x0000111c
