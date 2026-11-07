fn_08008F54:
 8008f54:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8008f56:	b570      	push	{r4, r5, r6, lr}
 8008f58:	0004      	movs	r4, r0
 8008f5a:	2a00      	cmp	r2, #0
 8008f5c:	d012      	beq.n	8008f84 <fn_08008F54+0x30>
 8008f5e:	2120      	movs	r1, #32
 8008f60:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8008f62:	320c      	adds	r2, #12
 8008f64:	438b      	bics	r3, r1
 8008f66:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8008f68:	6901      	ldr	r1, [r0, #16]
 8008f6a:	ca0c      	ldmia	r2, {r2, r3}
 8008f6c:	68c0      	ldr	r0, [r0, #12]
 8008f6e:	f01c fb4f 	bl	8025610 <fn_08025610>
 8008f72:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8008f74:	6ccb      	ldr	r3, [r1, #76]	@ 0x4c
 8008f76:	6220      	str	r0, [r4, #32]
 8008f78:	035b      	lsls	r3, r3, #13
 8008f7a:	d406      	bmi.n	8008f8a <fn_08008F54+0x36>
 8008f7c:	2224      	movs	r2, #36	@ 0x24
 8008f7e:	0020      	movs	r0, r4
 8008f80:	f009 f84c 	bl	801201c <fn_0801201C>
 8008f84:	bc70      	pop	{r4, r5, r6}
 8008f86:	bc01      	pop	{r0}
 8008f88:	4700      	bx	r0
 8008f8a:	f7fd fdb9 	bl	8006b00 <fn_08006B00>
 8008f8e:	0005      	movs	r5, r0
 8008f90:	f7fd fdb6 	bl	8006b00 <fn_08006B00>
 8008f94:	6a23      	ldr	r3, [r4, #32]
 8008f96:	1a28      	subs	r0, r5, r0
 8008f98:	0540      	lsls	r0, r0, #21
 8008f9a:	181b      	adds	r3, r3, r0
 8008f9c:	6223      	str	r3, [r4, #32]
 8008f9e:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8008fa0:	e7ec      	b.n	8008f7c <fn_08008F54+0x28>
 8008fa2:	46c0      	nop			@ (mov r8, r8)
