fn_0800DD94:
 800dd94:	6903      	ldr	r3, [r0, #16]
 800dd96:	3b01      	subs	r3, #1
 800dd98:	b510      	push	{r4, lr}
 800dd9a:	6103      	str	r3, [r0, #16]
 800dd9c:	2b00      	cmp	r3, #0
 800dd9e:	d108      	bne.n	800ddb2 <fn_0800DD94+0x1e>
 800dda0:	68c2      	ldr	r2, [r0, #12]
 800dda2:	3326      	adds	r3, #38	@ 0x26
 800dda4:	6941      	ldr	r1, [r0, #20]
 800dda6:	5cd4      	ldrb	r4, [r2, r3]
 800dda8:	428c      	cmp	r4, r1
 800ddaa:	d005      	beq.n	800ddb8 <fn_0800DD94+0x24>
 800ddac:	54d1      	strb	r1, [r2, r3]
 800ddae:	69c3      	ldr	r3, [r0, #28]
 800ddb0:	6103      	str	r3, [r0, #16]
 800ddb2:	bc10      	pop	{r4}
 800ddb4:	bc01      	pop	{r0}
 800ddb6:	4700      	bx	r0
 800ddb8:	6981      	ldr	r1, [r0, #24]
 800ddba:	54d1      	strb	r1, [r2, r3]
 800ddbc:	6a03      	ldr	r3, [r0, #32]
 800ddbe:	6103      	str	r3, [r0, #16]
 800ddc0:	e7f7      	b.n	800ddb2 <fn_0800DD94+0x1e>
 800ddc2:	46c0      	nop			@ (mov r8, r8)
