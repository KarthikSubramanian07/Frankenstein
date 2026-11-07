fn_03005A90:
 3005a90:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
 3005a94:	e1d290f0 	ldrsh	r9, [r2]
 3005a98:	e3590000 	cmp	r9, #0
 3005a9c:	0a000032 	beq	3005b6c <fn_03005A90+0xdc>
 3005aa0:	e1a07002 	mov	r7, r2
 3005aa4:	e1a08007 	mov	r8, r7
 3005aa8:	e1d230f6 	ldrsh	r3, [r2, #6]
 3005aac:	e59f20f0 	ldr	r2, [pc, #240]	@ 3005ba4 <fn_03005A90+0x114>
 3005ab0:	e5922000 	ldr	r2, [r2]
 3005ab4:	e0413003 	sub	r3, r1, r3
 3005ab8:	e2822a05 	add	r2, r2, #20480	@ 0x5000
 3005abc:	e5926a30 	ldr	r6, [r2, #2608]	@ 0xa30
 3005ac0:	e1a02183 	lsl	r2, r3, #3
 3005ac4:	e0622383 	rsb	r2, r2, r3, lsl #7
 3005ac8:	e1f830f4 	ldrsh	r3, [r8, #4]!
 3005acc:	e0403003 	sub	r3, r0, r3
 3005ad0:	e0833082 	add	r3, r3, r2, lsl #1
 3005ad4:	e0866003 	add	r6, r6, r3
 3005ad8:	e0869009 	add	r9, r6, r9
 3005adc:	e5b8e004 	ldr	lr, [r8, #4]!
 3005ae0:	e7d7300e 	ldrb	r3, [r7, lr]
 3005ae4:	e35300ff 	cmp	r3, #255	@ 0xff
 3005ae8:	e087e00e 	add	lr, r7, lr
 3005aec:	0a00001b 	beq	3005b60 <fn_03005A90+0xd0>
 3005af0:	e2065001 	and	r5, r6, #1
 3005af4:	e3c64001 	bic	r4, r6, #1
 3005af8:	e5de2001 	ldrb	r2, [lr, #1]
 3005afc:	e3520000 	cmp	r2, #0
 3005b00:	0a000012 	beq	3005b50 <fn_03005A90+0xc0>
 3005b04:	e1a01183 	lsl	r1, r3, #3
 3005b08:	e0611383 	rsb	r1, r1, r3, lsl #7
 3005b0c:	e1a03081 	lsl	r3, r1, #1
 3005b10:	e282c003 	add	ip, r2, #3
 3005b14:	e3550000 	cmp	r5, #0
 3005b18:	e19430b3 	ldrh	r3, [r4, r3]
 3005b1c:	e5dea003 	ldrb	sl, [lr, #3]
 3005b20:	e0841081 	add	r1, r4, r1, lsl #1
 3005b24:	e08ec00c 	add	ip, lr, ip
 3005b28:	e28e0004 	add	r0, lr, #4
 3005b2c:	0a000012 	beq	3005b7c <fn_03005A90+0xec>
 3005b30:	ea000001 	b	3005b3c <fn_03005A90+0xac>
 3005b34:	e1f13fb0 	ldrh	r3, [r1, #240]!	@ 0xf0
 3005b38:	e4d0a001 	ldrb	sl, [r0], #1
 3005b3c:	e20330ff 	and	r3, r3, #255	@ 0xff
 3005b40:	e183340a 	orr	r3, r3, sl, lsl #8
 3005b44:	e150000c 	cmp	r0, ip
 3005b48:	e1c130b0 	strh	r3, [r1]
 3005b4c:	1afffff8 	bne	3005b34 <fn_03005A90+0xa4>
 3005b50:	e2822004 	add	r2, r2, #4
 3005b54:	e7fe3002 	ldrb	r3, [lr, r2]!
 3005b58:	e35300ff 	cmp	r3, #255	@ 0xff
 3005b5c:	1affffe5 	bne	3005af8 <fn_03005A90+0x68>
 3005b60:	e2866001 	add	r6, r6, #1
 3005b64:	e1560009 	cmp	r6, r9
 3005b68:	1affffdb 	bne	3005adc <fn_03005A90+0x4c>
 3005b6c:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
 3005b70:	e12fff1e 	bx	lr
 3005b74:	e1f13fb0 	ldrh	r3, [r1, #240]!	@ 0xf0
 3005b78:	e4d0a001 	ldrb	sl, [r0], #1
 3005b7c:	e3c330ff 	bic	r3, r3, #255	@ 0xff
 3005b80:	e18a3003 	orr	r3, sl, r3
 3005b84:	e150000c 	cmp	r0, ip
 3005b88:	e1c130b0 	strh	r3, [r1]
 3005b8c:	1afffff8 	bne	3005b74 <fn_03005A90+0xe4>
 3005b90:	e2822004 	add	r2, r2, #4
 3005b94:	e7fe3002 	ldrb	r3, [lr, r2]!
 3005b98:	e35300ff 	cmp	r3, #255	@ 0xff
 3005b9c:	1affffd5 	bne	3005af8 <fn_03005A90+0x68>
 3005ba0:	eaffffee 	b	3005b60 <fn_03005A90+0xd0>
 3005ba4:	030064c4 	.word	0x030064c4	@ data_030064C4
