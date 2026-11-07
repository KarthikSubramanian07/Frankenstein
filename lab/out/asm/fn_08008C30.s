fn_08008C30:
 8008c30:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8008c32:	b570      	push	{r4, r5, r6, lr}
 8008c34:	0004      	movs	r4, r0
 8008c36:	2a00      	cmp	r2, #0
 8008c38:	d00e      	beq.n	8008c58 <fn_08008C30+0x28>
 8008c3a:	2120      	movs	r1, #32
 8008c3c:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8008c3e:	320c      	adds	r2, #12
 8008c40:	438b      	bics	r3, r1
 8008c42:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8008c44:	6901      	ldr	r1, [r0, #16]
 8008c46:	ca0c      	ldmia	r2, {r2, r3}
 8008c48:	68c0      	ldr	r0, [r0, #12]
 8008c4a:	f01c fce1 	bl	8025610 <fn_08025610>
 8008c4e:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8008c50:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 8008c52:	6220      	str	r0, [r4, #32]
 8008c54:	035b      	lsls	r3, r3, #13
 8008c56:	d402      	bmi.n	8008c5e <fn_08008C30+0x2e>
 8008c58:	bc70      	pop	{r4, r5, r6}
 8008c5a:	bc01      	pop	{r0}
 8008c5c:	4700      	bx	r0
 8008c5e:	f7fd ff4f 	bl	8006b00 <fn_08006B00>
 8008c62:	0005      	movs	r5, r0
 8008c64:	f7fd ff4c 	bl	8006b00 <fn_08006B00>
 8008c68:	6a23      	ldr	r3, [r4, #32]
 8008c6a:	1a28      	subs	r0, r5, r0
 8008c6c:	0540      	lsls	r0, r0, #21
 8008c6e:	181b      	adds	r3, r3, r0
 8008c70:	6223      	str	r3, [r4, #32]
 8008c72:	e7f1      	b.n	8008c58 <fn_08008C30+0x28>
