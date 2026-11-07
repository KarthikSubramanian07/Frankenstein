fn_08018AAC:
 8018aac:	b5f0      	push	{r4, r5, r6, r7, lr}
 8018aae:	46de      	mov	lr, fp
 8018ab0:	4657      	mov	r7, sl
 8018ab2:	464e      	mov	r6, r9
 8018ab4:	4645      	mov	r5, r8
 8018ab6:	b5e0      	push	{r5, r6, r7, lr}
 8018ab8:	b087      	sub	sp, #28
 8018aba:	0001      	movs	r1, r0
 8018abc:	2208      	movs	r2, #8
 8018abe:	a803      	add	r0, sp, #12
 8018ac0:	f008 fc76 	bl	80213b0 <fn_080213B0>
 8018ac4:	2300      	movs	r3, #0
 8018ac6:	466a      	mov	r2, sp
 8018ac8:	a803      	add	r0, sp, #12
 8018aca:	7513      	strb	r3, [r2, #20]
 8018acc:	f007 ff1c 	bl	8020908 <fn_08020908>
 8018ad0:	4b2a      	ldr	r3, [pc, #168]	@ (8018b7c <fn_08018AAC+0xd0>)
 8018ad2:	681a      	ldr	r2, [r3, #0]
 8018ad4:	4b2a      	ldr	r3, [pc, #168]	@ (8018b80 <fn_08018AAC+0xd4>)
 8018ad6:	58d0      	ldr	r0, [r2, r3]
 8018ad8:	9201      	str	r2, [sp, #4]
 8018ada:	2800      	cmp	r0, #0
 8018adc:	d005      	beq.n	8018aea <fn_08018AAC+0x3e>
 8018ade:	2208      	movs	r2, #8
 8018ae0:	a903      	add	r1, sp, #12
 8018ae2:	f008 fdf5 	bl	80216d0 <fn_080216D0>
 8018ae6:	2800      	cmp	r0, #0
 8018ae8:	d03d      	beq.n	8018b66 <fn_08018AAC+0xba>
 8018aea:	4826      	ldr	r0, [pc, #152]	@ (8018b84 <fn_08018AAC+0xd8>)
 8018aec:	f004 fca2 	bl	801d434 <fn_0801D434>
 8018af0:	3001      	adds	r0, #1
 8018af2:	d03f      	beq.n	8018b74 <fn_08018AAC+0xc8>
 8018af4:	4823      	ldr	r0, [pc, #140]	@ (8018b84 <fn_08018AAC+0xd8>)
 8018af6:	f004 fcc3 	bl	801d480 <fn_0801D480>
 8018afa:	f004 fd35 	bl	801d568 <fn_0801D568>
 8018afe:	1d03      	adds	r3, r0, #4
 8018b00:	4682      	mov	sl, r0
 8018b02:	469b      	mov	fp, r3
 8018b04:	4b20      	ldr	r3, [pc, #128]	@ (8018b88 <fn_08018AAC+0xdc>)
 8018b06:	9a01      	ldr	r2, [sp, #4]
 8018b08:	58d3      	ldr	r3, [r2, r3]
 8018b0a:	4698      	mov	r8, r3
 8018b0c:	2b00      	cmp	r3, #0
 8018b0e:	dd2e      	ble.n	8018b6e <fn_08018AAC+0xc2>
 8018b10:	481e      	ldr	r0, [pc, #120]	@ (8018b8c <fn_08018AAC+0xe0>)
 8018b12:	f004 fcb5 	bl	801d480 <fn_0801D480>
 8018b16:	f004 fd27 	bl	801d568 <fn_0801D568>
 8018b1a:	0006      	movs	r6, r0
 8018b1c:	ce08      	ldmia	r6!, {r3}
 8018b1e:	0007      	movs	r7, r0
 8018b20:	4699      	mov	r9, r3
 8018b22:	2400      	movs	r4, #0
 8018b24:	e003      	b.n	8018b2e <fn_08018AAC+0x82>
 8018b26:	3401      	adds	r4, #1
 8018b28:	3604      	adds	r6, #4
 8018b2a:	4544      	cmp	r4, r8
 8018b2c:	d01f      	beq.n	8018b6e <fn_08018AAC+0xc2>
 8018b2e:	45a1      	cmp	r9, r4
 8018b30:	d101      	bne.n	8018b36 <fn_08018AAC+0x8a>
 8018b32:	4657      	mov	r7, sl
 8018b34:	465e      	mov	r6, fp
 8018b36:	6835      	ldr	r5, [r6, #0]
 8018b38:	197d      	adds	r5, r7, r5
 8018b3a:	2208      	movs	r2, #8
 8018b3c:	0029      	movs	r1, r5
 8018b3e:	a803      	add	r0, sp, #12
 8018b40:	f008 fdc6 	bl	80216d0 <fn_080216D0>
 8018b44:	2800      	cmp	r0, #0
 8018b46:	d1ee      	bne.n	8018b26 <fn_08018AAC+0x7a>
 8018b48:	4b0d      	ldr	r3, [pc, #52]	@ (8018b80 <fn_08018AAC+0xd4>)
 8018b4a:	9a01      	ldr	r2, [sp, #4]
 8018b4c:	50d5      	str	r5, [r2, r3]
 8018b4e:	4b10      	ldr	r3, [pc, #64]	@ (8018b90 <fn_08018AAC+0xe4>)
 8018b50:	50d4      	str	r4, [r2, r3]
 8018b52:	0020      	movs	r0, r4
 8018b54:	b007      	add	sp, #28
 8018b56:	bcf0      	pop	{r4, r5, r6, r7}
 8018b58:	46bb      	mov	fp, r7
 8018b5a:	46b2      	mov	sl, r6
 8018b5c:	46a9      	mov	r9, r5
 8018b5e:	46a0      	mov	r8, r4
 8018b60:	bcf0      	pop	{r4, r5, r6, r7}
 8018b62:	bc02      	pop	{r1}
 8018b64:	4708      	bx	r1
 8018b66:	4b0a      	ldr	r3, [pc, #40]	@ (8018b90 <fn_08018AAC+0xe4>)
 8018b68:	9a01      	ldr	r2, [sp, #4]
 8018b6a:	58d4      	ldr	r4, [r2, r3]
 8018b6c:	e7f1      	b.n	8018b52 <fn_08018AAC+0xa6>
 8018b6e:	2401      	movs	r4, #1
 8018b70:	4264      	negs	r4, r4
 8018b72:	e7ee      	b.n	8018b52 <fn_08018AAC+0xa6>
 8018b74:	2300      	movs	r3, #0
 8018b76:	469b      	mov	fp, r3
 8018b78:	469a      	mov	sl, r3
 8018b7a:	e7c3      	b.n	8018b04 <fn_08018AAC+0x58>
 8018b7c:	030064c4 	.word	0x030064c4
 8018b80:	00001118 	.word	0x00001118
 8018b84:	0814a224 	.word	0x0814a224
 8018b88:	00001114 	.word	0x00001114
 8018b8c:	0814a230 	.word	0x0814a230
 8018b90:	0000111c 	.word	0x0000111c
