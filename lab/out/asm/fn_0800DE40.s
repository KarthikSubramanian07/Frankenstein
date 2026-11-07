fn_0800DE40:
 800de40:	6903      	ldr	r3, [r0, #16]
 800de42:	3b01      	subs	r3, #1
 800de44:	b510      	push	{r4, lr}
 800de46:	0004      	movs	r4, r0
 800de48:	6103      	str	r3, [r0, #16]
 800de4a:	2b00      	cmp	r3, #0
 800de4c:	d10c      	bne.n	800de68 <fn_0800DE40+0x28>
 800de4e:	68c2      	ldr	r2, [r0, #12]
 800de50:	3326      	adds	r3, #38	@ 0x26
 800de52:	6941      	ldr	r1, [r0, #20]
 800de54:	5cd0      	ldrb	r0, [r2, r3]
 800de56:	4288      	cmp	r0, r1
 800de58:	d009      	beq.n	800de6e <fn_0800DE40+0x2e>
 800de5a:	54d1      	strb	r1, [r2, r3]
 800de5c:	f7f8 fe50 	bl	8006b00 <fn_08006B00>
 800de60:	69e3      	ldr	r3, [r4, #28]
 800de62:	4003      	ands	r3, r0
 800de64:	3301      	adds	r3, #1
 800de66:	6123      	str	r3, [r4, #16]
 800de68:	bc10      	pop	{r4}
 800de6a:	bc01      	pop	{r0}
 800de6c:	4700      	bx	r0
 800de6e:	69a1      	ldr	r1, [r4, #24]
 800de70:	54d1      	strb	r1, [r2, r3]
 800de72:	f7f8 fe45 	bl	8006b00 <fn_08006B00>
 800de76:	6a23      	ldr	r3, [r4, #32]
 800de78:	4003      	ands	r3, r0
 800de7a:	3301      	adds	r3, #1
 800de7c:	6123      	str	r3, [r4, #16]
 800de7e:	e7f3      	b.n	800de68 <fn_0800DE40+0x28>
