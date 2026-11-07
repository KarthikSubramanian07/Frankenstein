fn_08006F70:
 8006f70:	4b10      	ldr	r3, [pc, #64]	@ (8006fb4 <fn_08006F70+0x44>)
 8006f72:	b5f0      	push	{r4, r5, r6, r7, lr}
 8006f74:	4a10      	ldr	r2, [pc, #64]	@ (8006fb8 <fn_08006F70+0x48>)
 8006f76:	681c      	ldr	r4, [r3, #0]
 8006f78:	4b10      	ldr	r3, [pc, #64]	@ (8006fbc <fn_08006F70+0x4c>)
 8006f7a:	18e3      	adds	r3, r4, r3
 8006f7c:	18a4      	adds	r4, r4, r2
 8006f7e:	2200      	movs	r2, #0
 8006f80:	2700      	movs	r7, #0
 8006f82:	4694      	mov	ip, r2
 8006f84:	681a      	ldr	r2, [r3, #0]
 8006f86:	2a00      	cmp	r2, #0
 8006f88:	d00c      	beq.n	8006fa4 <fn_08006F70+0x34>
 8006f8a:	6b51      	ldr	r1, [r2, #52]	@ 0x34
 8006f8c:	2900      	cmp	r1, #0
 8006f8e:	d009      	beq.n	8006fa4 <fn_08006F70+0x34>
 8006f90:	261c      	movs	r6, #28
 8006f92:	5f85      	ldrsh	r5, [r0, r6]
 8006f94:	6b96      	ldr	r6, [r2, #56]	@ 0x38
 8006f96:	42ae      	cmp	r6, r5
 8006f98:	d104      	bne.n	8006fa4 <fn_08006F70+0x34>
 8006f9a:	63d1      	str	r1, [r2, #60]	@ 0x3c
 8006f9c:	6357      	str	r7, [r2, #52]	@ 0x34
 8006f9e:	6097      	str	r7, [r2, #8]
 8006fa0:	2201      	movs	r2, #1
 8006fa2:	4694      	mov	ip, r2
 8006fa4:	3304      	adds	r3, #4
 8006fa6:	429c      	cmp	r4, r3
 8006fa8:	d1ec      	bne.n	8006f84 <fn_08006F70+0x14>
 8006faa:	4660      	mov	r0, ip
 8006fac:	bcf0      	pop	{r4, r5, r6, r7}
 8006fae:	bc02      	pop	{r1}
 8006fb0:	4708      	bx	r1
 8006fb2:	46c0      	nop			@ (mov r8, r8)
 8006fb4:	030064c4 	.word	0x030064c4	@ data_030064C4
 8006fb8:	0000085c 	.word	0x0000085c
 8006fbc:	000007dc 	.word	0x000007dc
