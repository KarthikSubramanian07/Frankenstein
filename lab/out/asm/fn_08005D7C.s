fn_08005D7C:
 8005d7c:	4b09      	ldr	r3, [pc, #36]	@ (8005da4 <fn_08005D7C+0x28>)
 8005d7e:	681b      	ldr	r3, [r3, #0]
 8005d80:	b510      	push	{r4, lr}
 8005d82:	4283      	cmp	r3, r0
 8005d84:	d002      	beq.n	8005d8c <fn_08005D7C+0x10>
 8005d86:	bc10      	pop	{r4}
 8005d88:	bc01      	pop	{r0}
 8005d8a:	4700      	bx	r0
 8005d8c:	4b06      	ldr	r3, [pc, #24]	@ (8005da8 <fn_08005D7C+0x2c>)
 8005d8e:	681a      	ldr	r2, [r3, #0]
 8005d90:	23f1      	movs	r3, #241	@ 0xf1
 8005d92:	00db      	lsls	r3, r3, #3
 8005d94:	58d1      	ldr	r1, [r2, r3]
 8005d96:	2004      	movs	r0, #4
 8005d98:	2201      	movs	r2, #1
 8005d9a:	3101      	adds	r1, #1
 8005d9c:	f7fd febc 	bl	8003b18 <fn_08003B18>
 8005da0:	e7f1      	b.n	8005d86 <fn_08005D7C+0xa>
 8005da2:	46c0      	nop			@ (mov r8, r8)
 8005da4:	08025a44 	.word	0x08025a44	@ data_08025A44
 8005da8:	030064c4 	.word	0x030064c4	@ data_030064C4
