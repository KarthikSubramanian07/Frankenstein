fn_0801AC3C:
 801ac3c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801ac3e:	46c6      	mov	lr, r8
 801ac40:	001f      	movs	r7, r3
 801ac42:	4b31      	ldr	r3, [pc, #196]	@ (801ad08 <fn_0801AC3C+0xcc>)
 801ac44:	781b      	ldrb	r3, [r3, #0]
 801ac46:	0004      	movs	r4, r0
 801ac48:	0016      	movs	r6, r2
 801ac4a:	b500      	push	{lr}
 801ac4c:	2b00      	cmp	r3, #0
 801ac4e:	d11a      	bne.n	801ac86 <fn_0801AC3C+0x4a>
 801ac50:	2800      	cmp	r0, #0
 801ac52:	d018      	beq.n	801ac86 <fn_0801AC3C+0x4a>
 801ac54:	68cb      	ldr	r3, [r1, #12]
 801ac56:	68c0      	ldr	r0, [r0, #12]
 801ac58:	4698      	mov	r8, r3
 801ac5a:	1ac3      	subs	r3, r0, r3
 801ac5c:	690a      	ldr	r2, [r1, #16]
 801ac5e:	17dd      	asrs	r5, r3, #31
 801ac60:	6921      	ldr	r1, [r4, #16]
 801ac62:	195b      	adds	r3, r3, r5
 801ac64:	406b      	eors	r3, r5
 801ac66:	1a8d      	subs	r5, r1, r2
 801ac68:	4694      	mov	ip, r2
 801ac6a:	17ea      	asrs	r2, r5, #31
 801ac6c:	18ad      	adds	r5, r5, r2
 801ac6e:	4055      	eors	r5, r2
 801ac70:	195a      	adds	r2, r3, r5
 801ac72:	42ab      	cmp	r3, r5
 801ac74:	dc0d      	bgt.n	801ac92 <fn_0801AC3C+0x56>
 801ac76:	105b      	asrs	r3, r3, #1
 801ac78:	1ad5      	subs	r5, r2, r3
 801ac7a:	429a      	cmp	r2, r3
 801ac7c:	d00e      	beq.n	801ac9c <fn_0801AC3C+0x60>
 801ac7e:	2396      	movs	r3, #150	@ 0x96
 801ac80:	04db      	lsls	r3, r3, #19
 801ac82:	429d      	cmp	r5, r3
 801ac84:	dd13      	ble.n	801acae <fn_0801AC3C+0x72>
 801ac86:	2000      	movs	r0, #0
 801ac88:	bc80      	pop	{r7}
 801ac8a:	46b8      	mov	r8, r7
 801ac8c:	bcf0      	pop	{r4, r5, r6, r7}
 801ac8e:	bc02      	pop	{r1}
 801ac90:	4708      	bx	r1
 801ac92:	002b      	movs	r3, r5
 801ac94:	105b      	asrs	r3, r3, #1
 801ac96:	1ad5      	subs	r5, r2, r3
 801ac98:	429a      	cmp	r2, r3
 801ac9a:	d1f0      	bne.n	801ac7e <fn_0801AC3C+0x42>
 801ac9c:	4b1b      	ldr	r3, [pc, #108]	@ (801ad0c <fn_0801AC3C+0xd0>)
 801ac9e:	681a      	ldr	r2, [r3, #0]
 801aca0:	4b1b      	ldr	r3, [pc, #108]	@ (801ad10 <fn_0801AC3C+0xd4>)
 801aca2:	58d3      	ldr	r3, [r2, r3]
 801aca4:	17d8      	asrs	r0, r3, #31
 801aca6:	1ac0      	subs	r0, r0, r3
 801aca8:	6033      	str	r3, [r6, #0]
 801acaa:	0fc0      	lsrs	r0, r0, #31
 801acac:	e7ec      	b.n	801ac88 <fn_0801AC3C+0x4c>
 801acae:	4663      	mov	r3, ip
 801acb0:	4642      	mov	r2, r8
 801acb2:	f00a fc55 	bl	8025560 <fn_08025560>
 801acb6:	2300      	movs	r3, #0
 801acb8:	6a22      	ldr	r2, [r4, #32]
 801acba:	4282      	cmp	r2, r0
 801acbc:	415b      	adcs	r3, r3
 801acbe:	1ac0      	subs	r0, r0, r3
 801acc0:	1a80      	subs	r0, r0, r2
 801acc2:	4b14      	ldr	r3, [pc, #80]	@ (801ad14 <fn_0801AC3C+0xd8>)
 801acc4:	0cc0      	lsrs	r0, r0, #19
 801acc6:	0080      	lsls	r0, r0, #2
 801acc8:	58c1      	ldr	r1, [r0, r3]
 801acca:	20c0      	movs	r0, #192	@ 0xc0
 801accc:	03c0      	lsls	r0, r0, #15
 801acce:	f00a fc85 	bl	80255dc <fn_080255DC>
 801acd2:	2380      	movs	r3, #128	@ 0x80
 801acd4:	1400      	asrs	r0, r0, #16
 801acd6:	1a1b      	subs	r3, r3, r0
 801acd8:	603b      	str	r3, [r7, #0]
 801acda:	4b0c      	ldr	r3, [pc, #48]	@ (801ad0c <fn_0801AC3C+0xd0>)
 801acdc:	681a      	ldr	r2, [r3, #0]
 801acde:	4b0c      	ldr	r3, [pc, #48]	@ (801ad10 <fn_0801AC3C+0xd4>)
 801ace0:	58d0      	ldr	r0, [r2, r3]
 801ace2:	4b0d      	ldr	r3, [pc, #52]	@ (801ad18 <fn_0801AC3C+0xdc>)
 801ace4:	429d      	cmp	r5, r3
 801ace6:	dc05      	bgt.n	801acf4 <fn_0801AC3C+0xb8>
 801ace8:	00c3      	lsls	r3, r0, #3
 801acea:	17d8      	asrs	r0, r3, #31
 801acec:	1ac0      	subs	r0, r0, r3
 801acee:	6033      	str	r3, [r6, #0]
 801acf0:	0fc0      	lsrs	r0, r0, #31
 801acf2:	e7c9      	b.n	801ac88 <fn_0801AC3C+0x4c>
 801acf4:	2396      	movs	r3, #150	@ 0x96
 801acf6:	04db      	lsls	r3, r3, #19
 801acf8:	1b5b      	subs	r3, r3, r5
 801acfa:	141b      	asrs	r3, r3, #16
 801acfc:	4358      	muls	r0, r3
 801acfe:	2182      	movs	r1, #130	@ 0x82
 801ad00:	f00a fc46 	bl	8025590 <fn_08025590>
 801ad04:	0003      	movs	r3, r0
 801ad06:	e7f0      	b.n	801acea <fn_0801AC3C+0xae>
 801ad08:	080257f6 	.word	0x080257f6	@ data_080257F6
 801ad0c:	030064c4 	.word	0x030064c4	@ data_030064C4
 801ad10:	00005630 	.word	0x00005630
 801ad14:	081397cc 	.word	0x081397cc	@ data_081397CC
 801ad18:	009fffff 	.word	0x009fffff
