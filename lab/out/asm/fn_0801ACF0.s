fn_0801ACF0:
 801acf0:	b5f0      	push	{r4, r5, r6, r7, lr}
 801acf2:	46c6      	mov	lr, r8
 801acf4:	001f      	movs	r7, r3
 801acf6:	4b31      	ldr	r3, [pc, #196]	@ (801adbc <fn_0801ACF0+0xcc>)
 801acf8:	781b      	ldrb	r3, [r3, #0]
 801acfa:	0004      	movs	r4, r0
 801acfc:	0016      	movs	r6, r2
 801acfe:	b500      	push	{lr}
 801ad00:	2b00      	cmp	r3, #0
 801ad02:	d11a      	bne.n	801ad3a <fn_0801ACF0+0x4a>
 801ad04:	2800      	cmp	r0, #0
 801ad06:	d018      	beq.n	801ad3a <fn_0801ACF0+0x4a>
 801ad08:	68cb      	ldr	r3, [r1, #12]
 801ad0a:	68c0      	ldr	r0, [r0, #12]
 801ad0c:	4698      	mov	r8, r3
 801ad0e:	1ac3      	subs	r3, r0, r3
 801ad10:	690a      	ldr	r2, [r1, #16]
 801ad12:	17dd      	asrs	r5, r3, #31
 801ad14:	6921      	ldr	r1, [r4, #16]
 801ad16:	195b      	adds	r3, r3, r5
 801ad18:	406b      	eors	r3, r5
 801ad1a:	1a8d      	subs	r5, r1, r2
 801ad1c:	4694      	mov	ip, r2
 801ad1e:	17ea      	asrs	r2, r5, #31
 801ad20:	18ad      	adds	r5, r5, r2
 801ad22:	4055      	eors	r5, r2
 801ad24:	195a      	adds	r2, r3, r5
 801ad26:	42ab      	cmp	r3, r5
 801ad28:	dc0d      	bgt.n	801ad46 <fn_0801ACF0+0x56>
 801ad2a:	105b      	asrs	r3, r3, #1
 801ad2c:	1ad5      	subs	r5, r2, r3
 801ad2e:	429a      	cmp	r2, r3
 801ad30:	d00e      	beq.n	801ad50 <fn_0801ACF0+0x60>
 801ad32:	2396      	movs	r3, #150	@ 0x96
 801ad34:	04db      	lsls	r3, r3, #19
 801ad36:	429d      	cmp	r5, r3
 801ad38:	dd13      	ble.n	801ad62 <fn_0801ACF0+0x72>
 801ad3a:	2000      	movs	r0, #0
 801ad3c:	bc80      	pop	{r7}
 801ad3e:	46b8      	mov	r8, r7
 801ad40:	bcf0      	pop	{r4, r5, r6, r7}
 801ad42:	bc02      	pop	{r1}
 801ad44:	4708      	bx	r1
 801ad46:	002b      	movs	r3, r5
 801ad48:	105b      	asrs	r3, r3, #1
 801ad4a:	1ad5      	subs	r5, r2, r3
 801ad4c:	429a      	cmp	r2, r3
 801ad4e:	d1f0      	bne.n	801ad32 <fn_0801ACF0+0x42>
 801ad50:	4b1b      	ldr	r3, [pc, #108]	@ (801adc0 <fn_0801ACF0+0xd0>)
 801ad52:	681a      	ldr	r2, [r3, #0]
 801ad54:	4b1b      	ldr	r3, [pc, #108]	@ (801adc4 <fn_0801ACF0+0xd4>)
 801ad56:	58d3      	ldr	r3, [r2, r3]
 801ad58:	17d8      	asrs	r0, r3, #31
 801ad5a:	1ac0      	subs	r0, r0, r3
 801ad5c:	6033      	str	r3, [r6, #0]
 801ad5e:	0fc0      	lsrs	r0, r0, #31
 801ad60:	e7ec      	b.n	801ad3c <fn_0801ACF0+0x4c>
 801ad62:	4663      	mov	r3, ip
 801ad64:	4642      	mov	r2, r8
 801ad66:	f00a fc53 	bl	8025610 <fn_08025610>
 801ad6a:	2300      	movs	r3, #0
 801ad6c:	6a22      	ldr	r2, [r4, #32]
 801ad6e:	4282      	cmp	r2, r0
 801ad70:	415b      	adcs	r3, r3
 801ad72:	1ac0      	subs	r0, r0, r3
 801ad74:	1a80      	subs	r0, r0, r2
 801ad76:	4b14      	ldr	r3, [pc, #80]	@ (801adc8 <fn_0801ACF0+0xd8>)
 801ad78:	0cc0      	lsrs	r0, r0, #19
 801ad7a:	0080      	lsls	r0, r0, #2
 801ad7c:	58c1      	ldr	r1, [r0, r3]
 801ad7e:	20c0      	movs	r0, #192	@ 0xc0
 801ad80:	03c0      	lsls	r0, r0, #15
 801ad82:	f00a fc83 	bl	802568c <fn_0802568C>
 801ad86:	2380      	movs	r3, #128	@ 0x80
 801ad88:	1400      	asrs	r0, r0, #16
 801ad8a:	1a1b      	subs	r3, r3, r0
 801ad8c:	603b      	str	r3, [r7, #0]
 801ad8e:	4b0c      	ldr	r3, [pc, #48]	@ (801adc0 <fn_0801ACF0+0xd0>)
 801ad90:	681a      	ldr	r2, [r3, #0]
 801ad92:	4b0c      	ldr	r3, [pc, #48]	@ (801adc4 <fn_0801ACF0+0xd4>)
 801ad94:	58d0      	ldr	r0, [r2, r3]
 801ad96:	4b0d      	ldr	r3, [pc, #52]	@ (801adcc <fn_0801ACF0+0xdc>)
 801ad98:	429d      	cmp	r5, r3
 801ad9a:	dc05      	bgt.n	801ada8 <fn_0801ACF0+0xb8>
 801ad9c:	00c3      	lsls	r3, r0, #3
 801ad9e:	17d8      	asrs	r0, r3, #31
 801ada0:	1ac0      	subs	r0, r0, r3
 801ada2:	6033      	str	r3, [r6, #0]
 801ada4:	0fc0      	lsrs	r0, r0, #31
 801ada6:	e7c9      	b.n	801ad3c <fn_0801ACF0+0x4c>
 801ada8:	2396      	movs	r3, #150	@ 0x96
 801adaa:	04db      	lsls	r3, r3, #19
 801adac:	1b5b      	subs	r3, r3, r5
 801adae:	141b      	asrs	r3, r3, #16
 801adb0:	4358      	muls	r0, r3
 801adb2:	2182      	movs	r1, #130	@ 0x82
 801adb4:	f00a fc44 	bl	8025640 <fn_08025640>
 801adb8:	0003      	movs	r3, r0
 801adba:	e7f0      	b.n	801ad9e <fn_0801ACF0+0xae>
 801adbc:	080258a6 	.word	0x080258a6
 801adc0:	030064c4 	.word	0x030064c4
 801adc4:	00005630 	.word	0x00005630
 801adc8:	081398a0 	.word	0x081398a0
 801adcc:	009fffff 	.word	0x009fffff
