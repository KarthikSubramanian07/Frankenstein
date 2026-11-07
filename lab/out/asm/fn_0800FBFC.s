fn_0800FBFC:
 800fbfc:	b5f0      	push	{r4, r5, r6, r7, lr}
 800fbfe:	4647      	mov	r7, r8
 800fc00:	46ce      	mov	lr, r9
 800fc02:	2192      	movs	r1, #146	@ 0x92
 800fc04:	b580      	push	{r7, lr}
 800fc06:	4f1e      	ldr	r7, [pc, #120]	@ (800fc80 <fn_0800FBFC+0x84>)
 800fc08:	6802      	ldr	r2, [r0, #0]
 800fc0a:	683b      	ldr	r3, [r7, #0]
 800fc0c:	0109      	lsls	r1, r1, #4
 800fc0e:	6910      	ldr	r0, [r2, #16]
 800fc10:	68d6      	ldr	r6, [r2, #12]
 800fc12:	b083      	sub	sp, #12
 800fc14:	505a      	str	r2, [r3, r1]
 800fc16:	6a13      	ldr	r3, [r2, #32]
 800fc18:	2280      	movs	r2, #128	@ 0x80
 800fc1a:	0cdb      	lsrs	r3, r3, #19
 800fc1c:	0112      	lsls	r2, r2, #4
 800fc1e:	4919      	ldr	r1, [pc, #100]	@ (800fc84 <fn_0800FBFC+0x88>)
 800fc20:	189a      	adds	r2, r3, r2
 800fc22:	0092      	lsls	r2, r2, #2
 800fc24:	588c      	ldr	r4, [r1, r2]
 800fc26:	01a4      	lsls	r4, r4, #6
 800fc28:	19a2      	adds	r2, r4, r6
 800fc2a:	2401      	movs	r4, #1
 800fc2c:	009b      	lsls	r3, r3, #2
 800fc2e:	585d      	ldr	r5, [r3, r1]
 800fc30:	4b15      	ldr	r3, [pc, #84]	@ (800fc88 <fn_0800FBFC+0x8c>)
 800fc32:	01ad      	lsls	r5, r5, #6
 800fc34:	182d      	adds	r5, r5, r0
 800fc36:	4680      	mov	r8, r0
 800fc38:	0001      	movs	r1, r0
 800fc3a:	9301      	str	r3, [sp, #4]
 800fc3c:	0030      	movs	r0, r6
 800fc3e:	002b      	movs	r3, r5
 800fc40:	9400      	str	r4, [sp, #0]
 800fc42:	4691      	mov	r9, r2
 800fc44:	f000 fe26 	bl	8010894 <fn_08010894>
 800fc48:	2800      	cmp	r0, #0
 800fc4a:	d106      	bne.n	800fc5a <fn_0800FBFC+0x5e>
 800fc4c:	b003      	add	sp, #12
 800fc4e:	bcc0      	pop	{r6, r7}
 800fc50:	46b9      	mov	r9, r7
 800fc52:	46b0      	mov	r8, r6
 800fc54:	bcf0      	pop	{r4, r5, r6, r7}
 800fc56:	bc01      	pop	{r0}
 800fc58:	4700      	bx	r0
 800fc5a:	4b0c      	ldr	r3, [pc, #48]	@ (800fc8c <fn_0800FBFC+0x90>)
 800fc5c:	464a      	mov	r2, r9
 800fc5e:	9301      	str	r3, [sp, #4]
 800fc60:	4641      	mov	r1, r8
 800fc62:	002b      	movs	r3, r5
 800fc64:	0030      	movs	r0, r6
 800fc66:	9400      	str	r4, [sp, #0]
 800fc68:	f000 fe14 	bl	8010894 <fn_08010894>
 800fc6c:	2800      	cmp	r0, #0
 800fc6e:	d1ed      	bne.n	800fc4c <fn_0800FBFC+0x50>
 800fc70:	2292      	movs	r2, #146	@ 0x92
 800fc72:	683b      	ldr	r3, [r7, #0]
 800fc74:	0112      	lsls	r2, r2, #4
 800fc76:	2151      	movs	r1, #81	@ 0x51
 800fc78:	5898      	ldr	r0, [r3, r2]
 800fc7a:	f00a fb25 	bl	801a2c8 <fn_0801A2C8>
 800fc7e:	e7e5      	b.n	800fc4c <fn_0800FBFC+0x50>
 800fc80:	030064c4 	.word	0x030064c4	@ data_030064C4
 800fc84:	081397cc 	.word	0x081397cc	@ data_081397CC
 800fc88:	0800e729 	.word	0x0800e729	@ fn_0800E728
 800fc8c:	0800e5f9 	.word	0x0800e5f9	@ fn_0800E5F8
