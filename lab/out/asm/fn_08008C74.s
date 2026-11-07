fn_08008C74:
 8008c74:	b5f0      	push	{r4, r5, r6, r7, lr}
 8008c76:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8008c78:	0004      	movs	r4, r0
 8008c7a:	b083      	sub	sp, #12
 8008c7c:	2a00      	cmp	r2, #0
 8008c7e:	d032      	beq.n	8008ce6 <fn_08008C74+0x72>
 8008c80:	2120      	movs	r1, #32
 8008c82:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8008c84:	320c      	adds	r2, #12
 8008c86:	438b      	bics	r3, r1
 8008c88:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8008c8a:	6901      	ldr	r1, [r0, #16]
 8008c8c:	ca0c      	ldmia	r2, {r2, r3}
 8008c8e:	68c0      	ldr	r0, [r0, #12]
 8008c90:	f01c fc66 	bl	8025560 <fn_08025560>
 8008c94:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8008c96:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 8008c98:	0005      	movs	r5, r0
 8008c9a:	6220      	str	r0, [r4, #32]
 8008c9c:	035b      	lsls	r3, r3, #13
 8008c9e:	d426      	bmi.n	8008cee <fn_08008C74+0x7a>
 8008ca0:	2280      	movs	r2, #128	@ 0x80
 8008ca2:	0029      	movs	r1, r5
 8008ca4:	0512      	lsls	r2, r2, #20
 8008ca6:	0020      	movs	r0, r4
 8008ca8:	f006 ff06 	bl	800fab8 <fn_0800FAB8>
 8008cac:	2101      	movs	r1, #1
 8008cae:	0007      	movs	r7, r0
 8008cb0:	0020      	movs	r0, r4
 8008cb2:	f011 fb09 	bl	801a2c8 <fn_0801A2C8>
 8008cb6:	f7fd ff23 	bl	8006b00 <fn_08006B00>
 8008cba:	0006      	movs	r6, r0
 8008cbc:	f7fd ff20 	bl	8006b00 <fn_08006B00>
 8008cc0:	1a33      	subs	r3, r6, r0
 8008cc2:	051b      	lsls	r3, r3, #20
 8008cc4:	195d      	adds	r5, r3, r5
 8008cc6:	f7fd ff1b 	bl	8006b00 <fn_08006B00>
 8008cca:	2105      	movs	r1, #5
 8008ccc:	f01c fc0c 	bl	80254e8 <fn_080254E8>
 8008cd0:	2280      	movs	r2, #128	@ 0x80
 8008cd2:	3101      	adds	r1, #1
 8008cd4:	004b      	lsls	r3, r1, #1
 8008cd6:	185b      	adds	r3, r3, r1
 8008cd8:	9300      	str	r3, [sp, #0]
 8008cda:	0029      	movs	r1, r5
 8008cdc:	003b      	movs	r3, r7
 8008cde:	0020      	movs	r0, r4
 8008ce0:	0512      	lsls	r2, r2, #20
 8008ce2:	f006 ff43 	bl	800fb6c <fn_0800FB6C>
 8008ce6:	b003      	add	sp, #12
 8008ce8:	bcf0      	pop	{r4, r5, r6, r7}
 8008cea:	bc01      	pop	{r0}
 8008cec:	4700      	bx	r0
 8008cee:	f7fd ff07 	bl	8006b00 <fn_08006B00>
 8008cf2:	0005      	movs	r5, r0
 8008cf4:	f7fd ff04 	bl	8006b00 <fn_08006B00>
 8008cf8:	6a23      	ldr	r3, [r4, #32]
 8008cfa:	1a2d      	subs	r5, r5, r0
 8008cfc:	056d      	lsls	r5, r5, #21
 8008cfe:	18ed      	adds	r5, r5, r3
 8008d00:	6225      	str	r5, [r4, #32]
 8008d02:	e7cd      	b.n	8008ca0 <fn_08008C74+0x2c>
