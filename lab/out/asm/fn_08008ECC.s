fn_08008ECC:
 8008ecc:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8008ece:	b570      	push	{r4, r5, r6, lr}
 8008ed0:	0004      	movs	r4, r0
 8008ed2:	2a00      	cmp	r2, #0
 8008ed4:	d00e      	beq.n	8008ef4 <fn_08008ECC+0x28>
 8008ed6:	2120      	movs	r1, #32
 8008ed8:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8008eda:	320c      	adds	r2, #12
 8008edc:	438b      	bics	r3, r1
 8008ede:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8008ee0:	6901      	ldr	r1, [r0, #16]
 8008ee2:	ca0c      	ldmia	r2, {r2, r3}
 8008ee4:	68c0      	ldr	r0, [r0, #12]
 8008ee6:	f01c fb93 	bl	8025610 <fn_08025610>
 8008eea:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8008eec:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 8008eee:	6220      	str	r0, [r4, #32]
 8008ef0:	035b      	lsls	r3, r3, #13
 8008ef2:	d41b      	bmi.n	8008f2c <fn_08008ECC+0x60>
 8008ef4:	f7fd fe04 	bl	8006b00 <fn_08006B00>
 8008ef8:	2809      	cmp	r0, #9
 8008efa:	dd14      	ble.n	8008f26 <fn_08008ECC+0x5a>
 8008efc:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8008efe:	2900      	cmp	r1, #0
 8008f00:	d003      	beq.n	8008f0a <fn_08008ECC+0x3e>
 8008f02:	2354      	movs	r3, #84	@ 0x54
 8008f04:	5ecb      	ldrsh	r3, [r1, r3]
 8008f06:	2b00      	cmp	r3, #0
 8008f08:	dc1b      	bgt.n	8008f42 <fn_08008ECC+0x76>
 8008f0a:	4b11      	ldr	r3, [pc, #68]	@ (8008f50 <fn_08008ECC+0x84>)
 8008f0c:	681a      	ldr	r2, [r3, #0]
 8008f0e:	235a      	movs	r3, #90	@ 0x5a
 8008f10:	5ce1      	ldrb	r1, [r4, r3]
 8008f12:	23ea      	movs	r3, #234	@ 0xea
 8008f14:	00db      	lsls	r3, r3, #3
 8008f16:	58d3      	ldr	r3, [r2, r3]
 8008f18:	225c      	movs	r2, #92	@ 0x5c
 8008f1a:	434a      	muls	r2, r1
 8008f1c:	189b      	adds	r3, r3, r2
 8008f1e:	0020      	movs	r0, r4
 8008f20:	8999      	ldrh	r1, [r3, #12]
 8008f22:	f008 f973 	bl	801120c <fn_0801120C>
 8008f26:	bc70      	pop	{r4, r5, r6}
 8008f28:	bc01      	pop	{r0}
 8008f2a:	4700      	bx	r0
 8008f2c:	f7fd fde8 	bl	8006b00 <fn_08006B00>
 8008f30:	0005      	movs	r5, r0
 8008f32:	f7fd fde5 	bl	8006b00 <fn_08006B00>
 8008f36:	6a23      	ldr	r3, [r4, #32]
 8008f38:	1a28      	subs	r0, r5, r0
 8008f3a:	0540      	lsls	r0, r0, #21
 8008f3c:	181b      	adds	r3, r3, r0
 8008f3e:	6223      	str	r3, [r4, #32]
 8008f40:	e7d8      	b.n	8008ef4 <fn_08008ECC+0x28>
 8008f42:	0020      	movs	r0, r4
 8008f44:	f00b f9fc 	bl	8014340 <fn_08014340>
 8008f48:	2800      	cmp	r0, #0
 8008f4a:	d0de      	beq.n	8008f0a <fn_08008ECC+0x3e>
 8008f4c:	e7eb      	b.n	8008f26 <fn_08008ECC+0x5a>
 8008f4e:	46c0      	nop			@ (mov r8, r8)
 8008f50:	030064c4 	.word	0x030064c4
