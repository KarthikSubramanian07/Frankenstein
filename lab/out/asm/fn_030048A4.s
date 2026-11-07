fn_030048A4:
 30048a4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 30048a8:	e210b902 	ands	fp, r0, #32768	@ 0x8000
 30048ac:	e24dd08c 	sub	sp, sp, #140	@ 0x8c
 30048b0:	1a0000bb 	bne	3004ba4 <fn_030048A4+0x300>
 30048b4:	e59fe300 	ldr	lr, [pc, #768]	@ 3004bbc <fn_030048A4+0x318>
 30048b8:	e59e2114 	ldr	r2, [lr, #276]	@ 0x114
 30048bc:	e0603180 	rsb	r3, r0, r0, lsl #3
 30048c0:	e0821103 	add	r1, r2, r3, lsl #2
 30048c4:	e1a03103 	lsl	r3, r3, #2
 30048c8:	e192c0f3 	ldrsh	ip, [r2, r3]
 30048cc:	e1d120f2 	ldrsh	r2, [r1, #2]
 30048d0:	e59e3010 	ldr	r3, [lr, #16]
 30048d4:	e0433802 	sub	r3, r3, r2, lsl #16
 30048d8:	e1d120f4 	ldrsh	r2, [r1, #4]
 30048dc:	e1a04002 	mov	r4, r2
 30048e0:	e0c23394 	smull	r3, r2, r4, r3
 30048e4:	e1a03823 	lsr	r3, r3, #16
 30048e8:	e1833802 	orr	r3, r3, r2, lsl #16
 30048ec:	e59e200c 	ldr	r2, [lr, #12]
 30048f0:	e042280c 	sub	r2, r2, ip, lsl #16
 30048f4:	e1d1c0f6 	ldrsh	ip, [r1, #6]
 30048f8:	e1a0e00c 	mov	lr, ip
 30048fc:	e0cc229e 	smull	r2, ip, lr, r2
 3004900:	e1a02822 	lsr	r2, r2, #16
 3004904:	e182280c 	orr	r2, r2, ip, lsl #16
 3004908:	e1530002 	cmp	r3, r2
 300490c:	b3a03000 	movlt	r3, #0
 3004910:	a3a03001 	movge	r3, #1
 3004914:	e1830080 	orr	r0, r3, r0, lsl #1
 3004918:	e0811083 	add	r1, r1, r3, lsl #1
 300491c:	e08d308b 	add	r3, sp, fp, lsl #1
 3004920:	e1c300b8 	strh	r0, [r3, #8]
 3004924:	e1d101b8 	ldrh	r0, [r1, #24]
 3004928:	e3100902 	tst	r0, #32768	@ 0x8000
 300492c:	e28bb001 	add	fp, fp, #1
 3004930:	1a000062 	bne	3004ac0 <fn_030048A4+0x21c>
 3004934:	e35b0040 	cmp	fp, #64	@ 0x40
 3004938:	1affffdd 	bne	30048b4 <fn_030048A4+0x10>
 300493c:	e24bb001 	sub	fp, fp, #1
 3004940:	e08d308b 	add	r3, sp, fp, lsl #1
 3004944:	e1d350b8 	ldrh	r5, [r3, #8]
 3004948:	e59f326c 	ldr	r3, [pc, #620]	@ 3004bbc <fn_030048A4+0x318>
 300494c:	e5931114 	ldr	r1, [r3, #276]	@ 0x114
 3004950:	e593a00c 	ldr	sl, [r3, #12]
 3004954:	e5939010 	ldr	r9, [r3, #16]
 3004958:	e5933008 	ldr	r3, [r3, #8]
 300495c:	e2057001 	and	r7, r5, #1
 3004960:	e1a050a5 	lsr	r5, r5, #1
 3004964:	e0655185 	rsb	r5, r5, r5, lsl #3
 3004968:	e58d3000 	str	r3, [sp]
 300496c:	e58d1004 	str	r1, [sp, #4]
 3004970:	e0815105 	add	r5, r1, r5, lsl #2
 3004974:	e2277001 	eor	r7, r7, #1
 3004978:	e2874001 	add	r4, r7, #1
 300497c:	e0854184 	add	r4, r5, r4, lsl #3
 3004980:	e1d430f4 	ldrsh	r3, [r4, #4]
 3004984:	e15a0803 	cmp	sl, r3, lsl #16
 3004988:	da00005f 	ble	3004b0c <fn_030048A4+0x268>
 300498c:	e1d430f6 	ldrsh	r3, [r4, #6]
 3004990:	e15a0803 	cmp	sl, r3, lsl #16
 3004994:	b3a03004 	movlt	r3, #4
 3004998:	a3a03008 	movge	r3, #8
 300499c:	b3a01024 	movlt	r1, #36	@ 0x24
 30049a0:	a3a01028 	movge	r1, #40	@ 0x28
 30049a4:	b3a0c014 	movlt	ip, #20
 30049a8:	a3a0c018 	movge	ip, #24
 30049ac:	b3a00005 	movlt	r0, #5
 30049b0:	a3a00006 	movge	r0, #6
 30049b4:	e1d420f0 	ldrsh	r2, [r4]
 30049b8:	e1590802 	cmp	r9, r2, lsl #16
 30049bc:	aa000005 	bge	30049d8 <fn_030048A4+0x134>
 30049c0:	e1d430f2 	ldrsh	r3, [r4, #2]
 30049c4:	e1590803 	cmp	r9, r3, lsl #16
 30049c8:	da000067 	ble	3004b6c <fn_030048A4+0x2c8>
 30049cc:	e3500005 	cmp	r0, #5
 30049d0:	0a000036 	beq	3004ab0 <fn_030048A4+0x20c>
 30049d4:	e1a0300c 	mov	r3, ip
 30049d8:	e59f21e0 	ldr	r2, [pc, #480]	@ 3004bc0 <fn_030048A4+0x31c>
 30049dc:	e0828003 	add	r8, r2, r3
 30049e0:	e7d23003 	ldrb	r3, [r2, r3]
 30049e4:	e1a03083 	lsl	r3, r3, #1
 30049e8:	e19420f3 	ldrsh	r2, [r4, r3]
 30049ec:	e5d83001 	ldrb	r3, [r8, #1]
 30049f0:	e1a03083 	lsl	r3, r3, #1
 30049f4:	e19430f3 	ldrsh	r3, [r4, r3]
 30049f8:	e1a01009 	mov	r1, r9
 30049fc:	e1a02802 	lsl	r2, r2, #16
 3004a00:	e1a03803 	lsl	r3, r3, #16
 3004a04:	e1a0000a 	mov	r0, sl
 3004a08:	ebfff753 	bl	300275c <fn_0300275C>
 3004a0c:	e59d3000 	ldr	r3, [sp]
 3004a10:	e5d82002 	ldrb	r2, [r8, #2]
 3004a14:	e0406003 	sub	r6, r0, r3
 3004a18:	e5d83003 	ldrb	r3, [r8, #3]
 3004a1c:	e1a02082 	lsl	r2, r2, #1
 3004a20:	e1a03083 	lsl	r3, r3, #1
 3004a24:	e19430f3 	ldrsh	r3, [r4, r3]
 3004a28:	e19420f2 	ldrsh	r2, [r4, r2]
 3004a2c:	e1a03803 	lsl	r3, r3, #16
 3004a30:	e1a01009 	mov	r1, r9
 3004a34:	e1a0000a 	mov	r0, sl
 3004a38:	e1a02802 	lsl	r2, r2, #16
 3004a3c:	ebfff746 	bl	300275c <fn_0300275C>
 3004a40:	e59d3000 	ldr	r3, [sp]
 3004a44:	e0400003 	sub	r0, r0, r3
 3004a48:	e1560000 	cmp	r6, r0
 3004a4c:	aa000033 	bge	3004b20 <fn_030048A4+0x27c>
 3004a50:	e2863102 	add	r3, r6, #-2147483648	@ 0x80000000
 3004a54:	e3730107 	cmn	r3, #-1073741823	@ 0xc0000001
 3004a58:	9a000045 	bls	3004b74 <fn_030048A4+0x2d0>
 3004a5c:	e59f3160 	ldr	r3, [pc, #352]	@ 3004bc4 <fn_030048A4+0x320>
 3004a60:	e1560003 	cmp	r6, r3
 3004a64:	ba00001c 	blt	3004adc <fn_030048A4+0x238>
 3004a68:	e59f3158 	ldr	r3, [pc, #344]	@ 3004bc8 <fn_030048A4+0x324>
 3004a6c:	e1560003 	cmp	r6, r3
 3004a70:	ca000048 	bgt	3004b98 <fn_030048A4+0x2f4>
 3004a74:	e2866101 	add	r6, r6, #1073741824	@ 0x40000000
 3004a78:	e59f314c 	ldr	r3, [pc, #332]	@ 3004bcc <fn_030048A4+0x328>
 3004a7c:	e1a069a6 	lsr	r6, r6, #19
 3004a80:	e59f2148 	ldr	r2, [pc, #328]	@ 3004bd0 <fn_030048A4+0x32c>
 3004a84:	e7920106 	ldr	r0, [r2, r6, lsl #2]
 3004a88:	e7922103 	ldr	r2, [r2, r3, lsl #2]
 3004a8c:	e1500002 	cmp	r0, r2
 3004a90:	0a000011 	beq	3004adc <fn_030048A4+0x238>
 3004a94:	e59f3138 	ldr	r3, [pc, #312]	@ 3004bd4 <fn_030048A4+0x330>
 3004a98:	e0422000 	sub	r2, r2, r0
 3004a9c:	e3a01000 	mov	r1, #0
 3004aa0:	e0830000 	add	r0, r3, r0
 3004aa4:	ebfff0c4 	bl	3000dbc <fn_03000DBC>
 3004aa8:	e3500000 	cmp	r0, #0
 3004aac:	0a00000a 	beq	3004adc <fn_030048A4+0x238>
 3004ab0:	e0855087 	add	r5, r5, r7, lsl #1
 3004ab4:	e1d501b8 	ldrh	r0, [r5, #24]
 3004ab8:	e3100902 	tst	r0, #32768	@ 0x8000
 3004abc:	0affff9c 	beq	3004934 <fn_030048A4+0x90>
 3004ac0:	e3c00902 	bic	r0, r0, #32768	@ 0x8000
 3004ac4:	ebfff884 	bl	3002cdc <fn_03002CDC>
 3004ac8:	e35b0000 	cmp	fp, #0
 3004acc:	1affff9a 	bne	300493c <fn_030048A4+0x98>
 3004ad0:	e28dd08c 	add	sp, sp, #140	@ 0x8c
 3004ad4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3004ad8:	e12fff1e 	bx	lr
 3004adc:	e35b0000 	cmp	fp, #0
 3004ae0:	0afffffa 	beq	3004ad0 <fn_030048A4+0x22c>
 3004ae4:	e24bb001 	sub	fp, fp, #1
 3004ae8:	e1a0308b 	lsl	r3, fp, #1
 3004aec:	e28d2008 	add	r2, sp, #8
 3004af0:	e19270b3 	ldrh	r7, [r2, r3]
 3004af4:	e59d3004 	ldr	r3, [sp, #4]
 3004af8:	e1a050a7 	lsr	r5, r7, #1
 3004afc:	e0655185 	rsb	r5, r5, r5, lsl #3
 3004b00:	e2077001 	and	r7, r7, #1
 3004b04:	e0835105 	add	r5, r3, r5, lsl #2
 3004b08:	eaffff99 	b	3004974 <fn_030048A4+0xd0>
 3004b0c:	e3a03000 	mov	r3, #0
 3004b10:	e3a01020 	mov	r1, #32
 3004b14:	e3a0c010 	mov	ip, #16
 3004b18:	e3a00004 	mov	r0, #4
 3004b1c:	eaffffa4 	b	30049b4 <fn_030048A4+0x110>
 3004b20:	e59f309c 	ldr	r3, [pc, #156]	@ 3004bc4 <fn_030048A4+0x320>
 3004b24:	e1560003 	cmp	r6, r3
 3004b28:	a3a03000 	movge	r3, #0
 3004b2c:	b3a03001 	movlt	r3, #1
 3004b30:	e59f2090 	ldr	r2, [pc, #144]	@ 3004bc8 <fn_030048A4+0x324>
 3004b34:	e1500002 	cmp	r0, r2
 3004b38:	c3833001 	orrgt	r3, r3, #1
 3004b3c:	e3530000 	cmp	r3, #0
 3004b40:	1affffe5 	bne	3004adc <fn_030048A4+0x238>
 3004b44:	e1560002 	cmp	r6, r2
 3004b48:	d2866101 	addle	r6, r6, #1073741824	@ 0x40000000
 3004b4c:	d1a069a6 	lsrle	r6, r6, #19
 3004b50:	ca00000a 	bgt	3004b80 <fn_030048A4+0x2dc>
 3004b54:	e59f3068 	ldr	r3, [pc, #104]	@ 3004bc4 <fn_030048A4+0x320>
 3004b58:	e1500003 	cmp	r0, r3
 3004b5c:	ba00000b 	blt	3004b90 <fn_030048A4+0x2ec>
 3004b60:	e2800101 	add	r0, r0, #1073741824	@ 0x40000000
 3004b64:	e1a039a0 	lsr	r3, r0, #19
 3004b68:	eaffffc4 	b	3004a80 <fn_030048A4+0x1dc>
 3004b6c:	e1a03001 	mov	r3, r1
 3004b70:	eaffff98 	b	30049d8 <fn_030048A4+0x134>
 3004b74:	e59f304c 	ldr	r3, [pc, #76]	@ 3004bc8 <fn_030048A4+0x324>
 3004b78:	e1500003 	cmp	r0, r3
 3004b7c:	caffffd6 	bgt	3004adc <fn_030048A4+0x238>
 3004b80:	e59f303c 	ldr	r3, [pc, #60]	@ 3004bc4 <fn_030048A4+0x320>
 3004b84:	e1500003 	cmp	r0, r3
 3004b88:	e59f6048 	ldr	r6, [pc, #72]	@ 3004bd8 <fn_030048A4+0x334>
 3004b8c:	aafffff3 	bge	3004b60 <fn_030048A4+0x2bc>
 3004b90:	e59f3034 	ldr	r3, [pc, #52]	@ 3004bcc <fn_030048A4+0x328>
 3004b94:	eaffffb9 	b	3004a80 <fn_030048A4+0x1dc>
 3004b98:	e59f302c 	ldr	r3, [pc, #44]	@ 3004bcc <fn_030048A4+0x328>
 3004b9c:	e59f6034 	ldr	r6, [pc, #52]	@ 3004bd8 <fn_030048A4+0x334>
 3004ba0:	eaffffb6 	b	3004a80 <fn_030048A4+0x1dc>
 3004ba4:	e3700001 	cmn	r0, #1
 3004ba8:	03a00000 	moveq	r0, #0
 3004bac:	13c00902 	bicne	r0, r0, #32768	@ 0x8000
 3004bb0:	e28dd08c 	add	sp, sp, #140	@ 0x8c
 3004bb4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3004bb8:	eafff847 	b	3002cdc <fn_03002CDC>
 3004bbc:	030064cc 	.word	0x030064cc	@ data_030064CC
 3004bc0:	0812f714 	.word	0x0812f714	@ data_0812F714
 3004bc4:	dff80001 	.word	0xdff80001
 3004bc8:	2007ffff 	.word	0x2007ffff
 3004bcc:	000003ff 	.word	0x000003ff
 3004bd0:	081337c8 	.word	0x081337c8	@ data_081337C8
 3004bd4:	03006600 	.word	0x03006600	@ data_03006600
 3004bd8:	00000c01 	.word	0x00000c01
