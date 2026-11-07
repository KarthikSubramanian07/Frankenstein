fn_0800FB6C:
 800fb6c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800fb6e:	46c6      	mov	lr, r8
 800fb70:	4694      	mov	ip, r2
 800fb72:	b500      	push	{lr}
 800fb74:	001f      	movs	r7, r3
 800fb76:	4b1a      	ldr	r3, [pc, #104]	@ (800fbe0 <fn_0800FB6C+0x74>)
 800fb78:	b082      	sub	sp, #8
 800fb7a:	681c      	ldr	r4, [r3, #0]
 800fb7c:	4b19      	ldr	r3, [pc, #100]	@ (800fbe4 <fn_0800FB6C+0x78>)
 800fb7e:	9a08      	ldr	r2, [sp, #32]
 800fb80:	50e0      	str	r0, [r4, r3]
 800fb82:	3308      	adds	r3, #8
 800fb84:	50e2      	str	r2, [r4, r3]
 800fb86:	4662      	mov	r2, ip
 800fb88:	1415      	asrs	r5, r2, #16
 800fb8a:	2280      	movs	r2, #128	@ 0x80
 800fb8c:	0cc9      	lsrs	r1, r1, #19
 800fb8e:	0112      	lsls	r2, r2, #4
 800fb90:	4e15      	ldr	r6, [pc, #84]	@ (800fbe8 <fn_0800FB6C+0x7c>)
 800fb92:	188b      	adds	r3, r1, r2
 800fb94:	009b      	lsls	r3, r3, #2
 800fb96:	58f2      	ldr	r2, [r6, r3]
 800fb98:	436a      	muls	r2, r5
 800fb9a:	68c3      	ldr	r3, [r0, #12]
 800fb9c:	0089      	lsls	r1, r1, #2
 800fb9e:	18d2      	adds	r2, r2, r3
 800fba0:	598b      	ldr	r3, [r1, r6]
 800fba2:	435d      	muls	r5, r3
 800fba4:	6903      	ldr	r3, [r0, #16]
 800fba6:	6b81      	ldr	r1, [r0, #56]	@ 0x38
 800fba8:	18eb      	adds	r3, r5, r3
 800fbaa:	6945      	ldr	r5, [r0, #20]
 800fbac:	1049      	asrs	r1, r1, #1
 800fbae:	1949      	adds	r1, r1, r5
 800fbb0:	2580      	movs	r5, #128	@ 0x80
 800fbb2:	032d      	lsls	r5, r5, #12
 800fbb4:	1949      	adds	r1, r1, r5
 800fbb6:	4d0d      	ldr	r5, [pc, #52]	@ (800fbec <fn_0800FB6C+0x80>)
 800fbb8:	5161      	str	r1, [r4, r5]
 800fbba:	4665      	mov	r5, ip
 800fbbc:	490c      	ldr	r1, [pc, #48]	@ (800fbf0 <fn_0800FB6C+0x84>)
 800fbbe:	5065      	str	r5, [r4, r1]
 800fbc0:	490c      	ldr	r1, [pc, #48]	@ (800fbf4 <fn_0800FB6C+0x88>)
 800fbc2:	5067      	str	r7, [r4, r1]
 800fbc4:	4c0c      	ldr	r4, [pc, #48]	@ (800fbf8 <fn_0800FB6C+0x8c>)
 800fbc6:	300c      	adds	r0, #12
 800fbc8:	c803      	ldmia	r0, {r0, r1}
 800fbca:	9401      	str	r4, [sp, #4]
 800fbcc:	2403      	movs	r4, #3
 800fbce:	9400      	str	r4, [sp, #0]
 800fbd0:	f000 fe60 	bl	8010894 <fn_08010894>
 800fbd4:	b002      	add	sp, #8
 800fbd6:	bc80      	pop	{r7}
 800fbd8:	46b8      	mov	r8, r7
 800fbda:	bcf0      	pop	{r4, r5, r6, r7}
 800fbdc:	bc01      	pop	{r0}
 800fbde:	4700      	bx	r0
 800fbe0:	030064c4 	.word	0x030064c4
 800fbe4:	000008f8 	.word	0x000008f8
 800fbe8:	081398a0 	.word	0x081398a0
 800fbec:	000008fc 	.word	0x000008fc
 800fbf0:	00000904 	.word	0x00000904
 800fbf4:	00000908 	.word	0x00000908
 800fbf8:	0800edcd 	.word	0x0800edcd
