fn_08003C48:
 8003c48:	b5f0      	push	{r4, r5, r6, r7, lr}
 8003c4a:	46c6      	mov	lr, r8
 8003c4c:	0007      	movs	r7, r0
 8003c4e:	0015      	movs	r5, r2
 8003c50:	b500      	push	{lr}
 8003c52:	1c03      	adds	r3, r0, #0
 8003c54:	2804      	cmp	r0, #4
 8003c56:	dd00      	ble.n	8003c5a <fn_08003C48+0x12>
 8003c58:	2304      	movs	r3, #4
 8003c5a:	061b      	lsls	r3, r3, #24
 8003c5c:	161e      	asrs	r6, r3, #24
 8003c5e:	2900      	cmp	r1, #0
 8003c60:	dc00      	bgt.n	8003c64 <fn_08003C48+0x1c>
 8003c62:	2101      	movs	r1, #1
 8003c64:	4b2a      	ldr	r3, [pc, #168]	@ (8003d10 <fn_08003C48+0xc8>)
 8003c66:	681a      	ldr	r2, [r3, #0]
 8003c68:	4698      	mov	r8, r3
 8003c6a:	2394      	movs	r3, #148	@ 0x94
 8003c6c:	5cd3      	ldrb	r3, [r2, r3]
 8003c6e:	2b03      	cmp	r3, #3
 8003c70:	d03b      	beq.n	8003cea <fn_08003C48+0xa2>
 8003c72:	2b00      	cmp	r3, #0
 8003c74:	d12a      	bne.n	8003ccc <fn_08003C48+0x84>
 8003c76:	2d09      	cmp	r5, #9
 8003c78:	dc41      	bgt.n	8003cfe <fn_08003C48+0xb6>
 8003c7a:	2d00      	cmp	r5, #0
 8003c7c:	dd45      	ble.n	8003d0a <fn_08003C48+0xc2>
 8003c7e:	2401      	movs	r4, #1
 8003c80:	f002 ff60 	bl	8006b44 <fn_08006B44>
 8003c84:	4643      	mov	r3, r8
 8003c86:	2201      	movs	r2, #1
 8003c88:	681b      	ldr	r3, [r3, #0]
 8003c8a:	2f03      	cmp	r7, #3
 8003c8c:	dc00      	bgt.n	8003c90 <fn_08003C48+0x48>
 8003c8e:	2200      	movs	r2, #0
 8003c90:	4920      	ldr	r1, [pc, #128]	@ (8003d14 <fn_08003C48+0xcc>)
 8003c92:	545a      	strb	r2, [r3, r1]
 8003c94:	22e4      	movs	r2, #228	@ 0xe4
 8003c96:	2102      	movs	r1, #2
 8003c98:	5499      	strb	r1, [r3, r2]
 8003c9a:	4a1f      	ldr	r2, [pc, #124]	@ (8003d18 <fn_08003C48+0xd0>)
 8003c9c:	3901      	subs	r1, #1
 8003c9e:	5499      	strb	r1, [r3, r2]
 8003ca0:	781a      	ldrb	r2, [r3, #0]
 8003ca2:	438a      	bics	r2, r1
 8003ca4:	701a      	strb	r2, [r3, #0]
 8003ca6:	4643      	mov	r3, r8
 8003ca8:	22d8      	movs	r2, #216	@ 0xd8
 8003caa:	2100      	movs	r1, #0
 8003cac:	681b      	ldr	r3, [r3, #0]
 8003cae:	509c      	str	r4, [r3, r2]
 8003cb0:	3204      	adds	r2, #4
 8003cb2:	509d      	str	r5, [r3, r2]
 8003cb4:	3a06      	subs	r2, #6
 8003cb6:	549e      	strb	r6, [r3, r2]
 8003cb8:	325b      	adds	r2, #91	@ 0x5b
 8003cba:	32ff      	adds	r2, #255	@ 0xff
 8003cbc:	5099      	str	r1, [r3, r2]
 8003cbe:	f7ff f9d1 	bl	8003064 <fn_08003064>
 8003cc2:	bc80      	pop	{r7}
 8003cc4:	46b8      	mov	r8, r7
 8003cc6:	bcf0      	pop	{r4, r5, r6, r7}
 8003cc8:	bc01      	pop	{r0}
 8003cca:	4700      	bx	r0
 8003ccc:	000c      	movs	r4, r1
 8003cce:	2903      	cmp	r1, #3
 8003cd0:	dc17      	bgt.n	8003d02 <fn_08003C48+0xba>
 8003cd2:	2d00      	cmp	r5, #0
 8003cd4:	dd11      	ble.n	8003cfa <fn_08003C48+0xb2>
 8003cd6:	2201      	movs	r2, #1
 8003cd8:	2d09      	cmp	r5, #9
 8003cda:	dc00      	bgt.n	8003cde <fn_08003C48+0x96>
 8003cdc:	2200      	movs	r2, #0
 8003cde:	0612      	lsls	r2, r2, #24
 8003ce0:	d0ce      	beq.n	8003c80 <fn_08003C48+0x38>
 8003ce2:	2b02      	cmp	r3, #2
 8003ce4:	d0cc      	beq.n	8003c80 <fn_08003C48+0x38>
 8003ce6:	2509      	movs	r5, #9
 8003ce8:	e7ca      	b.n	8003c80 <fn_08003C48+0x38>
 8003cea:	000c      	movs	r4, r1
 8003cec:	2904      	cmp	r1, #4
 8003cee:	dd00      	ble.n	8003cf2 <fn_08003C48+0xaa>
 8003cf0:	2404      	movs	r4, #4
 8003cf2:	2d09      	cmp	r5, #9
 8003cf4:	dcf7      	bgt.n	8003ce6 <fn_08003C48+0x9e>
 8003cf6:	2d00      	cmp	r5, #0
 8003cf8:	dcc2      	bgt.n	8003c80 <fn_08003C48+0x38>
 8003cfa:	2501      	movs	r5, #1
 8003cfc:	e7c0      	b.n	8003c80 <fn_08003C48+0x38>
 8003cfe:	2509      	movs	r5, #9
 8003d00:	e7bd      	b.n	8003c7e <fn_08003C48+0x36>
 8003d02:	2403      	movs	r4, #3
 8003d04:	2d00      	cmp	r5, #0
 8003d06:	dce6      	bgt.n	8003cd6 <fn_08003C48+0x8e>
 8003d08:	e7f7      	b.n	8003cfa <fn_08003C48+0xb2>
 8003d0a:	2501      	movs	r5, #1
 8003d0c:	e7b7      	b.n	8003c7e <fn_08003C48+0x36>
 8003d0e:	46c0      	nop			@ (mov r8, r8)
 8003d10:	030064c4 	.word	0x030064c4
 8003d14:	0000025a 	.word	0x0000025a
 8003d18:	0000025b 	.word	0x0000025b
