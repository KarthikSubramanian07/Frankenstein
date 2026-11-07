fn_08019D68:
 8019d68:	4b26      	ldr	r3, [pc, #152]	@ (8019e04 <fn_08019D68+0x9c>)
 8019d6a:	b570      	push	{r4, r5, r6, lr}
 8019d6c:	781d      	ldrb	r5, [r3, #0]
 8019d6e:	4b26      	ldr	r3, [pc, #152]	@ (8019e08 <fn_08019D68+0xa0>)
 8019d70:	781b      	ldrb	r3, [r3, #0]
 8019d72:	0004      	movs	r4, r0
 8019d74:	000e      	movs	r6, r1
 8019d76:	2b00      	cmp	r3, #0
 8019d78:	d010      	beq.n	8019d9c <fn_08019D68+0x34>
 8019d7a:	2d00      	cmp	r5, #0
 8019d7c:	d10b      	bne.n	8019d96 <fn_08019D68+0x2e>
 8019d7e:	f7ea ff1d 	bl	8004bbc <fn_08004BBC>
 8019d82:	0021      	movs	r1, r4
 8019d84:	4821      	ldr	r0, [pc, #132]	@ (8019e0c <fn_08019D68+0xa4>)
 8019d86:	f7eb fb4d 	bl	8005424 <fn_08005424>
 8019d8a:	2c7f      	cmp	r4, #127	@ 0x7f
 8019d8c:	d827      	bhi.n	8019dde <fn_08019D68+0x76>
 8019d8e:	4b20      	ldr	r3, [pc, #128]	@ (8019e10 <fn_08019D68+0xa8>)
 8019d90:	681a      	ldr	r2, [r3, #0]
 8019d92:	4b20      	ldr	r3, [pc, #128]	@ (8019e14 <fn_08019D68+0xac>)
 8019d94:	50d4      	str	r4, [r2, r3]
 8019d96:	bc70      	pop	{r4, r5, r6}
 8019d98:	bc01      	pop	{r0}
 8019d9a:	4700      	bx	r0
 8019d9c:	f7ea ff0e 	bl	8004bbc <fn_08004BBC>
 8019da0:	2d00      	cmp	r5, #0
 8019da2:	d00c      	beq.n	8019dbe <fn_08019D68+0x56>
 8019da4:	4d1a      	ldr	r5, [pc, #104]	@ (8019e10 <fn_08019D68+0xa8>)
 8019da6:	2e0f      	cmp	r6, #15
 8019da8:	d814      	bhi.n	8019dd4 <fn_08019D68+0x6c>
 8019daa:	0030      	movs	r0, r6
 8019dac:	f7eb f85c 	bl	8004e68 <fn_08004E68>
 8019db0:	2100      	movs	r1, #0
 8019db2:	682b      	ldr	r3, [r5, #0]
 8019db4:	4a18      	ldr	r2, [pc, #96]	@ (8019e18 <fn_08019D68+0xb0>)
 8019db6:	509e      	str	r6, [r3, r2]
 8019db8:	4a18      	ldr	r2, [pc, #96]	@ (8019e1c <fn_08019D68+0xb4>)
 8019dba:	5499      	strb	r1, [r3, r2]
 8019dbc:	e7eb      	b.n	8019d96 <fn_08019D68+0x2e>
 8019dbe:	0021      	movs	r1, r4
 8019dc0:	4812      	ldr	r0, [pc, #72]	@ (8019e0c <fn_08019D68+0xa4>)
 8019dc2:	f7eb fb2f 	bl	8005424 <fn_08005424>
 8019dc6:	2c7f      	cmp	r4, #127	@ 0x7f
 8019dc8:	d812      	bhi.n	8019df0 <fn_08019D68+0x88>
 8019dca:	4d11      	ldr	r5, [pc, #68]	@ (8019e10 <fn_08019D68+0xa8>)
 8019dcc:	4b11      	ldr	r3, [pc, #68]	@ (8019e14 <fn_08019D68+0xac>)
 8019dce:	682a      	ldr	r2, [r5, #0]
 8019dd0:	50d4      	str	r4, [r2, r3]
 8019dd2:	e7e8      	b.n	8019da6 <fn_08019D68+0x3e>
 8019dd4:	0031      	movs	r1, r6
 8019dd6:	4812      	ldr	r0, [pc, #72]	@ (8019e20 <fn_08019D68+0xb8>)
 8019dd8:	f7e6 fbe6 	bl	80005a8 <fn_080005A8>
 8019ddc:	e7e5      	b.n	8019daa <fn_08019D68+0x42>
 8019dde:	0021      	movs	r1, r4
 8019de0:	4810      	ldr	r0, [pc, #64]	@ (8019e24 <fn_08019D68+0xbc>)
 8019de2:	f7e6 fbe1 	bl	80005a8 <fn_080005A8>
 8019de6:	4b0a      	ldr	r3, [pc, #40]	@ (8019e10 <fn_08019D68+0xa8>)
 8019de8:	681a      	ldr	r2, [r3, #0]
 8019dea:	4b0a      	ldr	r3, [pc, #40]	@ (8019e14 <fn_08019D68+0xac>)
 8019dec:	50d4      	str	r4, [r2, r3]
 8019dee:	e7d2      	b.n	8019d96 <fn_08019D68+0x2e>
 8019df0:	0021      	movs	r1, r4
 8019df2:	480c      	ldr	r0, [pc, #48]	@ (8019e24 <fn_08019D68+0xbc>)
 8019df4:	f7e6 fbd8 	bl	80005a8 <fn_080005A8>
 8019df8:	4d05      	ldr	r5, [pc, #20]	@ (8019e10 <fn_08019D68+0xa8>)
 8019dfa:	4b06      	ldr	r3, [pc, #24]	@ (8019e14 <fn_08019D68+0xac>)
 8019dfc:	682a      	ldr	r2, [r5, #0]
 8019dfe:	50d4      	str	r4, [r2, r3]
 8019e00:	e7d1      	b.n	8019da6 <fn_08019D68+0x3e>
 8019e02:	46c0      	nop			@ (mov r8, r8)
 8019e04:	080258a6 	.word	0x080258a6
 8019e08:	080258a5 	.word	0x080258a5
 8019e0c:	0814a864 	.word	0x0814a864
 8019e10:	030064c4 	.word	0x030064c4
 8019e14:	00005630 	.word	0x00005630
 8019e18:	00005634 	.word	0x00005634
 8019e1c:	00005640 	.word	0x00005640
 8019e20:	0814a8b4 	.word	0x0814a8b4
 8019e24:	0814a884 	.word	0x0814a884
