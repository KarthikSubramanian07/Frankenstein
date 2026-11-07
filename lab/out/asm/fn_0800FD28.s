fn_0800FD28:
 800fd28:	b5f0      	push	{r4, r5, r6, r7, lr}
 800fd2a:	46d6      	mov	lr, sl
 800fd2c:	464f      	mov	r7, r9
 800fd2e:	4646      	mov	r6, r8
 800fd30:	b5c0      	push	{r6, r7, lr}
 800fd32:	b084      	sub	sp, #16
 800fd34:	000c      	movs	r4, r1
 800fd36:	4669      	mov	r1, sp
 800fd38:	f000 faec 	bl	8010314 <fn_08010314>
 800fd3c:	4b22      	ldr	r3, [pc, #136]	@ (800fdc8 <fn_0800FD28+0xa0>)
 800fd3e:	6818      	ldr	r0, [r3, #0]
 800fd40:	469a      	mov	sl, r3
 800fd42:	4b22      	ldr	r3, [pc, #136]	@ (800fdcc <fn_0800FD28+0xa4>)
 800fd44:	9d02      	ldr	r5, [sp, #8]
 800fd46:	58c3      	ldr	r3, [r0, r3]
 800fd48:	4a21      	ldr	r2, [pc, #132]	@ (800fdd0 <fn_0800FD28+0xa8>)
 800fd4a:	1aed      	subs	r5, r5, r3
 800fd4c:	18ad      	adds	r5, r5, r2
 800fd4e:	9a03      	ldr	r2, [sp, #12]
 800fd50:	1ad2      	subs	r2, r2, r3
 800fd52:	2380      	movs	r3, #128	@ 0x80
 800fd54:	2700      	movs	r7, #0
 800fd56:	039b      	lsls	r3, r3, #14
 800fd58:	4e1e      	ldr	r6, [pc, #120]	@ (800fdd4 <fn_0800FD28+0xac>)
 800fd5a:	18d2      	adds	r2, r2, r3
 800fd5c:	4b1e      	ldr	r3, [pc, #120]	@ (800fdd8 <fn_0800FD28+0xb0>)
 800fd5e:	58c3      	ldr	r3, [r0, r3]
 800fd60:	5587      	strb	r7, [r0, r6]
 800fd62:	4e1e      	ldr	r6, [pc, #120]	@ (800fddc <fn_0800FD28+0xb4>)
 800fd64:	469c      	mov	ip, r3
 800fd66:	5584      	strb	r4, [r0, r6]
 800fd68:	9901      	ldr	r1, [sp, #4]
 800fd6a:	2000      	movs	r0, #0
 800fd6c:	9b00      	ldr	r3, [sp, #0]
 800fd6e:	15ed      	asrs	r5, r5, #23
 800fd70:	15d2      	asrs	r2, r2, #23
 800fd72:	4295      	cmp	r5, r2
 800fd74:	dc20      	bgt.n	800fdb8 <fn_0800FD28+0x90>
 800fd76:	4660      	mov	r0, ip
 800fd78:	1a1e      	subs	r6, r3, r0
 800fd7a:	2380      	movs	r3, #128	@ 0x80
 800fd7c:	1a0f      	subs	r7, r1, r0
 800fd7e:	4914      	ldr	r1, [pc, #80]	@ (800fdd0 <fn_0800FD28+0xa8>)
 800fd80:	039b      	lsls	r3, r3, #14
 800fd82:	187f      	adds	r7, r7, r1
 800fd84:	15f9      	asrs	r1, r7, #23
 800fd86:	18f6      	adds	r6, r6, r3
 800fd88:	4688      	mov	r8, r1
 800fd8a:	15f6      	asrs	r6, r6, #23
 800fd8c:	42b1      	cmp	r1, r6
 800fd8e:	dc0f      	bgt.n	800fdb0 <fn_0800FD28+0x88>
 800fd90:	1c53      	adds	r3, r2, #1
 800fd92:	4699      	mov	r9, r3
 800fd94:	4f12      	ldr	r7, [pc, #72]	@ (800fde0 <fn_0800FD28+0xb8>)
 800fd96:	3601      	adds	r6, #1
 800fd98:	4644      	mov	r4, r8
 800fd9a:	0021      	movs	r1, r4
 800fd9c:	003a      	movs	r2, r7
 800fd9e:	0028      	movs	r0, r5
 800fda0:	3401      	adds	r4, #1
 800fda2:	f000 faef 	bl	8010384 <fn_08010384>
 800fda6:	42a6      	cmp	r6, r4
 800fda8:	d1f7      	bne.n	800fd9a <fn_0800FD28+0x72>
 800fdaa:	3501      	adds	r5, #1
 800fdac:	454d      	cmp	r5, r9
 800fdae:	d1f3      	bne.n	800fd98 <fn_0800FD28+0x70>
 800fdb0:	4653      	mov	r3, sl
 800fdb2:	681a      	ldr	r2, [r3, #0]
 800fdb4:	4b07      	ldr	r3, [pc, #28]	@ (800fdd4 <fn_0800FD28+0xac>)
 800fdb6:	5cd0      	ldrb	r0, [r2, r3]
 800fdb8:	b004      	add	sp, #16
 800fdba:	bce0      	pop	{r5, r6, r7}
 800fdbc:	46ba      	mov	sl, r7
 800fdbe:	46b1      	mov	r9, r6
 800fdc0:	46a8      	mov	r8, r5
 800fdc2:	bcf0      	pop	{r4, r5, r6, r7}
 800fdc4:	bc02      	pop	{r1}
 800fdc6:	4708      	bx	r1
 800fdc8:	030064c4 	.word	0x030064c4	@ data_030064C4
 800fdcc:	00000e28 	.word	0x00000e28
 800fdd0:	ffe00000 	.word	0xffe00000
 800fdd4:	00000927 	.word	0x00000927
 800fdd8:	00000e2c 	.word	0x00000e2c
 800fddc:	00000926 	.word	0x00000926
 800fde0:	0800f599 	.word	0x0800f599	@ fn_0800F598
