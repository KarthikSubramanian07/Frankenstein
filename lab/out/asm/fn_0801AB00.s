fn_0801AB00:
 801ab00:	4b1a      	ldr	r3, [pc, #104]	@ (801ab6c <fn_0801AB00+0x6c>)
 801ab02:	781b      	ldrb	r3, [r3, #0]
 801ab04:	b570      	push	{r4, r5, r6, lr}
 801ab06:	0004      	movs	r4, r0
 801ab08:	000e      	movs	r6, r1
 801ab0a:	2b00      	cmp	r3, #0
 801ab0c:	d11c      	bne.n	801ab48 <fn_0801AB00+0x48>
 801ab0e:	1e43      	subs	r3, r0, #1
 801ab10:	2b42      	cmp	r3, #66	@ 0x42
 801ab12:	d81c      	bhi.n	801ab4e <fn_0801AB00+0x4e>
 801ab14:	4d16      	ldr	r5, [pc, #88]	@ (801ab70 <fn_0801AB00+0x70>)
 801ab16:	4b17      	ldr	r3, [pc, #92]	@ (801ab74 <fn_0801AB00+0x74>)
 801ab18:	682a      	ldr	r2, [r5, #0]
 801ab1a:	58d3      	ldr	r3, [r2, r3]
 801ab1c:	42a3      	cmp	r3, r4
 801ab1e:	d013      	beq.n	801ab48 <fn_0801AB00+0x48>
 801ab20:	2b00      	cmp	r3, #0
 801ab22:	d00a      	beq.n	801ab3a <fn_0801AB00+0x3a>
 801ab24:	4b14      	ldr	r3, [pc, #80]	@ (801ab78 <fn_0801AB00+0x78>)
 801ab26:	5cd3      	ldrb	r3, [r2, r3]
 801ab28:	2b00      	cmp	r3, #0
 801ab2a:	d11b      	bne.n	801ab64 <fn_0801AB00+0x64>
 801ab2c:	2000      	movs	r0, #0
 801ab2e:	f7ea f98d 	bl	8004e4c <fn_08004E4C>
 801ab32:	2100      	movs	r1, #0
 801ab34:	682a      	ldr	r2, [r5, #0]
 801ab36:	4b0f      	ldr	r3, [pc, #60]	@ (801ab74 <fn_0801AB00+0x74>)
 801ab38:	50d1      	str	r1, [r2, r3]
 801ab3a:	0031      	movs	r1, r6
 801ab3c:	0020      	movs	r0, r4
 801ab3e:	f7ea f939 	bl	8004db4 <fn_08004DB4>
 801ab42:	682a      	ldr	r2, [r5, #0]
 801ab44:	4b0b      	ldr	r3, [pc, #44]	@ (801ab74 <fn_0801AB00+0x74>)
 801ab46:	50d4      	str	r4, [r2, r3]
 801ab48:	bc70      	pop	{r4, r5, r6}
 801ab4a:	bc01      	pop	{r0}
 801ab4c:	4700      	bx	r0
 801ab4e:	0021      	movs	r1, r4
 801ab50:	480a      	ldr	r0, [pc, #40]	@ (801ab7c <fn_0801AB00+0x7c>)
 801ab52:	f7e5 fd29 	bl	80005a8 <fn_080005A8>
 801ab56:	4d06      	ldr	r5, [pc, #24]	@ (801ab70 <fn_0801AB00+0x70>)
 801ab58:	4b06      	ldr	r3, [pc, #24]	@ (801ab74 <fn_0801AB00+0x74>)
 801ab5a:	682a      	ldr	r2, [r5, #0]
 801ab5c:	58d3      	ldr	r3, [r2, r3]
 801ab5e:	42a3      	cmp	r3, r4
 801ab60:	d1de      	bne.n	801ab20 <fn_0801AB00+0x20>
 801ab62:	e7f1      	b.n	801ab48 <fn_0801AB00+0x48>
 801ab64:	2000      	movs	r0, #0
 801ab66:	f7ea f963 	bl	8004e30 <fn_08004E30>
 801ab6a:	e7df      	b.n	801ab2c <fn_0801AB00+0x2c>
 801ab6c:	080258a5 	.word	0x080258a5
 801ab70:	030064c4 	.word	0x030064c4
 801ab74:	00005638 	.word	0x00005638
 801ab78:	00005640 	.word	0x00005640
 801ab7c:	0814a90c 	.word	0x0814a90c
