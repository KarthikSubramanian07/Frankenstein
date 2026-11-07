fn_08008D04:
 8008d04:	b5f0      	push	{r4, r5, r6, r7, lr}
 8008d06:	46c6      	mov	lr, r8
 8008d08:	b500      	push	{lr}
 8008d0a:	6d03      	ldr	r3, [r0, #80]	@ 0x50
 8008d0c:	0005      	movs	r5, r0
 8008d0e:	b082      	sub	sp, #8
 8008d10:	2b00      	cmp	r3, #0
 8008d12:	d037      	beq.n	8008d84 <fn_08008D04+0x80>
 8008d14:	2102      	movs	r1, #2
 8008d16:	f011 fad7 	bl	801a2c8 <fn_0801A2C8>
 8008d1a:	6d2a      	ldr	r2, [r5, #80]	@ 0x50
 8008d1c:	2a00      	cmp	r2, #0
 8008d1e:	d037      	beq.n	8008d90 <fn_08008D04+0x8c>
 8008d20:	2120      	movs	r1, #32
 8008d22:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 8008d24:	320c      	adds	r2, #12
 8008d26:	438b      	bics	r3, r1
 8008d28:	64eb      	str	r3, [r5, #76]	@ 0x4c
 8008d2a:	6929      	ldr	r1, [r5, #16]
 8008d2c:	ca0c      	ldmia	r2, {r2, r3}
 8008d2e:	68e8      	ldr	r0, [r5, #12]
 8008d30:	f01c fc16 	bl	8025560 <fn_08025560>
 8008d34:	6d2b      	ldr	r3, [r5, #80]	@ 0x50
 8008d36:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 8008d38:	0007      	movs	r7, r0
 8008d3a:	6228      	str	r0, [r5, #32]
 8008d3c:	035b      	lsls	r3, r3, #13
 8008d3e:	d429      	bmi.n	8008d94 <fn_08008D04+0x90>
 8008d40:	2280      	movs	r2, #128	@ 0x80
 8008d42:	0039      	movs	r1, r7
 8008d44:	0028      	movs	r0, r5
 8008d46:	0512      	lsls	r2, r2, #20
 8008d48:	f006 feb6 	bl	800fab8 <fn_0800FAB8>
 8008d4c:	2603      	movs	r6, #3
 8008d4e:	4680      	mov	r8, r0
 8008d50:	f7fd fed6 	bl	8006b00 <fn_08006B00>
 8008d54:	0004      	movs	r4, r0
 8008d56:	f7fd fed3 	bl	8006b00 <fn_08006B00>
 8008d5a:	1a24      	subs	r4, r4, r0
 8008d5c:	f7fd fed0 	bl	8006b00 <fn_08006B00>
 8008d60:	2105      	movs	r1, #5
 8008d62:	f01c fbc1 	bl	80254e8 <fn_080254E8>
 8008d66:	2280      	movs	r2, #128	@ 0x80
 8008d68:	3101      	adds	r1, #1
 8008d6a:	004b      	lsls	r3, r1, #1
 8008d6c:	185b      	adds	r3, r3, r1
 8008d6e:	0524      	lsls	r4, r4, #20
 8008d70:	9300      	str	r3, [sp, #0]
 8008d72:	0028      	movs	r0, r5
 8008d74:	4643      	mov	r3, r8
 8008d76:	0512      	lsls	r2, r2, #20
 8008d78:	19e1      	adds	r1, r4, r7
 8008d7a:	3e01      	subs	r6, #1
 8008d7c:	f006 fef6 	bl	800fb6c <fn_0800FB6C>
 8008d80:	2e00      	cmp	r6, #0
 8008d82:	d1e5      	bne.n	8008d50 <fn_08008D04+0x4c>
 8008d84:	b002      	add	sp, #8
 8008d86:	bc80      	pop	{r7}
 8008d88:	46b8      	mov	r8, r7
 8008d8a:	bcf0      	pop	{r4, r5, r6, r7}
 8008d8c:	bc01      	pop	{r0}
 8008d8e:	4700      	bx	r0
 8008d90:	6a2f      	ldr	r7, [r5, #32]
 8008d92:	e7d5      	b.n	8008d40 <fn_08008D04+0x3c>
 8008d94:	f7fd feb4 	bl	8006b00 <fn_08006B00>
 8008d98:	0007      	movs	r7, r0
 8008d9a:	f7fd feb1 	bl	8006b00 <fn_08006B00>
 8008d9e:	6a2b      	ldr	r3, [r5, #32]
 8008da0:	1a3f      	subs	r7, r7, r0
 8008da2:	057f      	lsls	r7, r7, #21
 8008da4:	18ff      	adds	r7, r7, r3
 8008da6:	622f      	str	r7, [r5, #32]
 8008da8:	e7ca      	b.n	8008d40 <fn_08008D04+0x3c>
 8008daa:	46c0      	nop			@ (mov r8, r8)
