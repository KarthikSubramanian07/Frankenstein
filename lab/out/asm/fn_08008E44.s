fn_08008E44:
 8008e44:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8008e46:	b570      	push	{r4, r5, r6, lr}
 8008e48:	0004      	movs	r4, r0
 8008e4a:	2a00      	cmp	r2, #0
 8008e4c:	d00e      	beq.n	8008e6c <fn_08008E44+0x28>
 8008e4e:	2120      	movs	r1, #32
 8008e50:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8008e52:	320c      	adds	r2, #12
 8008e54:	438b      	bics	r3, r1
 8008e56:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8008e58:	6901      	ldr	r1, [r0, #16]
 8008e5a:	ca0c      	ldmia	r2, {r2, r3}
 8008e5c:	68c0      	ldr	r0, [r0, #12]
 8008e5e:	f01c fb7f 	bl	8025560 <fn_08025560>
 8008e62:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8008e64:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 8008e66:	6220      	str	r0, [r4, #32]
 8008e68:	035b      	lsls	r3, r3, #13
 8008e6a:	d41b      	bmi.n	8008ea4 <fn_08008E44+0x60>
 8008e6c:	f7fd fe48 	bl	8006b00 <fn_08006B00>
 8008e70:	2827      	cmp	r0, #39	@ 0x27
 8008e72:	dd14      	ble.n	8008e9e <fn_08008E44+0x5a>
 8008e74:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8008e76:	2900      	cmp	r1, #0
 8008e78:	d003      	beq.n	8008e82 <fn_08008E44+0x3e>
 8008e7a:	2354      	movs	r3, #84	@ 0x54
 8008e7c:	5ecb      	ldrsh	r3, [r1, r3]
 8008e7e:	2b00      	cmp	r3, #0
 8008e80:	dc1b      	bgt.n	8008eba <fn_08008E44+0x76>
 8008e82:	4b11      	ldr	r3, [pc, #68]	@ (8008ec8 <fn_08008E44+0x84>)
 8008e84:	681a      	ldr	r2, [r3, #0]
 8008e86:	235a      	movs	r3, #90	@ 0x5a
 8008e88:	5ce1      	ldrb	r1, [r4, r3]
 8008e8a:	23ea      	movs	r3, #234	@ 0xea
 8008e8c:	00db      	lsls	r3, r3, #3
 8008e8e:	58d3      	ldr	r3, [r2, r3]
 8008e90:	225c      	movs	r2, #92	@ 0x5c
 8008e92:	434a      	muls	r2, r1
 8008e94:	189b      	adds	r3, r3, r2
 8008e96:	0020      	movs	r0, r4
 8008e98:	8999      	ldrh	r1, [r3, #12]
 8008e9a:	f008 f9b7 	bl	801120c <fn_0801120C>
 8008e9e:	bc70      	pop	{r4, r5, r6}
 8008ea0:	bc01      	pop	{r0}
 8008ea2:	4700      	bx	r0
 8008ea4:	f7fd fe2c 	bl	8006b00 <fn_08006B00>
 8008ea8:	0005      	movs	r5, r0
 8008eaa:	f7fd fe29 	bl	8006b00 <fn_08006B00>
 8008eae:	6a23      	ldr	r3, [r4, #32]
 8008eb0:	1a28      	subs	r0, r5, r0
 8008eb2:	0540      	lsls	r0, r0, #21
 8008eb4:	181b      	adds	r3, r3, r0
 8008eb6:	6223      	str	r3, [r4, #32]
 8008eb8:	e7d8      	b.n	8008e6c <fn_08008E44+0x28>
 8008eba:	0020      	movs	r0, r4
 8008ebc:	f00b f9e6 	bl	801428c <fn_0801428C>
 8008ec0:	2800      	cmp	r0, #0
 8008ec2:	d0de      	beq.n	8008e82 <fn_08008E44+0x3e>
 8008ec4:	e7eb      	b.n	8008e9e <fn_08008E44+0x5a>
 8008ec6:	46c0      	nop			@ (mov r8, r8)
 8008ec8:	030064c4 	.word	0x030064c4
