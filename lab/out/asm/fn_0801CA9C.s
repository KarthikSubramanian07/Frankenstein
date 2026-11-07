fn_0801CA9C:
 801ca9c:	2294      	movs	r2, #148	@ 0x94
 801ca9e:	b5f0      	push	{r4, r5, r6, r7, lr}
 801caa0:	4f35      	ldr	r7, [pc, #212]	@ (801cb78 <fn_0801CA9C+0xdc>)
 801caa2:	683b      	ldr	r3, [r7, #0]
 801caa4:	5c9a      	ldrb	r2, [r3, r2]
 801caa6:	b085      	sub	sp, #20
 801caa8:	2a02      	cmp	r2, #2
 801caaa:	d03d      	beq.n	801cb28 <fn_0801CA9C+0x8c>
 801caac:	4933      	ldr	r1, [pc, #204]	@ (801cb7c <fn_0801CA9C+0xe0>)
 801caae:	585b      	ldr	r3, [r3, r1]
 801cab0:	681b      	ldr	r3, [r3, #0]
 801cab2:	2a03      	cmp	r2, #3
 801cab4:	d101      	bne.n	801caba <fn_0801CA9C+0x1e>
 801cab6:	2b03      	cmp	r3, #3
 801cab8:	d036      	beq.n	801cb28 <fn_0801CA9C+0x8c>
 801caba:	ac01      	add	r4, sp, #4
 801cabc:	2109      	movs	r1, #9
 801cabe:	0020      	movs	r0, r4
 801cac0:	4a2f      	ldr	r2, [pc, #188]	@ (801cb80 <fn_0801CA9C+0xe4>)
 801cac2:	f7e8 fcc9 	bl	8005458 <fn_08005458>
 801cac6:	0020      	movs	r0, r4
 801cac8:	f000 fd32 	bl	801d530 <fn_0801D530>
 801cacc:	f7ff fbd2 	bl	801c274 <fn_0801C274>
 801cad0:	2294      	movs	r2, #148	@ 0x94
 801cad2:	683b      	ldr	r3, [r7, #0]
 801cad4:	5c9a      	ldrb	r2, [r3, r2]
 801cad6:	2a02      	cmp	r2, #2
 801cad8:	d02e      	beq.n	801cb38 <fn_0801CA9C+0x9c>
 801cada:	4a28      	ldr	r2, [pc, #160]	@ (801cb7c <fn_0801CA9C+0xe0>)
 801cadc:	589a      	ldr	r2, [r3, r2]
 801cade:	6811      	ldr	r1, [r2, #0]
 801cae0:	2902      	cmp	r1, #2
 801cae2:	dc1b      	bgt.n	801cb1c <fn_0801CA9C+0x80>
 801cae4:	6895      	ldr	r5, [r2, #8]
 801cae6:	2d08      	cmp	r5, #8
 801cae8:	d02c      	beq.n	801cb44 <fn_0801CA9C+0xa8>
 801caea:	2d00      	cmp	r5, #0
 801caec:	db0b      	blt.n	801cb06 <fn_0801CA9C+0x6a>
 801caee:	2400      	movs	r4, #0
 801caf0:	4e24      	ldr	r6, [pc, #144]	@ (801cb84 <fn_0801CA9C+0xe8>)
 801caf2:	0020      	movs	r0, r4
 801caf4:	0031      	movs	r1, r6
 801caf6:	3401      	adds	r4, #1
 801caf8:	f7ff fec4 	bl	801c884 <fn_0801C884>
 801cafc:	42a5      	cmp	r5, r4
 801cafe:	daf8      	bge.n	801caf2 <fn_0801CA9C+0x56>
 801cb00:	683b      	ldr	r3, [r7, #0]
 801cb02:	4a1e      	ldr	r2, [pc, #120]	@ (801cb7c <fn_0801CA9C+0xe0>)
 801cb04:	589a      	ldr	r2, [r3, r2]
 801cb06:	7912      	ldrb	r2, [r2, #4]
 801cb08:	2a00      	cmp	r2, #0
 801cb0a:	d120      	bne.n	801cb4e <fn_0801CA9C+0xb2>
 801cb0c:	4a1e      	ldr	r2, [pc, #120]	@ (801cb88 <fn_0801CA9C+0xec>)
 801cb0e:	5c9a      	ldrb	r2, [r3, r2]
 801cb10:	2a00      	cmp	r2, #0
 801cb12:	d125      	bne.n	801cb60 <fn_0801CA9C+0xc4>
 801cb14:	2294      	movs	r2, #148	@ 0x94
 801cb16:	5c9a      	ldrb	r2, [r3, r2]
 801cb18:	2a02      	cmp	r2, #2
 801cb1a:	d00d      	beq.n	801cb38 <fn_0801CA9C+0x9c>
 801cb1c:	f7ff fe54 	bl	801c7c8 <fn_0801C7C8>
 801cb20:	b005      	add	sp, #20
 801cb22:	bcf0      	pop	{r4, r5, r6, r7}
 801cb24:	bc01      	pop	{r0}
 801cb26:	4700      	bx	r0
 801cb28:	ac01      	add	r4, sp, #4
 801cb2a:	0022      	movs	r2, r4
 801cb2c:	4b17      	ldr	r3, [pc, #92]	@ (801cb8c <fn_0801CA9C+0xf0>)
 801cb2e:	cb03      	ldmia	r3!, {r0, r1}
 801cb30:	c203      	stmia	r2!, {r0, r1}
 801cb32:	781b      	ldrb	r3, [r3, #0]
 801cb34:	7013      	strb	r3, [r2, #0]
 801cb36:	e7c6      	b.n	801cac6 <fn_0801CA9C+0x2a>
 801cb38:	4a10      	ldr	r2, [pc, #64]	@ (801cb7c <fn_0801CA9C+0xe0>)
 801cb3a:	589b      	ldr	r3, [r3, r2]
 801cb3c:	68db      	ldr	r3, [r3, #12]
 801cb3e:	2b1e      	cmp	r3, #30
 801cb40:	d1ec      	bne.n	801cb1c <fn_0801CA9C+0x80>
 801cb42:	e7ed      	b.n	801cb20 <fn_0801CA9C+0x84>
 801cb44:	68d5      	ldr	r5, [r2, #12]
 801cb46:	3d01      	subs	r5, #1
 801cb48:	2d00      	cmp	r5, #0
 801cb4a:	dad0      	bge.n	801caee <fn_0801CA9C+0x52>
 801cb4c:	e7db      	b.n	801cb06 <fn_0801CA9C+0x6a>
 801cb4e:	2008      	movs	r0, #8
 801cb50:	490c      	ldr	r1, [pc, #48]	@ (801cb84 <fn_0801CA9C+0xe8>)
 801cb52:	f7ff fe97 	bl	801c884 <fn_0801C884>
 801cb56:	683b      	ldr	r3, [r7, #0]
 801cb58:	4a0b      	ldr	r2, [pc, #44]	@ (801cb88 <fn_0801CA9C+0xec>)
 801cb5a:	5c9a      	ldrb	r2, [r3, r2]
 801cb5c:	2a00      	cmp	r2, #0
 801cb5e:	d0d9      	beq.n	801cb14 <fn_0801CA9C+0x78>
 801cb60:	4a06      	ldr	r2, [pc, #24]	@ (801cb7c <fn_0801CA9C+0xe0>)
 801cb62:	589b      	ldr	r3, [r3, r2]
 801cb64:	490a      	ldr	r1, [pc, #40]	@ (801cb90 <fn_0801CA9C+0xf4>)
 801cb66:	68d8      	ldr	r0, [r3, #12]
 801cb68:	f7ff fe8c 	bl	801c884 <fn_0801C884>
 801cb6c:	2294      	movs	r2, #148	@ 0x94
 801cb6e:	683b      	ldr	r3, [r7, #0]
 801cb70:	5c9a      	ldrb	r2, [r3, r2]
 801cb72:	2a02      	cmp	r2, #2
 801cb74:	d1d2      	bne.n	801cb1c <fn_0801CA9C+0x80>
 801cb76:	e7df      	b.n	801cb38 <fn_0801CA9C+0x9c>
 801cb78:	030064c4 	.word	0x030064c4
 801cb7c:	00005a40 	.word	0x00005a40
 801cb80:	0814aa30 	.word	0x0814aa30
 801cb84:	081478fc 	.word	0x081478fc
 801cb88:	00005a98 	.word	0x00005a98
 801cb8c:	0814aa38 	.word	0x0814aa38
 801cb90:	08147900 	.word	0x08147900
