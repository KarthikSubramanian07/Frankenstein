fn_08011EDC:
 8011edc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8011ede:	46c6      	mov	lr, r8
 8011ee0:	b500      	push	{lr}
 8011ee2:	0015      	movs	r5, r2
 8011ee4:	000f      	movs	r7, r1
 8011ee6:	001c      	movs	r4, r3
 8011ee8:	4680      	mov	r8, r0
 8011eea:	f7f4 fe09 	bl	8006b00 <fn_08006B00>
 8011eee:	0006      	movs	r6, r0
 8011ef0:	f7f4 fe06 	bl	8006b00 <fn_08006B00>
 8011ef4:	1a32      	subs	r2, r6, r0
 8011ef6:	0292      	lsls	r2, r2, #10
 8011ef8:	1952      	adds	r2, r2, r5
 8011efa:	2326      	movs	r3, #38	@ 0x26
 8011efc:	0039      	movs	r1, r7
 8011efe:	4640      	mov	r0, r8
 8011f00:	f7fe ff74 	bl	8010dec <fn_08010DEC>
 8011f04:	2380      	movs	r3, #128	@ 0x80
 8011f06:	029b      	lsls	r3, r3, #10
 8011f08:	6443      	str	r3, [r0, #68]	@ 0x44
 8011f0a:	0005      	movs	r5, r0
 8011f0c:	f7f4 fdf8 	bl	8006b00 <fn_08006B00>
 8011f10:	2303      	movs	r3, #3
 8011f12:	2256      	movs	r2, #86	@ 0x56
 8011f14:	4003      	ands	r3, r0
 8011f16:	5aa8      	ldrh	r0, [r5, r2]
 8011f18:	1ac0      	subs	r0, r0, r3
 8011f1a:	1c03      	adds	r3, r0, #0
 8011f1c:	0400      	lsls	r0, r0, #16
 8011f1e:	1400      	asrs	r0, r0, #16
 8011f20:	2800      	cmp	r0, #0
 8011f22:	dc00      	bgt.n	8011f26 <fn_08011EDC+0x4a>
 8011f24:	2301      	movs	r3, #1
 8011f26:	2256      	movs	r2, #86	@ 0x56
 8011f28:	52ab      	strh	r3, [r5, r2]
 8011f2a:	0023      	movs	r3, r4
 8011f2c:	3b09      	subs	r3, #9
 8011f2e:	2b03      	cmp	r3, #3
 8011f30:	d90b      	bls.n	8011f4a <fn_08011EDC+0x6e>
 8011f32:	2c08      	cmp	r4, #8
 8011f34:	dd04      	ble.n	8011f40 <fn_08011EDC+0x64>
 8011f36:	bc80      	pop	{r7}
 8011f38:	46b8      	mov	r8, r7
 8011f3a:	bcf0      	pop	{r4, r5, r6, r7}
 8011f3c:	bc01      	pop	{r0}
 8011f3e:	4700      	bx	r0
 8011f40:	215c      	movs	r1, #92	@ 0x5c
 8011f42:	0028      	movs	r0, r5
 8011f44:	f7ff f962 	bl	801120c <fn_0801120C>
 8011f48:	e7f5      	b.n	8011f36 <fn_08011EDC+0x5a>
 8011f4a:	215b      	movs	r1, #91	@ 0x5b
 8011f4c:	0028      	movs	r0, r5
 8011f4e:	f7ff f95d 	bl	801120c <fn_0801120C>
 8011f52:	e7f0      	b.n	8011f36 <fn_08011EDC+0x5a>
