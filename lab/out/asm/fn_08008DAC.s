fn_08008DAC:
 8008dac:	b5f0      	push	{r4, r5, r6, r7, lr}
 8008dae:	6d03      	ldr	r3, [r0, #80]	@ 0x50
 8008db0:	0004      	movs	r4, r0
 8008db2:	b083      	sub	sp, #12
 8008db4:	2b00      	cmp	r3, #0
 8008db6:	d034      	beq.n	8008e22 <fn_08008DAC+0x76>
 8008db8:	2102      	movs	r1, #2
 8008dba:	f011 fa85 	bl	801a2c8 <fn_0801A2C8>
 8008dbe:	6d22      	ldr	r2, [r4, #80]	@ 0x50
 8008dc0:	2a00      	cmp	r2, #0
 8008dc2:	d032      	beq.n	8008e2a <fn_08008DAC+0x7e>
 8008dc4:	2120      	movs	r1, #32
 8008dc6:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 8008dc8:	320c      	adds	r2, #12
 8008dca:	438b      	bics	r3, r1
 8008dcc:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8008dce:	6921      	ldr	r1, [r4, #16]
 8008dd0:	ca0c      	ldmia	r2, {r2, r3}
 8008dd2:	68e0      	ldr	r0, [r4, #12]
 8008dd4:	f01c fbc4 	bl	8025560 <fn_08025560>
 8008dd8:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8008dda:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 8008ddc:	0005      	movs	r5, r0
 8008dde:	6220      	str	r0, [r4, #32]
 8008de0:	035b      	lsls	r3, r3, #13
 8008de2:	d424      	bmi.n	8008e2e <fn_08008DAC+0x82>
 8008de4:	2280      	movs	r2, #128	@ 0x80
 8008de6:	0029      	movs	r1, r5
 8008de8:	0512      	lsls	r2, r2, #20
 8008dea:	0020      	movs	r0, r4
 8008dec:	f006 fe64 	bl	800fab8 <fn_0800FAB8>
 8008df0:	0007      	movs	r7, r0
 8008df2:	f7fd fe85 	bl	8006b00 <fn_08006B00>
 8008df6:	0006      	movs	r6, r0
 8008df8:	f7fd fe82 	bl	8006b00 <fn_08006B00>
 8008dfc:	1a33      	subs	r3, r6, r0
 8008dfe:	051b      	lsls	r3, r3, #20
 8008e00:	195d      	adds	r5, r3, r5
 8008e02:	f7fd fe7d 	bl	8006b00 <fn_08006B00>
 8008e06:	2105      	movs	r1, #5
 8008e08:	f01c fb6e 	bl	80254e8 <fn_080254E8>
 8008e0c:	2280      	movs	r2, #128	@ 0x80
 8008e0e:	3101      	adds	r1, #1
 8008e10:	004b      	lsls	r3, r1, #1
 8008e12:	185b      	adds	r3, r3, r1
 8008e14:	9300      	str	r3, [sp, #0]
 8008e16:	0029      	movs	r1, r5
 8008e18:	003b      	movs	r3, r7
 8008e1a:	0020      	movs	r0, r4
 8008e1c:	0512      	lsls	r2, r2, #20
 8008e1e:	f006 fea5 	bl	800fb6c <fn_0800FB6C>
 8008e22:	b003      	add	sp, #12
 8008e24:	bcf0      	pop	{r4, r5, r6, r7}
 8008e26:	bc01      	pop	{r0}
 8008e28:	4700      	bx	r0
 8008e2a:	6a25      	ldr	r5, [r4, #32]
 8008e2c:	e7da      	b.n	8008de4 <fn_08008DAC+0x38>
 8008e2e:	f7fd fe67 	bl	8006b00 <fn_08006B00>
 8008e32:	0005      	movs	r5, r0
 8008e34:	f7fd fe64 	bl	8006b00 <fn_08006B00>
 8008e38:	6a23      	ldr	r3, [r4, #32]
 8008e3a:	1a2d      	subs	r5, r5, r0
 8008e3c:	056d      	lsls	r5, r5, #21
 8008e3e:	18ed      	adds	r5, r5, r3
 8008e40:	6225      	str	r5, [r4, #32]
 8008e42:	e7cf      	b.n	8008de4 <fn_08008DAC+0x38>
