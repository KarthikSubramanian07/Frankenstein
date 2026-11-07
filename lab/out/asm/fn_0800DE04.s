fn_0800DE04:
 800de04:	6903      	ldr	r3, [r0, #16]
 800de06:	3b01      	subs	r3, #1
 800de08:	b510      	push	{r4, lr}
 800de0a:	0004      	movs	r4, r0
 800de0c:	6103      	str	r3, [r0, #16]
 800de0e:	2b00      	cmp	r3, #0
 800de10:	d002      	beq.n	800de18 <fn_0800DE04+0x14>
 800de12:	bc10      	pop	{r4}
 800de14:	bc01      	pop	{r0}
 800de16:	4700      	bx	r0
 800de18:	f7f8 fe72 	bl	8006b00 <fn_08006B00>
 800de1c:	2303      	movs	r3, #3
 800de1e:	2226      	movs	r2, #38	@ 0x26
 800de20:	68e1      	ldr	r1, [r4, #12]
 800de22:	4018      	ands	r0, r3
 800de24:	5c8a      	ldrb	r2, [r1, r2]
 800de26:	69a3      	ldr	r3, [r4, #24]
 800de28:	0100      	lsls	r0, r0, #4
 800de2a:	1a12      	subs	r2, r2, r0
 800de2c:	429a      	cmp	r2, r3
 800de2e:	db01      	blt.n	800de34 <fn_0800DE04+0x30>
 800de30:	6963      	ldr	r3, [r4, #20]
 800de32:	1a1b      	subs	r3, r3, r0
 800de34:	2226      	movs	r2, #38	@ 0x26
 800de36:	548b      	strb	r3, [r1, r2]
 800de38:	2304      	movs	r3, #4
 800de3a:	6123      	str	r3, [r4, #16]
 800de3c:	e7e9      	b.n	800de12 <fn_0800DE04+0xe>
 800de3e:	46c0      	nop			@ (mov r8, r8)
