fn_0800FAB8:
 800fab8:	b5f0      	push	{r4, r5, r6, r7, lr}
 800faba:	0015      	movs	r5, r2
 800fabc:	4c21      	ldr	r4, [pc, #132]	@ (800fb44 <fn_0800FAB8+0x8c>)
 800fabe:	4a22      	ldr	r2, [pc, #136]	@ (800fb48 <fn_0800FAB8+0x90>)
 800fac0:	6823      	ldr	r3, [r4, #0]
 800fac2:	b083      	sub	sp, #12
 800fac4:	5098      	str	r0, [r3, r2]
 800fac6:	142a      	asrs	r2, r5, #16
 800fac8:	4694      	mov	ip, r2
 800faca:	2280      	movs	r2, #128	@ 0x80
 800facc:	0cc9      	lsrs	r1, r1, #19
 800face:	0112      	lsls	r2, r2, #4
 800fad0:	4e1e      	ldr	r6, [pc, #120]	@ (800fb4c <fn_0800FAB8+0x94>)
 800fad2:	188a      	adds	r2, r1, r2
 800fad4:	0092      	lsls	r2, r2, #2
 800fad6:	58b2      	ldr	r2, [r6, r2]
 800fad8:	0089      	lsls	r1, r1, #2
 800fada:	5989      	ldr	r1, [r1, r6]
 800fadc:	0017      	movs	r7, r2
 800fade:	000e      	movs	r6, r1
 800fae0:	4662      	mov	r2, ip
 800fae2:	437a      	muls	r2, r7
 800fae4:	4661      	mov	r1, ip
 800fae6:	4371      	muls	r1, r6
 800fae8:	68c7      	ldr	r7, [r0, #12]
 800faea:	19d2      	adds	r2, r2, r7
 800faec:	6907      	ldr	r7, [r0, #16]
 800faee:	19cf      	adds	r7, r1, r7
 800faf0:	6b81      	ldr	r1, [r0, #56]	@ 0x38
 800faf2:	6946      	ldr	r6, [r0, #20]
 800faf4:	1049      	asrs	r1, r1, #1
 800faf6:	1989      	adds	r1, r1, r6
 800faf8:	2680      	movs	r6, #128	@ 0x80
 800fafa:	0336      	lsls	r6, r6, #12
 800fafc:	1989      	adds	r1, r1, r6
 800fafe:	4e14      	ldr	r6, [pc, #80]	@ (800fb50 <fn_0800FAB8+0x98>)
 800fb00:	5199      	str	r1, [r3, r6]
 800fb02:	26a0      	movs	r6, #160	@ 0xa0
 800fb04:	4913      	ldr	r1, [pc, #76]	@ (800fb54 <fn_0800FAB8+0x9c>)
 800fb06:	0236      	lsls	r6, r6, #8
 800fb08:	505e      	str	r6, [r3, r1]
 800fb0a:	4e13      	ldr	r6, [pc, #76]	@ (800fb58 <fn_0800FAB8+0xa0>)
 800fb0c:	3104      	adds	r1, #4
 800fb0e:	505e      	str	r6, [r3, r1]
 800fb10:	4912      	ldr	r1, [pc, #72]	@ (800fb5c <fn_0800FAB8+0xa4>)
 800fb12:	505d      	str	r5, [r3, r1]
 800fb14:	2100      	movs	r1, #0
 800fb16:	4d12      	ldr	r5, [pc, #72]	@ (800fb60 <fn_0800FAB8+0xa8>)
 800fb18:	5159      	str	r1, [r3, r5]
 800fb1a:	4b12      	ldr	r3, [pc, #72]	@ (800fb64 <fn_0800FAB8+0xac>)
 800fb1c:	300c      	adds	r0, #12
 800fb1e:	c803      	ldmia	r0, {r0, r1}
 800fb20:	9301      	str	r3, [sp, #4]
 800fb22:	2303      	movs	r3, #3
 800fb24:	9300      	str	r3, [sp, #0]
 800fb26:	003b      	movs	r3, r7
 800fb28:	f000 feb4 	bl	8010894 <fn_08010894>
 800fb2c:	6823      	ldr	r3, [r4, #0]
 800fb2e:	595a      	ldr	r2, [r3, r5]
 800fb30:	2000      	movs	r0, #0
 800fb32:	2a00      	cmp	r2, #0
 800fb34:	d001      	beq.n	800fb3a <fn_0800FAB8+0x82>
 800fb36:	4a0c      	ldr	r2, [pc, #48]	@ (800fb68 <fn_0800FAB8+0xb0>)
 800fb38:	5898      	ldr	r0, [r3, r2]
 800fb3a:	b003      	add	sp, #12
 800fb3c:	bcf0      	pop	{r4, r5, r6, r7}
 800fb3e:	bc02      	pop	{r1}
 800fb40:	4708      	bx	r1
 800fb42:	46c0      	nop			@ (mov r8, r8)
 800fb44:	030064c4 	.word	0x030064c4
 800fb48:	000008f8 	.word	0x000008f8
 800fb4c:	081398a0 	.word	0x081398a0
 800fb50:	000008fc 	.word	0x000008fc
 800fb54:	0000090c 	.word	0x0000090c
 800fb58:	ffff6000 	.word	0xffff6000
 800fb5c:	00000904 	.word	0x00000904
 800fb60:	000008f4 	.word	0x000008f4
 800fb64:	0800eba9 	.word	0x0800eba9
 800fb68:	00000908 	.word	0x00000908
