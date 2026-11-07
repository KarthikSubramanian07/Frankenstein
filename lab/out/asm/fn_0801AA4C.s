fn_0801AA4C:
 801aa4c:	4b1a      	ldr	r3, [pc, #104]	@ (801aab8 <fn_0801AA4C+0x6c>)
 801aa4e:	781b      	ldrb	r3, [r3, #0]
 801aa50:	b570      	push	{r4, r5, r6, lr}
 801aa52:	0004      	movs	r4, r0
 801aa54:	000e      	movs	r6, r1
 801aa56:	2b00      	cmp	r3, #0
 801aa58:	d11c      	bne.n	801aa94 <fn_0801AA4C+0x48>
 801aa5a:	1e43      	subs	r3, r0, #1
 801aa5c:	2b42      	cmp	r3, #66	@ 0x42
 801aa5e:	d81c      	bhi.n	801aa9a <fn_0801AA4C+0x4e>
 801aa60:	4d16      	ldr	r5, [pc, #88]	@ (801aabc <fn_0801AA4C+0x70>)
 801aa62:	4b17      	ldr	r3, [pc, #92]	@ (801aac0 <fn_0801AA4C+0x74>)
 801aa64:	682a      	ldr	r2, [r5, #0]
 801aa66:	58d3      	ldr	r3, [r2, r3]
 801aa68:	42a3      	cmp	r3, r4
 801aa6a:	d013      	beq.n	801aa94 <fn_0801AA4C+0x48>
 801aa6c:	2b00      	cmp	r3, #0
 801aa6e:	d00a      	beq.n	801aa86 <fn_0801AA4C+0x3a>
 801aa70:	4b14      	ldr	r3, [pc, #80]	@ (801aac4 <fn_0801AA4C+0x78>)
 801aa72:	5cd3      	ldrb	r3, [r2, r3]
 801aa74:	2b00      	cmp	r3, #0
 801aa76:	d11b      	bne.n	801aab0 <fn_0801AA4C+0x64>
 801aa78:	2000      	movs	r0, #0
 801aa7a:	f7ea f9e7 	bl	8004e4c <fn_08004E4C>
 801aa7e:	2100      	movs	r1, #0
 801aa80:	682a      	ldr	r2, [r5, #0]
 801aa82:	4b0f      	ldr	r3, [pc, #60]	@ (801aac0 <fn_0801AA4C+0x74>)
 801aa84:	50d1      	str	r1, [r2, r3]
 801aa86:	0031      	movs	r1, r6
 801aa88:	0020      	movs	r0, r4
 801aa8a:	f7ea f993 	bl	8004db4 <fn_08004DB4>
 801aa8e:	682a      	ldr	r2, [r5, #0]
 801aa90:	4b0b      	ldr	r3, [pc, #44]	@ (801aac0 <fn_0801AA4C+0x74>)
 801aa92:	50d4      	str	r4, [r2, r3]
 801aa94:	bc70      	pop	{r4, r5, r6}
 801aa96:	bc01      	pop	{r0}
 801aa98:	4700      	bx	r0
 801aa9a:	0021      	movs	r1, r4
 801aa9c:	480a      	ldr	r0, [pc, #40]	@ (801aac8 <fn_0801AA4C+0x7c>)
 801aa9e:	f7e5 fd83 	bl	80005a8 <fn_080005A8>
 801aaa2:	4d06      	ldr	r5, [pc, #24]	@ (801aabc <fn_0801AA4C+0x70>)
 801aaa4:	4b06      	ldr	r3, [pc, #24]	@ (801aac0 <fn_0801AA4C+0x74>)
 801aaa6:	682a      	ldr	r2, [r5, #0]
 801aaa8:	58d3      	ldr	r3, [r2, r3]
 801aaaa:	42a3      	cmp	r3, r4
 801aaac:	d1de      	bne.n	801aa6c <fn_0801AA4C+0x20>
 801aaae:	e7f1      	b.n	801aa94 <fn_0801AA4C+0x48>
 801aab0:	2000      	movs	r0, #0
 801aab2:	f7ea f9bd 	bl	8004e30 <fn_08004E30>
 801aab6:	e7df      	b.n	801aa78 <fn_0801AA4C+0x2c>
 801aab8:	080257f5 	.word	0x080257f5
 801aabc:	030064c4 	.word	0x030064c4
 801aac0:	00005638 	.word	0x00005638
 801aac4:	00005640 	.word	0x00005640
 801aac8:	0814a838 	.word	0x0814a838
