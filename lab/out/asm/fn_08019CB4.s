fn_08019CB4:
 8019cb4:	4b26      	ldr	r3, [pc, #152]	@ (8019d50 <fn_08019CB4+0x9c>)
 8019cb6:	b570      	push	{r4, r5, r6, lr}
 8019cb8:	781d      	ldrb	r5, [r3, #0]
 8019cba:	4b26      	ldr	r3, [pc, #152]	@ (8019d54 <fn_08019CB4+0xa0>)
 8019cbc:	781b      	ldrb	r3, [r3, #0]
 8019cbe:	0004      	movs	r4, r0
 8019cc0:	000e      	movs	r6, r1
 8019cc2:	2b00      	cmp	r3, #0
 8019cc4:	d010      	beq.n	8019ce8 <fn_08019CB4+0x34>
 8019cc6:	2d00      	cmp	r5, #0
 8019cc8:	d10b      	bne.n	8019ce2 <fn_08019CB4+0x2e>
 8019cca:	f7ea ff77 	bl	8004bbc <fn_08004BBC>
 8019cce:	0021      	movs	r1, r4
 8019cd0:	4821      	ldr	r0, [pc, #132]	@ (8019d58 <fn_08019CB4+0xa4>)
 8019cd2:	f7eb fba7 	bl	8005424 <fn_08005424>
 8019cd6:	2c7f      	cmp	r4, #127	@ 0x7f
 8019cd8:	d827      	bhi.n	8019d2a <fn_08019CB4+0x76>
 8019cda:	4b20      	ldr	r3, [pc, #128]	@ (8019d5c <fn_08019CB4+0xa8>)
 8019cdc:	681a      	ldr	r2, [r3, #0]
 8019cde:	4b20      	ldr	r3, [pc, #128]	@ (8019d60 <fn_08019CB4+0xac>)
 8019ce0:	50d4      	str	r4, [r2, r3]
 8019ce2:	bc70      	pop	{r4, r5, r6}
 8019ce4:	bc01      	pop	{r0}
 8019ce6:	4700      	bx	r0
 8019ce8:	f7ea ff68 	bl	8004bbc <fn_08004BBC>
 8019cec:	2d00      	cmp	r5, #0
 8019cee:	d00c      	beq.n	8019d0a <fn_08019CB4+0x56>
 8019cf0:	4d1a      	ldr	r5, [pc, #104]	@ (8019d5c <fn_08019CB4+0xa8>)
 8019cf2:	2e0f      	cmp	r6, #15
 8019cf4:	d814      	bhi.n	8019d20 <fn_08019CB4+0x6c>
 8019cf6:	0030      	movs	r0, r6
 8019cf8:	f7eb f8b6 	bl	8004e68 <fn_08004E68>
 8019cfc:	2100      	movs	r1, #0
 8019cfe:	682b      	ldr	r3, [r5, #0]
 8019d00:	4a18      	ldr	r2, [pc, #96]	@ (8019d64 <fn_08019CB4+0xb0>)
 8019d02:	509e      	str	r6, [r3, r2]
 8019d04:	4a18      	ldr	r2, [pc, #96]	@ (8019d68 <fn_08019CB4+0xb4>)
 8019d06:	5499      	strb	r1, [r3, r2]
 8019d08:	e7eb      	b.n	8019ce2 <fn_08019CB4+0x2e>
 8019d0a:	0021      	movs	r1, r4
 8019d0c:	4812      	ldr	r0, [pc, #72]	@ (8019d58 <fn_08019CB4+0xa4>)
 8019d0e:	f7eb fb89 	bl	8005424 <fn_08005424>
 8019d12:	2c7f      	cmp	r4, #127	@ 0x7f
 8019d14:	d812      	bhi.n	8019d3c <fn_08019CB4+0x88>
 8019d16:	4d11      	ldr	r5, [pc, #68]	@ (8019d5c <fn_08019CB4+0xa8>)
 8019d18:	4b11      	ldr	r3, [pc, #68]	@ (8019d60 <fn_08019CB4+0xac>)
 8019d1a:	682a      	ldr	r2, [r5, #0]
 8019d1c:	50d4      	str	r4, [r2, r3]
 8019d1e:	e7e8      	b.n	8019cf2 <fn_08019CB4+0x3e>
 8019d20:	0031      	movs	r1, r6
 8019d22:	4812      	ldr	r0, [pc, #72]	@ (8019d6c <fn_08019CB4+0xb8>)
 8019d24:	f7e6 fc40 	bl	80005a8 <fn_080005A8>
 8019d28:	e7e5      	b.n	8019cf6 <fn_08019CB4+0x42>
 8019d2a:	0021      	movs	r1, r4
 8019d2c:	4810      	ldr	r0, [pc, #64]	@ (8019d70 <fn_08019CB4+0xbc>)
 8019d2e:	f7e6 fc3b 	bl	80005a8 <fn_080005A8>
 8019d32:	4b0a      	ldr	r3, [pc, #40]	@ (8019d5c <fn_08019CB4+0xa8>)
 8019d34:	681a      	ldr	r2, [r3, #0]
 8019d36:	4b0a      	ldr	r3, [pc, #40]	@ (8019d60 <fn_08019CB4+0xac>)
 8019d38:	50d4      	str	r4, [r2, r3]
 8019d3a:	e7d2      	b.n	8019ce2 <fn_08019CB4+0x2e>
 8019d3c:	0021      	movs	r1, r4
 8019d3e:	480c      	ldr	r0, [pc, #48]	@ (8019d70 <fn_08019CB4+0xbc>)
 8019d40:	f7e6 fc32 	bl	80005a8 <fn_080005A8>
 8019d44:	4d05      	ldr	r5, [pc, #20]	@ (8019d5c <fn_08019CB4+0xa8>)
 8019d46:	4b06      	ldr	r3, [pc, #24]	@ (8019d60 <fn_08019CB4+0xac>)
 8019d48:	682a      	ldr	r2, [r5, #0]
 8019d4a:	50d4      	str	r4, [r2, r3]
 8019d4c:	e7d1      	b.n	8019cf2 <fn_08019CB4+0x3e>
 8019d4e:	46c0      	nop			@ (mov r8, r8)
 8019d50:	080257f6 	.word	0x080257f6	@ data_080257F6
 8019d54:	080257f5 	.word	0x080257f5	@ data_080257F5
 8019d58:	0814a790 	.word	0x0814a790
 8019d5c:	030064c4 	.word	0x030064c4	@ data_030064C4
 8019d60:	00005630 	.word	0x00005630
 8019d64:	00005634 	.word	0x00005634
 8019d68:	00005640 	.word	0x00005640
 8019d6c:	0814a7e0 	.word	0x0814a7e0
 8019d70:	0814a7b0 	.word	0x0814a7b0
