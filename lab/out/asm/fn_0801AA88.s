fn_0801AA88:
 801aa88:	4b18      	ldr	r3, [pc, #96]	@ (801aaec <fn_0801AA88+0x64>)
 801aa8a:	781b      	ldrb	r3, [r3, #0]
 801aa8c:	b570      	push	{r4, r5, r6, lr}
 801aa8e:	0004      	movs	r4, r0
 801aa90:	2b00      	cmp	r3, #0
 801aa92:	d002      	beq.n	801aa9a <fn_0801AA88+0x12>
 801aa94:	bc70      	pop	{r4, r5, r6}
 801aa96:	bc01      	pop	{r0}
 801aa98:	4700      	bx	r0
 801aa9a:	1e43      	subs	r3, r0, #1
 801aa9c:	2b42      	cmp	r3, #66	@ 0x42
 801aa9e:	d81b      	bhi.n	801aad8 <fn_0801AA88+0x50>
 801aaa0:	4b13      	ldr	r3, [pc, #76]	@ (801aaf0 <fn_0801AA88+0x68>)
 801aaa2:	681a      	ldr	r2, [r3, #0]
 801aaa4:	001d      	movs	r5, r3
 801aaa6:	4b13      	ldr	r3, [pc, #76]	@ (801aaf4 <fn_0801AA88+0x6c>)
 801aaa8:	58d3      	ldr	r3, [r2, r3]
 801aaaa:	429c      	cmp	r4, r3
 801aaac:	d0f2      	beq.n	801aa94 <fn_0801AA88+0xc>
 801aaae:	2b00      	cmp	r3, #0
 801aab0:	d00a      	beq.n	801aac8 <fn_0801AA88+0x40>
 801aab2:	4b11      	ldr	r3, [pc, #68]	@ (801aaf8 <fn_0801AA88+0x70>)
 801aab4:	5cd3      	ldrb	r3, [r2, r3]
 801aab6:	2b00      	cmp	r3, #0
 801aab8:	d113      	bne.n	801aae2 <fn_0801AA88+0x5a>
 801aaba:	2000      	movs	r0, #0
 801aabc:	f7ea f9c6 	bl	8004e4c <fn_08004E4C>
 801aac0:	2100      	movs	r1, #0
 801aac2:	682a      	ldr	r2, [r5, #0]
 801aac4:	4b0b      	ldr	r3, [pc, #44]	@ (801aaf4 <fn_0801AA88+0x6c>)
 801aac6:	50d1      	str	r1, [r2, r3]
 801aac8:	2100      	movs	r1, #0
 801aaca:	0020      	movs	r0, r4
 801aacc:	f7ea f972 	bl	8004db4 <fn_08004DB4>
 801aad0:	682a      	ldr	r2, [r5, #0]
 801aad2:	4b08      	ldr	r3, [pc, #32]	@ (801aaf4 <fn_0801AA88+0x6c>)
 801aad4:	50d4      	str	r4, [r2, r3]
 801aad6:	e7dd      	b.n	801aa94 <fn_0801AA88+0xc>
 801aad8:	0021      	movs	r1, r4
 801aada:	4808      	ldr	r0, [pc, #32]	@ (801aafc <fn_0801AA88+0x74>)
 801aadc:	f7e5 fd64 	bl	80005a8 <fn_080005A8>
 801aae0:	e7de      	b.n	801aaa0 <fn_0801AA88+0x18>
 801aae2:	2000      	movs	r0, #0
 801aae4:	f7ea f9a4 	bl	8004e30 <fn_08004E30>
 801aae8:	e7e7      	b.n	801aaba <fn_0801AA88+0x32>
 801aaea:	46c0      	nop			@ (mov r8, r8)
 801aaec:	080258a5 	.word	0x080258a5
 801aaf0:	030064c4 	.word	0x030064c4
 801aaf4:	00005638 	.word	0x00005638
 801aaf8:	00005640 	.word	0x00005640
 801aafc:	0814a90c 	.word	0x0814a90c
