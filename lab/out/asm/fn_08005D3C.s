fn_08005D3C:
 8005d3c:	2284      	movs	r2, #132	@ 0x84
 8005d3e:	4b0e      	ldr	r3, [pc, #56]	@ (8005d78 <fn_08005D3C+0x3c>)
 8005d40:	6819      	ldr	r1, [r3, #0]
 8005d42:	b510      	push	{r4, lr}
 8005d44:	588b      	ldr	r3, [r1, r2]
 8005d46:	2800      	cmp	r0, #0
 8005d48:	d011      	beq.n	8005d6e <fn_08005D3C+0x32>
 8005d4a:	2801      	cmp	r0, #1
 8005d4c:	d00a      	beq.n	8005d64 <fn_08005D3C+0x28>
 8005d4e:	0018      	movs	r0, r3
 8005d50:	f016 facc 	bl	801c2ec <fn_0801C2EC>
 8005d54:	2000      	movs	r0, #0
 8005d56:	f016 fac3 	bl	801c2e0 <fn_0801C2E0>
 8005d5a:	f7fd fe4d 	bl	80039f8 <fn_080039F8>
 8005d5e:	bc10      	pop	{r4}
 8005d60:	bc01      	pop	{r0}
 8005d62:	4700      	bx	r0
 8005d64:	2b03      	cmp	r3, #3
 8005d66:	d8f2      	bhi.n	8005d4e <fn_08005D3C+0x12>
 8005d68:	3301      	adds	r3, #1
 8005d6a:	508b      	str	r3, [r1, r2]
 8005d6c:	e7ef      	b.n	8005d4e <fn_08005D3C+0x12>
 8005d6e:	2b00      	cmp	r3, #0
 8005d70:	d0ed      	beq.n	8005d4e <fn_08005D3C+0x12>
 8005d72:	3b01      	subs	r3, #1
 8005d74:	508b      	str	r3, [r1, r2]
 8005d76:	e7ea      	b.n	8005d4e <fn_08005D3C+0x12>
 8005d78:	030064c4 	.word	0x030064c4
