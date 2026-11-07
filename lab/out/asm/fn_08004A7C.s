fn_08004A7C:
 8004a7c:	b510      	push	{r4, lr}
 8004a7e:	4c10      	ldr	r4, [pc, #64]	@ (8004ac0 <fn_08004A7C+0x44>)
 8004a80:	6820      	ldr	r0, [r4, #0]
 8004a82:	7803      	ldrb	r3, [r0, #0]
 8004a84:	07db      	lsls	r3, r3, #31
 8004a86:	d413      	bmi.n	8004ab0 <fn_08004A7C+0x34>
 8004a88:	23e7      	movs	r3, #231	@ 0xe7
 8004a8a:	009b      	lsls	r3, r3, #2
 8004a8c:	18c0      	adds	r0, r0, r3
 8004a8e:	f7ff ff31 	bl	80048f4 <fn_080048F4>
 8004a92:	23d8      	movs	r3, #216	@ 0xd8
 8004a94:	6820      	ldr	r0, [r4, #0]
 8004a96:	009b      	lsls	r3, r3, #2
 8004a98:	18c0      	adds	r0, r0, r3
 8004a9a:	f7ff fe77 	bl	800478c <fn_0800478C>
 8004a9e:	23e7      	movs	r3, #231	@ 0xe7
 8004aa0:	6820      	ldr	r0, [r4, #0]
 8004aa2:	009b      	lsls	r3, r3, #2
 8004aa4:	18c0      	adds	r0, r0, r3
 8004aa6:	f7ff ff09 	bl	80048bc <fn_080048BC>
 8004aaa:	bc10      	pop	{r4}
 8004aac:	bc01      	pop	{r0}
 8004aae:	4700      	bx	r0
 8004ab0:	23d8      	movs	r3, #216	@ 0xd8
 8004ab2:	009b      	lsls	r3, r3, #2
 8004ab4:	18c0      	adds	r0, r0, r3
 8004ab6:	f7ff fe07 	bl	80046c8 <fn_080046C8>
 8004aba:	6820      	ldr	r0, [r4, #0]
 8004abc:	e7e4      	b.n	8004a88 <fn_08004A7C+0xc>
 8004abe:	46c0      	nop			@ (mov r8, r8)
 8004ac0:	030064c4 	.word	0x030064c4
