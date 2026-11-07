fn_08004BBC:
 8004bbc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8004bbe:	46de      	mov	lr, fp
 8004bc0:	4657      	mov	r7, sl
 8004bc2:	464e      	mov	r6, r9
 8004bc4:	4645      	mov	r5, r8
 8004bc6:	b5e0      	push	{r5, r6, r7, lr}
 8004bc8:	b085      	sub	sp, #20
 8004bca:	f014 ff31 	bl	8019a30 <fn_08019A30>
 8004bce:	4c4a      	ldr	r4, [pc, #296]	@ (8004cf8 <fn_08004BBC+0x13c>)
 8004bd0:	68e3      	ldr	r3, [r4, #12]
 8004bd2:	2b00      	cmp	r3, #0
 8004bd4:	d100      	bne.n	8004bd8 <fn_08004BBC+0x1c>
 8004bd6:	e08d      	b.n	8004cf4 <fn_08004BBC+0x138>
 8004bd8:	4a48      	ldr	r2, [pc, #288]	@ (8004cfc <fn_08004BBC+0x140>)
 8004bda:	af01      	add	r7, sp, #4
 8004bdc:	681b      	ldr	r3, [r3, #0]
 8004bde:	2109      	movs	r1, #9
 8004be0:	0038      	movs	r0, r7
 8004be2:	4693      	mov	fp, r2
 8004be4:	f000 fc38 	bl	8005458 <fn_08005458>
 8004be8:	783b      	ldrb	r3, [r7, #0]
 8004bea:	2b00      	cmp	r3, #0
 8004bec:	d00c      	beq.n	8004c08 <fn_08004BBC+0x4c>
 8004bee:	0039      	movs	r1, r7
 8004bf0:	2003      	movs	r0, #3
 8004bf2:	4d43      	ldr	r5, [pc, #268]	@ (8004d00 <fn_08004BBC+0x144>)
 8004bf4:	5cea      	ldrb	r2, [r5, r3]
 8004bf6:	4002      	ands	r2, r0
 8004bf8:	2a02      	cmp	r2, #2
 8004bfa:	d100      	bne.n	8004bfe <fn_08004BBC+0x42>
 8004bfc:	e072      	b.n	8004ce4 <fn_08004BBC+0x128>
 8004bfe:	700b      	strb	r3, [r1, #0]
 8004c00:	784b      	ldrb	r3, [r1, #1]
 8004c02:	3101      	adds	r1, #1
 8004c04:	2b00      	cmp	r3, #0
 8004c06:	d1f5      	bne.n	8004bf4 <fn_08004BBC+0x38>
 8004c08:	4b3e      	ldr	r3, [pc, #248]	@ (8004d04 <fn_08004BBC+0x148>)
 8004c0a:	2101      	movs	r1, #1
 8004c0c:	681a      	ldr	r2, [r3, #0]
 8004c0e:	469a      	mov	sl, r3
 8004c10:	23fe      	movs	r3, #254	@ 0xfe
 8004c12:	4249      	negs	r1, r1
 8004c14:	009b      	lsls	r3, r3, #2
 8004c16:	52d1      	strh	r1, [r2, r3]
 8004c18:	4b3b      	ldr	r3, [pc, #236]	@ (8004d08 <fn_08004BBC+0x14c>)
 8004c1a:	4699      	mov	r9, r3
 8004c1c:	2301      	movs	r3, #1
 8004c1e:	0026      	movs	r6, r4
 8004c20:	44a1      	add	r9, r4
 8004c22:	4698      	mov	r8, r3
 8004c24:	2403      	movs	r4, #3
 8004c26:	4d36      	ldr	r5, [pc, #216]	@ (8004d00 <fn_08004BBC+0x144>)
 8004c28:	3614      	adds	r6, #20
 8004c2a:	68f3      	ldr	r3, [r6, #12]
 8004c2c:	2b00      	cmp	r3, #0
 8004c2e:	d057      	beq.n	8004ce0 <fn_08004BBC+0x124>
 8004c30:	681b      	ldr	r3, [r3, #0]
 8004c32:	465a      	mov	r2, fp
 8004c34:	2109      	movs	r1, #9
 8004c36:	0038      	movs	r0, r7
 8004c38:	f000 fc0e 	bl	8005458 <fn_08005458>
 8004c3c:	783b      	ldrb	r3, [r7, #0]
 8004c3e:	2b00      	cmp	r3, #0
 8004c40:	d009      	beq.n	8004c56 <fn_08004BBC+0x9a>
 8004c42:	003a      	movs	r2, r7
 8004c44:	5ce9      	ldrb	r1, [r5, r3]
 8004c46:	4021      	ands	r1, r4
 8004c48:	2902      	cmp	r1, #2
 8004c4a:	d042      	beq.n	8004cd2 <fn_08004BBC+0x116>
 8004c4c:	7013      	strb	r3, [r2, #0]
 8004c4e:	7853      	ldrb	r3, [r2, #1]
 8004c50:	3201      	adds	r2, #1
 8004c52:	2b00      	cmp	r3, #0
 8004c54:	d1f6      	bne.n	8004c44 <fn_08004BBC+0x88>
 8004c56:	0038      	movs	r0, r7
 8004c58:	f018 fc44 	bl	801d4e4 <fn_0801D4E4>
 8004c5c:	4653      	mov	r3, sl
 8004c5e:	681a      	ldr	r2, [r3, #0]
 8004c60:	4643      	mov	r3, r8
 8004c62:	33fd      	adds	r3, #253	@ 0xfd
 8004c64:	33ff      	adds	r3, #255	@ 0xff
 8004c66:	005b      	lsls	r3, r3, #1
 8004c68:	52d0      	strh	r0, [r2, r3]
 8004c6a:	2301      	movs	r3, #1
 8004c6c:	3614      	adds	r6, #20
 8004c6e:	4498      	add	r8, r3
 8004c70:	45b1      	cmp	r9, r6
 8004c72:	d1da      	bne.n	8004c2a <fn_08004BBC+0x6e>
 8004c74:	2080      	movs	r0, #128	@ 0x80
 8004c76:	4b25      	ldr	r3, [pc, #148]	@ (8004d0c <fn_08004BBC+0x150>)
 8004c78:	8018      	strh	r0, [r3, #0]
 8004c7a:	2300      	movs	r3, #0
 8004c7c:	4924      	ldr	r1, [pc, #144]	@ (8004d10 <fn_08004BBC+0x154>)
 8004c7e:	4c25      	ldr	r4, [pc, #148]	@ (8004d14 <fn_08004BBC+0x158>)
 8004c80:	800b      	strh	r3, [r1, #0]
 8004c82:	4925      	ldr	r1, [pc, #148]	@ (8004d18 <fn_08004BBC+0x15c>)
 8004c84:	4d25      	ldr	r5, [pc, #148]	@ (8004d1c <fn_08004BBC+0x160>)
 8004c86:	800c      	strh	r4, [r1, #0]
 8004c88:	4925      	ldr	r1, [pc, #148]	@ (8004d20 <fn_08004BBC+0x164>)
 8004c8a:	4c26      	ldr	r4, [pc, #152]	@ (8004d24 <fn_08004BBC+0x168>)
 8004c8c:	800b      	strh	r3, [r1, #0]
 8004c8e:	8025      	strh	r5, [r4, #0]
 8004c90:	8008      	strh	r0, [r1, #0]
 8004c92:	4825      	ldr	r0, [pc, #148]	@ (8004d28 <fn_08004BBC+0x16c>)
 8004c94:	4925      	ldr	r1, [pc, #148]	@ (8004d2c <fn_08004BBC+0x170>)
 8004c96:	1814      	adds	r4, r2, r0
 8004c98:	4825      	ldr	r0, [pc, #148]	@ (8004d30 <fn_08004BBC+0x174>)
 8004c9a:	600b      	str	r3, [r1, #0]
 8004c9c:	6004      	str	r4, [r0, #0]
 8004c9e:	4825      	ldr	r0, [pc, #148]	@ (8004d34 <fn_08004BBC+0x178>)
 8004ca0:	4c25      	ldr	r4, [pc, #148]	@ (8004d38 <fn_08004BBC+0x17c>)
 8004ca2:	6004      	str	r4, [r0, #0]
 8004ca4:	4825      	ldr	r0, [pc, #148]	@ (8004d3c <fn_08004BBC+0x180>)
 8004ca6:	6008      	str	r0, [r1, #0]
 8004ca8:	4925      	ldr	r1, [pc, #148]	@ (8004d40 <fn_08004BBC+0x184>)
 8004caa:	2001      	movs	r0, #1
 8004cac:	5053      	str	r3, [r2, r1]
 8004cae:	4925      	ldr	r1, [pc, #148]	@ (8004d44 <fn_08004BBC+0x188>)
 8004cb0:	f01a fe38 	bl	801f924 <fn_0801F924>
 8004cb4:	2001      	movs	r0, #1
 8004cb6:	f01a fecf 	bl	801fa58 <fn_0801FA58>
 8004cba:	4823      	ldr	r0, [pc, #140]	@ (8004d48 <fn_08004BBC+0x18c>)
 8004cbc:	f000 fbb2 	bl	8005424 <fn_08005424>
 8004cc0:	b005      	add	sp, #20
 8004cc2:	bcf0      	pop	{r4, r5, r6, r7}
 8004cc4:	46bb      	mov	fp, r7
 8004cc6:	46b2      	mov	sl, r6
 8004cc8:	46a9      	mov	r9, r5
 8004cca:	46a0      	mov	r8, r4
 8004ccc:	bcf0      	pop	{r4, r5, r6, r7}
 8004cce:	bc01      	pop	{r0}
 8004cd0:	4700      	bx	r0
 8004cd2:	3b20      	subs	r3, #32
 8004cd4:	7013      	strb	r3, [r2, #0]
 8004cd6:	7853      	ldrb	r3, [r2, #1]
 8004cd8:	3201      	adds	r2, #1
 8004cda:	2b00      	cmp	r3, #0
 8004cdc:	d1b2      	bne.n	8004c44 <fn_08004BBC+0x88>
 8004cde:	e7ba      	b.n	8004c56 <fn_08004BBC+0x9a>
 8004ce0:	0033      	movs	r3, r6
 8004ce2:	e7a5      	b.n	8004c30 <fn_08004BBC+0x74>
 8004ce4:	3b20      	subs	r3, #32
 8004ce6:	700b      	strb	r3, [r1, #0]
 8004ce8:	784b      	ldrb	r3, [r1, #1]
 8004cea:	3101      	adds	r1, #1
 8004cec:	2b00      	cmp	r3, #0
 8004cee:	d000      	beq.n	8004cf2 <fn_08004BBC+0x136>
 8004cf0:	e780      	b.n	8004bf4 <fn_08004BBC+0x38>
 8004cf2:	e789      	b.n	8004c08 <fn_08004BBC+0x4c>
 8004cf4:	0023      	movs	r3, r4
 8004cf6:	e76f      	b.n	8004bd8 <fn_08004BBC+0x1c>
 8004cf8:	0812f828 	.word	0x0812f828
 8004cfc:	081494dc 	.word	0x081494dc
 8004d00:	0814b48d 	.word	0x0814b48d
 8004d04:	030064c4 	.word	0x030064c4
 8004d08:	00000884 	.word	0x00000884
 8004d0c:	04000084 	.word	0x04000084
 8004d10:	04000080 	.word	0x04000080
 8004d14:	00000b04 	.word	0x00000b04
 8004d18:	04000082 	.word	0x04000082
 8004d1c:	fffffb1a 	.word	0xfffffb1a
 8004d20:	04000102 	.word	0x04000102
 8004d24:	04000100 	.word	0x04000100
 8004d28:	0000055c 	.word	0x0000055c
 8004d2c:	040000c4 	.word	0x040000c4
 8004d30:	040000bc 	.word	0x040000bc
 8004d34:	040000c0 	.word	0x040000c0
 8004d38:	040000a0 	.word	0x040000a0
 8004d3c:	b6400000 	.word	0xb6400000
 8004d40:	0000073c 	.word	0x0000073c
 8004d44:	08004b59 	.word	0x08004b59
 8004d48:	081494e4 	.word	0x081494e4
