fn_080079E4:
 80079e4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80079e6:	4657      	mov	r7, sl
 80079e8:	464e      	mov	r6, r9
 80079ea:	4645      	mov	r5, r8
 80079ec:	46de      	mov	lr, fp
 80079ee:	b5e0      	push	{r5, r6, r7, lr}
 80079f0:	4b32      	ldr	r3, [pc, #200]	@ (8007abc <fn_080079E4+0xd8>)
 80079f2:	681d      	ldr	r5, [r3, #0]
 80079f4:	4b32      	ldr	r3, [pc, #200]	@ (8007ac0 <fn_080079E4+0xdc>)
 80079f6:	5cec      	ldrb	r4, [r5, r3]
 80079f8:	0006      	movs	r6, r0
 80079fa:	000f      	movs	r7, r1
 80079fc:	b083      	sub	sp, #12
 80079fe:	2c00      	cmp	r4, #0
 8007a00:	d044      	beq.n	8007a8c <fn_080079E4+0xa8>
 8007a02:	002b      	movs	r3, r5
 8007a04:	33e0      	adds	r3, #224	@ 0xe0
 8007a06:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 8007a08:	2b00      	cmp	r3, #0
 8007a0a:	dd49      	ble.n	8007aa0 <fn_080079E4+0xbc>
 8007a0c:	23e0      	movs	r3, #224	@ 0xe0
 8007a0e:	58eb      	ldr	r3, [r5, r3]
 8007a10:	68c0      	ldr	r0, [r0, #12]
 8007a12:	68da      	ldr	r2, [r3, #12]
 8007a14:	6931      	ldr	r1, [r6, #16]
 8007a16:	4698      	mov	r8, r3
 8007a18:	691b      	ldr	r3, [r3, #16]
 8007a1a:	9100      	str	r1, [sp, #0]
 8007a1c:	4682      	mov	sl, r0
 8007a1e:	1a59      	subs	r1, r3, r1
 8007a20:	1a10      	subs	r0, r2, r0
 8007a22:	469b      	mov	fp, r3
 8007a24:	4691      	mov	r9, r2
 8007a26:	f008 f9e9 	bl	800fdfc <fn_0800FDFC>
 8007a2a:	23c0      	movs	r3, #192	@ 0xc0
 8007a2c:	9001      	str	r0, [sp, #4]
 8007a2e:	049b      	lsls	r3, r3, #18
 8007a30:	4298      	cmp	r0, r3
 8007a32:	dd0b      	ble.n	8007a4c <fn_080079E4+0x68>
 8007a34:	235a      	movs	r3, #90	@ 0x5a
 8007a36:	5cf2      	ldrb	r2, [r6, r3]
 8007a38:	2a1a      	cmp	r2, #26
 8007a3a:	d831      	bhi.n	8007aa0 <fn_080079E4+0xbc>
 8007a3c:	2385      	movs	r3, #133	@ 0x85
 8007a3e:	04db      	lsls	r3, r3, #19
 8007a40:	40d3      	lsrs	r3, r2
 8007a42:	2201      	movs	r2, #1
 8007a44:	0014      	movs	r4, r2
 8007a46:	401c      	ands	r4, r3
 8007a48:	421a      	tst	r2, r3
 8007a4a:	d01f      	beq.n	8007a8c <fn_080079E4+0xa8>
 8007a4c:	2f00      	cmp	r7, #0
 8007a4e:	d117      	bne.n	8007a80 <fn_080079E4+0x9c>
 8007a50:	465b      	mov	r3, fp
 8007a52:	464a      	mov	r2, r9
 8007a54:	4650      	mov	r0, sl
 8007a56:	9900      	ldr	r1, [sp, #0]
 8007a58:	f01d fdda 	bl	8025610 <fn_08025610>
 8007a5c:	003a      	movs	r2, r7
 8007a5e:	6a33      	ldr	r3, [r6, #32]
 8007a60:	1ac0      	subs	r0, r0, r3
 8007a62:	4b18      	ldr	r3, [pc, #96]	@ (8007ac4 <fn_080079E4+0xe0>)
 8007a64:	18c0      	adds	r0, r0, r3
 8007a66:	4b18      	ldr	r3, [pc, #96]	@ (8007ac8 <fn_080079E4+0xe4>)
 8007a68:	4283      	cmp	r3, r0
 8007a6a:	417a      	adcs	r2, r7
 8007a6c:	0613      	lsls	r3, r2, #24
 8007a6e:	d007      	beq.n	8007a80 <fn_080079E4+0x9c>
 8007a70:	2280      	movs	r2, #128	@ 0x80
 8007a72:	9901      	ldr	r1, [sp, #4]
 8007a74:	2301      	movs	r3, #1
 8007a76:	03d2      	lsls	r2, r2, #15
 8007a78:	4291      	cmp	r1, r2
 8007a7a:	dd1d      	ble.n	8007ab8 <fn_080079E4+0xd4>
 8007a7c:	061b      	lsls	r3, r3, #24
 8007a7e:	d10f      	bne.n	8007aa0 <fn_080079E4+0xbc>
 8007a80:	4641      	mov	r1, r8
 8007a82:	0030      	movs	r0, r6
 8007a84:	f00c fc5c 	bl	8014340 <fn_08014340>
 8007a88:	1e04      	subs	r4, r0, #0
 8007a8a:	d10b      	bne.n	8007aa4 <fn_080079E4+0xc0>
 8007a8c:	0020      	movs	r0, r4
 8007a8e:	b003      	add	sp, #12
 8007a90:	bcf0      	pop	{r4, r5, r6, r7}
 8007a92:	46bb      	mov	fp, r7
 8007a94:	46b2      	mov	sl, r6
 8007a96:	46a9      	mov	r9, r5
 8007a98:	46a0      	mov	r8, r4
 8007a9a:	bcf0      	pop	{r4, r5, r6, r7}
 8007a9c:	bc02      	pop	{r1}
 8007a9e:	4708      	bx	r1
 8007aa0:	2400      	movs	r4, #0
 8007aa2:	e7f3      	b.n	8007a8c <fn_080079E4+0xa8>
 8007aa4:	23e0      	movs	r3, #224	@ 0xe0
 8007aa6:	0030      	movs	r0, r6
 8007aa8:	58e9      	ldr	r1, [r5, r3]
 8007aaa:	3050      	adds	r0, #80	@ 0x50
 8007aac:	f010 fdda 	bl	8018664 <fn_08018664>
 8007ab0:	235d      	movs	r3, #93	@ 0x5d
 8007ab2:	223c      	movs	r2, #60	@ 0x3c
 8007ab4:	54f2      	strb	r2, [r6, r3]
 8007ab6:	e7e9      	b.n	8007a8c <fn_080079E4+0xa8>
 8007ab8:	2300      	movs	r3, #0
 8007aba:	e7df      	b.n	8007a7c <fn_080079E4+0x98>
 8007abc:	030064c4 	.word	0x030064c4
 8007ac0:	0000025d 	.word	0x0000025d
 8007ac4:	bfffffff 	.word	0xbfffffff
 8007ac8:	7ffffffe 	.word	0x7ffffffe
