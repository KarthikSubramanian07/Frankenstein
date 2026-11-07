fn_08009A28:
 8009a28:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8009a2a:	b570      	push	{r4, r5, r6, lr}
 8009a2c:	0004      	movs	r4, r0
 8009a2e:	2a00      	cmp	r2, #0
 8009a30:	d00e      	beq.n	8009a50 <fn_08009A28+0x28>
 8009a32:	2120      	movs	r1, #32
 8009a34:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8009a36:	320c      	adds	r2, #12
 8009a38:	438b      	bics	r3, r1
 8009a3a:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8009a3c:	6901      	ldr	r1, [r0, #16]
 8009a3e:	ca0c      	ldmia	r2, {r2, r3}
 8009a40:	68c0      	ldr	r0, [r0, #12]
 8009a42:	f01b fde5 	bl	8025610 <fn_08025610>
 8009a46:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8009a48:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 8009a4a:	6220      	str	r0, [r4, #32]
 8009a4c:	035b      	lsls	r3, r3, #13
 8009a4e:	d406      	bmi.n	8009a5e <fn_08009A28+0x36>
 8009a50:	2163      	movs	r1, #99	@ 0x63
 8009a52:	0020      	movs	r0, r4
 8009a54:	f010 fc92 	bl	801a37c <fn_0801A37C>
 8009a58:	bc70      	pop	{r4, r5, r6}
 8009a5a:	bc01      	pop	{r0}
 8009a5c:	4700      	bx	r0
 8009a5e:	f7fd f84f 	bl	8006b00 <fn_08006B00>
 8009a62:	0005      	movs	r5, r0
 8009a64:	f7fd f84c 	bl	8006b00 <fn_08006B00>
 8009a68:	6a23      	ldr	r3, [r4, #32]
 8009a6a:	1a28      	subs	r0, r5, r0
 8009a6c:	0540      	lsls	r0, r0, #21
 8009a6e:	181b      	adds	r3, r3, r0
 8009a70:	6223      	str	r3, [r4, #32]
 8009a72:	e7ed      	b.n	8009a50 <fn_08009A28+0x28>
