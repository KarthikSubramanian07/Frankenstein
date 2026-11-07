fn_0801C9EC:
 801c9ec:	2294      	movs	r2, #148	@ 0x94
 801c9ee:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c9f0:	4f35      	ldr	r7, [pc, #212]	@ (801cac8 <fn_0801C9EC+0xdc>)
 801c9f2:	683b      	ldr	r3, [r7, #0]
 801c9f4:	5c9a      	ldrb	r2, [r3, r2]
 801c9f6:	b085      	sub	sp, #20
 801c9f8:	2a02      	cmp	r2, #2
 801c9fa:	d03d      	beq.n	801ca78 <fn_0801C9EC+0x8c>
 801c9fc:	4933      	ldr	r1, [pc, #204]	@ (801cacc <fn_0801C9EC+0xe0>)
 801c9fe:	585b      	ldr	r3, [r3, r1]
 801ca00:	681b      	ldr	r3, [r3, #0]
 801ca02:	2a03      	cmp	r2, #3
 801ca04:	d101      	bne.n	801ca0a <fn_0801C9EC+0x1e>
 801ca06:	2b03      	cmp	r3, #3
 801ca08:	d036      	beq.n	801ca78 <fn_0801C9EC+0x8c>
 801ca0a:	ac01      	add	r4, sp, #4
 801ca0c:	2109      	movs	r1, #9
 801ca0e:	0020      	movs	r0, r4
 801ca10:	4a2f      	ldr	r2, [pc, #188]	@ (801cad0 <fn_0801C9EC+0xe4>)
 801ca12:	f7e8 fd21 	bl	8005458 <fn_08005458>
 801ca16:	0020      	movs	r0, r4
 801ca18:	f000 fd32 	bl	801d480 <fn_0801D480>
 801ca1c:	f7ff fbd2 	bl	801c1c4 <fn_0801C1C4>
 801ca20:	2294      	movs	r2, #148	@ 0x94
 801ca22:	683b      	ldr	r3, [r7, #0]
 801ca24:	5c9a      	ldrb	r2, [r3, r2]
 801ca26:	2a02      	cmp	r2, #2
 801ca28:	d02e      	beq.n	801ca88 <fn_0801C9EC+0x9c>
 801ca2a:	4a28      	ldr	r2, [pc, #160]	@ (801cacc <fn_0801C9EC+0xe0>)
 801ca2c:	589a      	ldr	r2, [r3, r2]
 801ca2e:	6811      	ldr	r1, [r2, #0]
 801ca30:	2902      	cmp	r1, #2
 801ca32:	dc1b      	bgt.n	801ca6c <fn_0801C9EC+0x80>
 801ca34:	6895      	ldr	r5, [r2, #8]
 801ca36:	2d08      	cmp	r5, #8
 801ca38:	d02c      	beq.n	801ca94 <fn_0801C9EC+0xa8>
 801ca3a:	2d00      	cmp	r5, #0
 801ca3c:	db0b      	blt.n	801ca56 <fn_0801C9EC+0x6a>
 801ca3e:	2400      	movs	r4, #0
 801ca40:	4e24      	ldr	r6, [pc, #144]	@ (801cad4 <fn_0801C9EC+0xe8>)
 801ca42:	0020      	movs	r0, r4
 801ca44:	0031      	movs	r1, r6
 801ca46:	3401      	adds	r4, #1
 801ca48:	f7ff fec4 	bl	801c7d4 <fn_0801C7D4>
 801ca4c:	42a5      	cmp	r5, r4
 801ca4e:	daf8      	bge.n	801ca42 <fn_0801C9EC+0x56>
 801ca50:	683b      	ldr	r3, [r7, #0]
 801ca52:	4a1e      	ldr	r2, [pc, #120]	@ (801cacc <fn_0801C9EC+0xe0>)
 801ca54:	589a      	ldr	r2, [r3, r2]
 801ca56:	7912      	ldrb	r2, [r2, #4]
 801ca58:	2a00      	cmp	r2, #0
 801ca5a:	d120      	bne.n	801ca9e <fn_0801C9EC+0xb2>
 801ca5c:	4a1e      	ldr	r2, [pc, #120]	@ (801cad8 <fn_0801C9EC+0xec>)
 801ca5e:	5c9a      	ldrb	r2, [r3, r2]
 801ca60:	2a00      	cmp	r2, #0
 801ca62:	d125      	bne.n	801cab0 <fn_0801C9EC+0xc4>
 801ca64:	2294      	movs	r2, #148	@ 0x94
 801ca66:	5c9a      	ldrb	r2, [r3, r2]
 801ca68:	2a02      	cmp	r2, #2
 801ca6a:	d00d      	beq.n	801ca88 <fn_0801C9EC+0x9c>
 801ca6c:	f7ff fe54 	bl	801c718 <fn_0801C718>
 801ca70:	b005      	add	sp, #20
 801ca72:	bcf0      	pop	{r4, r5, r6, r7}
 801ca74:	bc01      	pop	{r0}
 801ca76:	4700      	bx	r0
 801ca78:	ac01      	add	r4, sp, #4
 801ca7a:	0022      	movs	r2, r4
 801ca7c:	4b17      	ldr	r3, [pc, #92]	@ (801cadc <fn_0801C9EC+0xf0>)
 801ca7e:	cb03      	ldmia	r3!, {r0, r1}
 801ca80:	c203      	stmia	r2!, {r0, r1}
 801ca82:	781b      	ldrb	r3, [r3, #0]
 801ca84:	7013      	strb	r3, [r2, #0]
 801ca86:	e7c6      	b.n	801ca16 <fn_0801C9EC+0x2a>
 801ca88:	4a10      	ldr	r2, [pc, #64]	@ (801cacc <fn_0801C9EC+0xe0>)
 801ca8a:	589b      	ldr	r3, [r3, r2]
 801ca8c:	68db      	ldr	r3, [r3, #12]
 801ca8e:	2b1e      	cmp	r3, #30
 801ca90:	d1ec      	bne.n	801ca6c <fn_0801C9EC+0x80>
 801ca92:	e7ed      	b.n	801ca70 <fn_0801C9EC+0x84>
 801ca94:	68d5      	ldr	r5, [r2, #12]
 801ca96:	3d01      	subs	r5, #1
 801ca98:	2d00      	cmp	r5, #0
 801ca9a:	dad0      	bge.n	801ca3e <fn_0801C9EC+0x52>
 801ca9c:	e7db      	b.n	801ca56 <fn_0801C9EC+0x6a>
 801ca9e:	2008      	movs	r0, #8
 801caa0:	490c      	ldr	r1, [pc, #48]	@ (801cad4 <fn_0801C9EC+0xe8>)
 801caa2:	f7ff fe97 	bl	801c7d4 <fn_0801C7D4>
 801caa6:	683b      	ldr	r3, [r7, #0]
 801caa8:	4a0b      	ldr	r2, [pc, #44]	@ (801cad8 <fn_0801C9EC+0xec>)
 801caaa:	5c9a      	ldrb	r2, [r3, r2]
 801caac:	2a00      	cmp	r2, #0
 801caae:	d0d9      	beq.n	801ca64 <fn_0801C9EC+0x78>
 801cab0:	4a06      	ldr	r2, [pc, #24]	@ (801cacc <fn_0801C9EC+0xe0>)
 801cab2:	589b      	ldr	r3, [r3, r2]
 801cab4:	490a      	ldr	r1, [pc, #40]	@ (801cae0 <fn_0801C9EC+0xf4>)
 801cab6:	68d8      	ldr	r0, [r3, #12]
 801cab8:	f7ff fe8c 	bl	801c7d4 <fn_0801C7D4>
 801cabc:	2294      	movs	r2, #148	@ 0x94
 801cabe:	683b      	ldr	r3, [r7, #0]
 801cac0:	5c9a      	ldrb	r2, [r3, r2]
 801cac2:	2a02      	cmp	r2, #2
 801cac4:	d1d2      	bne.n	801ca6c <fn_0801C9EC+0x80>
 801cac6:	e7df      	b.n	801ca88 <fn_0801C9EC+0x9c>
 801cac8:	030064c4 	.word	0x030064c4
 801cacc:	00005a40 	.word	0x00005a40
 801cad0:	0814a95c 	.word	0x0814a95c
 801cad4:	08147828 	.word	0x08147828
 801cad8:	00005a98 	.word	0x00005a98
 801cadc:	0814a964 	.word	0x0814a964
 801cae0:	0814782c 	.word	0x0814782c
