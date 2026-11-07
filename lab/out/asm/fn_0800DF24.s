fn_0800DF24:
 800df24:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800df26:	0005      	movs	r5, r0
 800df28:	000f      	movs	r7, r1
 800df2a:	0016      	movs	r6, r2
 800df2c:	2103      	movs	r1, #3
 800df2e:	2200      	movs	r2, #0
 800df30:	2024      	movs	r0, #36	@ 0x24
 800df32:	f00f fbfb 	bl	801d72c <fn_0801D72C>
 800df36:	0004      	movs	r4, r0
 800df38:	2224      	movs	r2, #36	@ 0x24
 800df3a:	2100      	movs	r1, #0
 800df3c:	f012 fd80 	bl	8020a40 <fn_08020A40>
 800df40:	0020      	movs	r0, r4
 800df42:	f00a fb45 	bl	80185d0 <fn_080185D0>
 800df46:	2305      	movs	r3, #5
 800df48:	6223      	str	r3, [r4, #32]
 800df4a:	4b11      	ldr	r3, [pc, #68]	@ (800df90 <fn_0800DF24+0x6c>)
 800df4c:	60a3      	str	r3, [r4, #8]
 800df4e:	2326      	movs	r3, #38	@ 0x26
 800df50:	60e5      	str	r5, [r4, #12]
 800df52:	61e7      	str	r7, [r4, #28]
 800df54:	5ce9      	ldrb	r1, [r5, r3]
 800df56:	0028      	movs	r0, r5
 800df58:	61a1      	str	r1, [r4, #24]
 800df5a:	f007 f93b 	bl	80151d4 <fn_080151D4>
 800df5e:	69a3      	ldr	r3, [r4, #24]
 800df60:	1ac3      	subs	r3, r0, r3
 800df62:	1e5a      	subs	r2, r3, #1
 800df64:	4193      	sbcs	r3, r2
 800df66:	221f      	movs	r2, #31
 800df68:	425b      	negs	r3, r3
 800df6a:	4018      	ands	r0, r3
 800df6c:	6160      	str	r0, [r4, #20]
 800df6e:	8c2b      	ldrh	r3, [r5, #32]
 800df70:	4393      	bics	r3, r2
 800df72:	2001      	movs	r0, #1
 800df74:	842b      	strh	r3, [r5, #32]
 800df76:	2e00      	cmp	r6, #0
 800df78:	d003      	beq.n	800df82 <fn_0800DF24+0x5e>
 800df7a:	6120      	str	r0, [r4, #16]
 800df7c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800df7e:	bc01      	pop	{r0}
 800df80:	4700      	bx	r0
 800df82:	f7f8 fdbd 	bl	8006b00 <fn_08006B00>
 800df86:	2307      	movs	r3, #7
 800df88:	4018      	ands	r0, r3
 800df8a:	3001      	adds	r0, #1
 800df8c:	e7f5      	b.n	800df7a <fn_0800DF24+0x56>
 800df8e:	46c0      	nop			@ (mov r8, r8)
 800df90:	0800dd95 	.word	0x0800dd95
