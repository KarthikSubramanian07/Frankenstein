fn_08002A4C:
 8002a4c:	7803      	ldrb	r3, [r0, #0]
 8002a4e:	b510      	push	{r4, lr}
 8002a50:	2b00      	cmp	r3, #0
 8002a52:	d12d      	bne.n	8002ab0 <fn_08002A4C+0x64>
 8002a54:	22c5      	movs	r2, #197	@ 0xc5
 8002a56:	4b1a      	ldr	r3, [pc, #104]	@ (8002ac0 <fn_08002A4C+0x74>)
 8002a58:	681b      	ldr	r3, [r3, #0]
 8002a5a:	5c98      	ldrb	r0, [r3, r2]
 8002a5c:	2800      	cmp	r0, #0
 8002a5e:	d124      	bne.n	8002aaa <fn_08002A4C+0x5e>
 8002a60:	21a8      	movs	r1, #168	@ 0xa8
 8002a62:	5859      	ldr	r1, [r3, r1]
 8002a64:	4a17      	ldr	r2, [pc, #92]	@ (8002ac4 <fn_08002A4C+0x78>)
 8002a66:	0049      	lsls	r1, r1, #1
 8002a68:	1852      	adds	r2, r2, r1
 8002a6a:	7851      	ldrb	r1, [r2, #1]
 8002a6c:	225c      	movs	r2, #92	@ 0x5c
 8002a6e:	434a      	muls	r2, r1
 8002a70:	21ea      	movs	r1, #234	@ 0xea
 8002a72:	00c9      	lsls	r1, r1, #3
 8002a74:	5859      	ldr	r1, [r3, r1]
 8002a76:	1889      	adds	r1, r1, r2
 8002a78:	6b0a      	ldr	r2, [r1, #48]	@ 0x30
 8002a7a:	4694      	mov	ip, r2
 8002a7c:	4c12      	ldr	r4, [pc, #72]	@ (8002ac8 <fn_08002A4C+0x7c>)
 8002a7e:	0092      	lsls	r2, r2, #2
 8002a80:	591c      	ldr	r4, [r3, r4]
 8002a82:	4462      	add	r2, ip
 8002a84:	0052      	lsls	r2, r2, #1
 8002a86:	18a2      	adds	r2, r4, r2
 8002a88:	24b0      	movs	r4, #176	@ 0xb0
 8002a8a:	511a      	str	r2, [r3, r4]
 8002a8c:	2404      	movs	r4, #4
 8002a8e:	5f12      	ldrsh	r2, [r2, r4]
 8002a90:	0014      	movs	r4, r2
 8002a92:	22ac      	movs	r2, #172	@ 0xac
 8002a94:	509c      	str	r4, [r3, r2]
 8002a96:	3208      	adds	r2, #8
 8002a98:	5098      	str	r0, [r3, r2]
 8002a9a:	3001      	adds	r0, #1
 8002a9c:	6b89      	ldr	r1, [r1, #56]	@ 0x38
 8002a9e:	3210      	adds	r2, #16
 8002aa0:	30ff      	adds	r0, #255	@ 0xff
 8002aa2:	5298      	strh	r0, [r3, r2]
 8002aa4:	2900      	cmp	r1, #0
 8002aa6:	d105      	bne.n	8002ab4 <fn_08002A4C+0x68>
 8002aa8:	2001      	movs	r0, #1
 8002aaa:	bc10      	pop	{r4}
 8002aac:	bc02      	pop	{r1}
 8002aae:	4708      	bx	r1
 8002ab0:	2000      	movs	r0, #0
 8002ab2:	e7fa      	b.n	8002aaa <fn_08002A4C+0x5e>
 8002ab4:	2000      	movs	r0, #0
 8002ab6:	f017 fc61 	bl	801a37c <fn_0801A37C>
 8002aba:	2001      	movs	r0, #1
 8002abc:	e7f5      	b.n	8002aaa <fn_08002A4C+0x5e>
 8002abe:	46c0      	nop			@ (mov r8, r8)
 8002ac0:	030064c4 	.word	0x030064c4
 8002ac4:	08025910 	.word	0x08025910
 8002ac8:	0000074c 	.word	0x0000074c
