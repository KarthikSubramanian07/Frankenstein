fn_08003B58:
 8003b58:	b5f0      	push	{r4, r5, r6, r7, lr}
 8003b5a:	46c6      	mov	lr, r8
 8003b5c:	2100      	movs	r1, #0
 8003b5e:	4e35      	ldr	r6, [pc, #212]	@ (8003c34 <fn_08003B58+0xdc>)
 8003b60:	b500      	push	{lr}
 8003b62:	6833      	ldr	r3, [r6, #0]
 8003b64:	4a34      	ldr	r2, [pc, #208]	@ (8003c38 <fn_08003B58+0xe0>)
 8003b66:	5299      	strh	r1, [r3, r2]
 8003b68:	4a34      	ldr	r2, [pc, #208]	@ (8003c3c <fn_08003B58+0xe4>)
 8003b6a:	569d      	ldrsb	r5, [r3, r2]
 8003b6c:	3207      	adds	r2, #7
 8003b6e:	589f      	ldr	r7, [r3, r2]
 8003b70:	1c2a      	adds	r2, r5, #0
 8003b72:	2d04      	cmp	r5, #4
 8003b74:	dd00      	ble.n	8003b78 <fn_08003B58+0x20>
 8003b76:	2204      	movs	r2, #4
 8003b78:	0612      	lsls	r2, r2, #24
 8003b7a:	1612      	asrs	r2, r2, #24
 8003b7c:	4690      	mov	r8, r2
 8003b7e:	2294      	movs	r2, #148	@ 0x94
 8003b80:	0092      	lsls	r2, r2, #2
 8003b82:	589c      	ldr	r4, [r3, r2]
 8003b84:	2c00      	cmp	r4, #0
 8003b86:	dc00      	bgt.n	8003b8a <fn_08003B58+0x32>
 8003b88:	2401      	movs	r4, #1
 8003b8a:	2294      	movs	r2, #148	@ 0x94
 8003b8c:	5c9b      	ldrb	r3, [r3, r2]
 8003b8e:	2b03      	cmp	r3, #3
 8003b90:	d03e      	beq.n	8003c10 <fn_08003B58+0xb8>
 8003b92:	2b00      	cmp	r3, #0
 8003b94:	d12e      	bne.n	8003bf4 <fn_08003B58+0x9c>
 8003b96:	2f09      	cmp	r7, #9
 8003b98:	dc43      	bgt.n	8003c22 <fn_08003B58+0xca>
 8003b9a:	2f00      	cmp	r7, #0
 8003b9c:	dd47      	ble.n	8003c2e <fn_08003B58+0xd6>
 8003b9e:	2401      	movs	r4, #1
 8003ba0:	f002 ffd0 	bl	8006b44 <fn_08006B44>
 8003ba4:	2201      	movs	r2, #1
 8003ba6:	6833      	ldr	r3, [r6, #0]
 8003ba8:	2d03      	cmp	r5, #3
 8003baa:	dc00      	bgt.n	8003bae <fn_08003B58+0x56>
 8003bac:	2200      	movs	r2, #0
 8003bae:	4924      	ldr	r1, [pc, #144]	@ (8003c40 <fn_08003B58+0xe8>)
 8003bb0:	545a      	strb	r2, [r3, r1]
 8003bb2:	22e4      	movs	r2, #228	@ 0xe4
 8003bb4:	2102      	movs	r1, #2
 8003bb6:	5499      	strb	r1, [r3, r2]
 8003bb8:	4a22      	ldr	r2, [pc, #136]	@ (8003c44 <fn_08003B58+0xec>)
 8003bba:	3901      	subs	r1, #1
 8003bbc:	5499      	strb	r1, [r3, r2]
 8003bbe:	781a      	ldrb	r2, [r3, #0]
 8003bc0:	438a      	bics	r2, r1
 8003bc2:	701a      	strb	r2, [r3, #0]
 8003bc4:	22d8      	movs	r2, #216	@ 0xd8
 8003bc6:	6833      	ldr	r3, [r6, #0]
 8003bc8:	4641      	mov	r1, r8
 8003bca:	509c      	str	r4, [r3, r2]
 8003bcc:	2400      	movs	r4, #0
 8003bce:	3204      	adds	r2, #4
 8003bd0:	509f      	str	r7, [r3, r2]
 8003bd2:	3a06      	subs	r2, #6
 8003bd4:	5499      	strb	r1, [r3, r2]
 8003bd6:	325b      	adds	r2, #91	@ 0x5b
 8003bd8:	32ff      	adds	r2, #255	@ 0xff
 8003bda:	509c      	str	r4, [r3, r2]
 8003bdc:	f7ff fa42 	bl	8003064 <fn_08003064>
 8003be0:	23d4      	movs	r3, #212	@ 0xd4
 8003be2:	6832      	ldr	r2, [r6, #0]
 8003be4:	54d4      	strb	r4, [r2, r3]
 8003be6:	f017 ff23 	bl	801ba30 <fn_0801BA30>
 8003bea:	bc80      	pop	{r7}
 8003bec:	46b8      	mov	r8, r7
 8003bee:	bcf0      	pop	{r4, r5, r6, r7}
 8003bf0:	bc01      	pop	{r0}
 8003bf2:	4700      	bx	r0
 8003bf4:	2c03      	cmp	r4, #3
 8003bf6:	dc16      	bgt.n	8003c26 <fn_08003B58+0xce>
 8003bf8:	2f00      	cmp	r7, #0
 8003bfa:	dd10      	ble.n	8003c1e <fn_08003B58+0xc6>
 8003bfc:	2b02      	cmp	r3, #2
 8003bfe:	d0cf      	beq.n	8003ba0 <fn_08003B58+0x48>
 8003c00:	2301      	movs	r3, #1
 8003c02:	2f09      	cmp	r7, #9
 8003c04:	dc00      	bgt.n	8003c08 <fn_08003B58+0xb0>
 8003c06:	2300      	movs	r3, #0
 8003c08:	061b      	lsls	r3, r3, #24
 8003c0a:	d0c9      	beq.n	8003ba0 <fn_08003B58+0x48>
 8003c0c:	2709      	movs	r7, #9
 8003c0e:	e7c7      	b.n	8003ba0 <fn_08003B58+0x48>
 8003c10:	2c04      	cmp	r4, #4
 8003c12:	dd00      	ble.n	8003c16 <fn_08003B58+0xbe>
 8003c14:	2404      	movs	r4, #4
 8003c16:	2f09      	cmp	r7, #9
 8003c18:	dcf8      	bgt.n	8003c0c <fn_08003B58+0xb4>
 8003c1a:	2f00      	cmp	r7, #0
 8003c1c:	dcc0      	bgt.n	8003ba0 <fn_08003B58+0x48>
 8003c1e:	2701      	movs	r7, #1
 8003c20:	e7be      	b.n	8003ba0 <fn_08003B58+0x48>
 8003c22:	2709      	movs	r7, #9
 8003c24:	e7bb      	b.n	8003b9e <fn_08003B58+0x46>
 8003c26:	2403      	movs	r4, #3
 8003c28:	2f00      	cmp	r7, #0
 8003c2a:	dce7      	bgt.n	8003bfc <fn_08003B58+0xa4>
 8003c2c:	e7f7      	b.n	8003c1e <fn_08003B58+0xc6>
 8003c2e:	2701      	movs	r7, #1
 8003c30:	e7b5      	b.n	8003b9e <fn_08003B58+0x46>
 8003c32:	46c0      	nop			@ (mov r8, r8)
 8003c34:	030064c4 	.word	0x030064c4
 8003c38:	0000025e 	.word	0x0000025e
 8003c3c:	0000024d 	.word	0x0000024d
 8003c40:	0000025a 	.word	0x0000025a
 8003c44:	0000025b 	.word	0x0000025b
