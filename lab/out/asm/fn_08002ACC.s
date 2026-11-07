fn_08002ACC:
 8002acc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002ace:	46de      	mov	lr, fp
 8002ad0:	4657      	mov	r7, sl
 8002ad2:	464e      	mov	r6, r9
 8002ad4:	4645      	mov	r5, r8
 8002ad6:	b5e0      	push	{r5, r6, r7, lr}
 8002ad8:	484b      	ldr	r0, [pc, #300]	@ (8002c08 <fn_08002ACC+0x13c>)
 8002ada:	b083      	sub	sp, #12
 8002adc:	f01a fcd0 	bl	801d480 <fn_0801D480>
 8002ae0:	f019 fb70 	bl	801c1c4 <fn_0801C1C4>
 8002ae4:	22a8      	movs	r2, #168	@ 0xa8
 8002ae6:	4b49      	ldr	r3, [pc, #292]	@ (8002c0c <fn_08002ACC+0x140>)
 8002ae8:	6819      	ldr	r1, [r3, #0]
 8002aea:	9301      	str	r3, [sp, #4]
 8002aec:	4b48      	ldr	r3, [pc, #288]	@ (8002c10 <fn_08002ACC+0x144>)
 8002aee:	588a      	ldr	r2, [r1, r2]
 8002af0:	58cc      	ldr	r4, [r1, r3]
 8002af2:	4b48      	ldr	r3, [pc, #288]	@ (8002c14 <fn_08002ACC+0x148>)
 8002af4:	0052      	lsls	r2, r2, #1
 8002af6:	5cd3      	ldrb	r3, [r2, r3]
 8002af8:	009b      	lsls	r3, r3, #2
 8002afa:	591b      	ldr	r3, [r3, r4]
 8002afc:	18e4      	adds	r4, r4, r3
 8002afe:	2c00      	cmp	r4, #0
 8002b00:	d062      	beq.n	8002bc8 <fn_08002ACC+0xfc>
 8002b02:	7820      	ldrb	r0, [r4, #0]
 8002b04:	1e02      	subs	r2, r0, #0
 8002b06:	d05f      	beq.n	8002bc8 <fn_08002ACC+0xfc>
 8002b08:	2500      	movs	r5, #0
 8002b0a:	2603      	movs	r6, #3
 8002b0c:	3401      	adds	r4, #1
 8002b0e:	46ac      	mov	ip, r5
 8002b10:	46a2      	mov	sl, r4
 8002b12:	0003      	movs	r3, r0
 8002b14:	4681      	mov	r9, r0
 8002b16:	46b0      	mov	r8, r6
 8002b18:	4d3f      	ldr	r5, [pc, #252]	@ (8002c18 <fn_08002ACC+0x14c>)
 8002b1a:	e00d      	b.n	8002b38 <fn_08002ACC+0x6c>
 8002b1c:	3377      	adds	r3, #119	@ 0x77
 8002b1e:	009b      	lsls	r3, r3, #2
 8002b20:	18cb      	adds	r3, r1, r3
 8002b22:	685b      	ldr	r3, [r3, #4]
 8002b24:	2600      	movs	r6, #0
 8002b26:	5f9b      	ldrsh	r3, [r3, r6]
 8002b28:	449c      	add	ip, r3
 8002b2a:	4653      	mov	r3, sl
 8002b2c:	781b      	ldrb	r3, [r3, #0]
 8002b2e:	4699      	mov	r9, r3
 8002b30:	2b00      	cmp	r3, #0
 8002b32:	d016      	beq.n	8002b62 <fn_08002ACC+0x96>
 8002b34:	2601      	movs	r6, #1
 8002b36:	44b2      	add	sl, r6
 8002b38:	464e      	mov	r6, r9
 8002b3a:	4647      	mov	r7, r8
 8002b3c:	5dae      	ldrb	r6, [r5, r6]
 8002b3e:	403e      	ands	r6, r7
 8002b40:	2e02      	cmp	r6, #2
 8002b42:	d100      	bne.n	8002b46 <fn_08002ACC+0x7a>
 8002b44:	3b20      	subs	r3, #32
 8002b46:	2621      	movs	r6, #33	@ 0x21
 8002b48:	4276      	negs	r6, r6
 8002b4a:	46b1      	mov	r9, r6
 8002b4c:	4499      	add	r9, r3
 8002b4e:	464e      	mov	r6, r9
 8002b50:	2e3f      	cmp	r6, #63	@ 0x3f
 8002b52:	d9e3      	bls.n	8002b1c <fn_08002ACC+0x50>
 8002b54:	2304      	movs	r3, #4
 8002b56:	449c      	add	ip, r3
 8002b58:	4653      	mov	r3, sl
 8002b5a:	781b      	ldrb	r3, [r3, #0]
 8002b5c:	4699      	mov	r9, r3
 8002b5e:	2b00      	cmp	r3, #0
 8002b60:	d1e8      	bne.n	8002b34 <fn_08002ACC+0x68>
 8002b62:	4663      	mov	r3, ip
 8002b64:	0fdf      	lsrs	r7, r3, #31
 8002b66:	2303      	movs	r3, #3
 8002b68:	4698      	mov	r8, r3
 8002b6a:	4467      	add	r7, ip
 8002b6c:	107f      	asrs	r7, r7, #1
 8002b6e:	427f      	negs	r7, r7
 8002b70:	3778      	adds	r7, #120	@ 0x78
 8002b72:	5c2b      	ldrb	r3, [r5, r0]
 8002b74:	4640      	mov	r0, r8
 8002b76:	4003      	ands	r3, r0
 8002b78:	2b02      	cmp	r3, #2
 8002b7a:	d100      	bne.n	8002b7e <fn_08002ACC+0xb2>
 8002b7c:	3a20      	subs	r2, #32
 8002b7e:	0013      	movs	r3, r2
 8002b80:	3b21      	subs	r3, #33	@ 0x21
 8002b82:	2b3f      	cmp	r3, #63	@ 0x3f
 8002b84:	d90d      	bls.n	8002ba2 <fn_08002ACC+0xd6>
 8002b86:	7822      	ldrb	r2, [r4, #0]
 8002b88:	1e10      	subs	r0, r2, #0
 8002b8a:	d01d      	beq.n	8002bc8 <fn_08002ACC+0xfc>
 8002b8c:	5c2b      	ldrb	r3, [r5, r0]
 8002b8e:	4640      	mov	r0, r8
 8002b90:	3704      	adds	r7, #4
 8002b92:	3401      	adds	r4, #1
 8002b94:	4003      	ands	r3, r0
 8002b96:	2b02      	cmp	r3, #2
 8002b98:	d0f0      	beq.n	8002b7c <fn_08002ACC+0xb0>
 8002b9a:	0013      	movs	r3, r2
 8002b9c:	3b21      	subs	r3, #33	@ 0x21
 8002b9e:	2b3f      	cmp	r3, #63	@ 0x3f
 8002ba0:	d8f1      	bhi.n	8002b86 <fn_08002ACC+0xba>
 8002ba2:	3277      	adds	r2, #119	@ 0x77
 8002ba4:	0092      	lsls	r2, r2, #2
 8002ba6:	188a      	adds	r2, r1, r2
 8002ba8:	6852      	ldr	r2, [r2, #4]
 8002baa:	2100      	movs	r1, #0
 8002bac:	5e53      	ldrsh	r3, [r2, r1]
 8002bae:	0038      	movs	r0, r7
 8002bb0:	2190      	movs	r1, #144	@ 0x90
 8002bb2:	4699      	mov	r9, r3
 8002bb4:	f022 fcb8 	bl	8025528 <fn_08025528>
 8002bb8:	9b01      	ldr	r3, [sp, #4]
 8002bba:	7822      	ldrb	r2, [r4, #0]
 8002bbc:	6819      	ldr	r1, [r3, #0]
 8002bbe:	1e10      	subs	r0, r2, #0
 8002bc0:	d002      	beq.n	8002bc8 <fn_08002ACC+0xfc>
 8002bc2:	444f      	add	r7, r9
 8002bc4:	3401      	adds	r4, #1
 8002bc6:	e7d4      	b.n	8002b72 <fn_08002ACC+0xa6>
 8002bc8:	23b0      	movs	r3, #176	@ 0xb0
 8002bca:	58cb      	ldr	r3, [r1, r3]
 8002bcc:	4a13      	ldr	r2, [pc, #76]	@ (8002c1c <fn_08002ACC+0x150>)
 8002bce:	8818      	ldrh	r0, [r3, #0]
 8002bd0:	885b      	ldrh	r3, [r3, #2]
 8002bd2:	588a      	ldr	r2, [r1, r2]
 8002bd4:	00c0      	lsls	r0, r0, #3
 8002bd6:	045b      	lsls	r3, r3, #17
 8002bd8:	0c5c      	lsrs	r4, r3, #17
 8002bda:	1812      	adds	r2, r2, r0
 8002bdc:	0b9b      	lsrs	r3, r3, #14
 8002bde:	6852      	ldr	r2, [r2, #4]
 8002be0:	191b      	adds	r3, r3, r4
 8002be2:	005b      	lsls	r3, r3, #1
 8002be4:	5e9b      	ldrsh	r3, [r3, r2]
 8002be6:	4a0e      	ldr	r2, [pc, #56]	@ (8002c20 <fn_08002ACC+0x154>)
 8002be8:	588a      	ldr	r2, [r1, r2]
 8002bea:	20a0      	movs	r0, #160	@ 0xa0
 8002bec:	189b      	adds	r3, r3, r2
 8002bee:	21aa      	movs	r1, #170	@ 0xaa
 8002bf0:	2200      	movs	r2, #0
 8002bf2:	f019 fa9d 	bl	801c130 <fn_0801C130>
 8002bf6:	b003      	add	sp, #12
 8002bf8:	bcf0      	pop	{r4, r5, r6, r7}
 8002bfa:	46bb      	mov	fp, r7
 8002bfc:	46b2      	mov	sl, r6
 8002bfe:	46a9      	mov	r9, r5
 8002c00:	46a0      	mov	r8, r4
 8002c02:	bcf0      	pop	{r4, r5, r6, r7}
 8002c04:	bc01      	pop	{r0}
 8002c06:	4700      	bx	r0
 8002c08:	081492d4 	.word	0x081492d4
 8002c0c:	030064c4 	.word	0x030064c4
 8002c10:	0000075c 	.word	0x0000075c
 8002c14:	08025860 	.word	0x08025860
 8002c18:	0814b3b9 	.word	0x0814b3b9
 8002c1c:	000041b8 	.word	0x000041b8
 8002c20:	00001108 	.word	0x00001108
