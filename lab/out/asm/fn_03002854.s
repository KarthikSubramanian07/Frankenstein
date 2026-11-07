fn_03002854:
 3002854:	e59f3450 	ldr	r3, [pc, #1104]	@ 3002cac <fn_03002854+0x458>
 3002858:	e5933000 	ldr	r3, [r3]
 300285c:	e2833c11 	add	r3, r3, #4352	@ 0x1100
 3002860:	e1d322b2 	ldrh	r2, [r3, #34]	@ 0x22
 3002864:	e1d031bc 	ldrh	r3, [r0, #28]
 3002868:	e1530002 	cmp	r3, r2
 300286c:	012fff1e 	bxeq	lr
 3002870:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3002874:	e590a00c 	ldr	sl, [r0, #12]
 3002878:	e35a0000 	cmp	sl, #0
 300287c:	e24dd034 	sub	sp, sp, #52	@ 0x34
 3002880:	e1c021bc 	strh	r2, [r0, #28]
 3002884:	0a0000df 	beq	3002c08 <fn_03002854+0x3b4>
 3002888:	e58d1028 	str	r1, [sp, #40]	@ 0x28
 300288c:	e59fb41c 	ldr	fp, [pc, #1052]	@ 3002cb0 <fn_03002854+0x45c>
 3002890:	e59a700c 	ldr	r7, [sl, #12]
 3002894:	e59b400c 	ldr	r4, [fp, #12]
 3002898:	e59b3118 	ldr	r3, [fp, #280]	@ 0x118
 300289c:	e0474004 	sub	r4, r7, r4
 30028a0:	e0c15394 	smull	r5, r1, r4, r3
 30028a4:	e59a6010 	ldr	r6, [sl, #16]
 30028a8:	e59b2010 	ldr	r2, [fp, #16]
 30028ac:	e59b011c 	ldr	r0, [fp, #284]	@ 0x11c
 30028b0:	e0462002 	sub	r2, r6, r2
 30028b4:	e1a05825 	lsr	r5, r5, #16
 30028b8:	e1855801 	orr	r5, r5, r1, lsl #16
 30028bc:	e0cc1092 	smull	r1, ip, r2, r0
 30028c0:	e1a01821 	lsr	r1, r1, #16
 30028c4:	e181180c 	orr	r1, r1, ip, lsl #16
 30028c8:	e0855001 	add	r5, r5, r1
 30028cc:	e3550701 	cmp	r5, #262144	@ 0x40000
 30028d0:	ba0000c9 	blt	3002bfc <fn_03002854+0x3a8>
 30028d4:	e3550405 	cmp	r5, #83886080	@ 0x5000000
 30028d8:	da000003 	ble	30028ec <fn_03002854+0x98>
 30028dc:	e5da105a 	ldrb	r1, [sl, #90]	@ 0x5a
 30028e0:	e2411013 	sub	r1, r1, #19
 30028e4:	e31100fd 	tst	r1, #253	@ 0xfd
 30028e8:	1a0000c3 	bne	3002bfc <fn_03002854+0x3a8>
 30028ec:	e1a01000 	mov	r1, r0
 30028f0:	e0c04491 	smull	r4, r0, r1, r4
 30028f4:	e1a01002 	mov	r1, r2
 30028f8:	e0c23391 	smull	r3, r2, r1, r3
 30028fc:	e1a04824 	lsr	r4, r4, #16
 3002900:	e1a03823 	lsr	r3, r3, #16
 3002904:	e1833802 	orr	r3, r3, r2, lsl #16
 3002908:	e1844800 	orr	r4, r4, r0, lsl #16
 300290c:	e0444003 	sub	r4, r4, r3
 3002910:	e0243fc4 	eor	r3, r4, r4, asr #31
 3002914:	e0433fc4 	sub	r3, r3, r4, asr #31
 3002918:	e1530105 	cmp	r3, r5, lsl #2
 300291c:	ca0000b6 	bgt	3002bfc <fn_03002854+0x3a8>
 3002920:	e59a304c 	ldr	r3, [sl, #76]	@ 0x4c
 3002924:	e3130202 	tst	r3, #536870912	@ 0x20000000
 3002928:	e59a3014 	ldr	r3, [sl, #20]
 300292c:	e58d3010 	str	r3, [sp, #16]
 3002930:	1a0000bc 	bne	3002c28 <fn_03002854+0x3d4>
 3002934:	e59a3048 	ldr	r3, [sl, #72]	@ 0x48
 3002938:	e1a01003 	mov	r1, r3
 300293c:	e58d3008 	str	r3, [sp, #8]
 3002940:	e59f3364 	ldr	r3, [pc, #868]	@ 3002cac <fn_03002854+0x458>
 3002944:	e5939000 	ldr	r9, [r3]
 3002948:	e2893901 	add	r3, r9, #16384	@ 0x4000
 300294c:	e1d120b0 	ldrh	r2, [r1]
 3002950:	e59331b8 	ldr	r3, [r3, #440]	@ 0x1b8
 3002954:	e0833182 	add	r3, r3, r2, lsl #3
 3002958:	e5938004 	ldr	r8, [r3, #4]
 300295c:	e1d130b2 	ldrh	r3, [r1, #2]
 3002960:	e1a03883 	lsl	r3, r3, #17
 3002964:	e1a038a3 	lsr	r3, r3, #17
 3002968:	e0833183 	add	r3, r3, r3, lsl #3
 300296c:	e0888083 	add	r8, r8, r3, lsl #1
 3002970:	e5d83011 	ldrb	r3, [r8, #17]
 3002974:	e3530000 	cmp	r3, #0
 3002978:	0a000008 	beq	30029a0 <fn_03002854+0x14c>
 300297c:	e28b000c 	add	r0, fp, #12
 3002980:	e1a03006 	mov	r3, r6
 3002984:	e1a02007 	mov	r2, r7
 3002988:	e8900003 	ldm	r0, {r0, r1}
 300298c:	ebffff72 	bl	300275c <fn_0300275C>
 3002990:	e59a3020 	ldr	r3, [sl, #32]
 3002994:	e2633209 	rsb	r3, r3, #-1879048192	@ 0x90000000
 3002998:	e0833000 	add	r3, r3, r0
 300299c:	e1a03ea3 	lsr	r3, r3, #29
 30029a0:	e1a01083 	lsl	r1, r3, #1
 30029a4:	e2899a01 	add	r9, r9, #4096	@ 0x1000
 30029a8:	e19800f1 	ldrsh	r0, [r8, r1]
 30029ac:	e5992108 	ldr	r2, [r9, #264]	@ 0x108
 30029b0:	e0800002 	add	r0, r0, r2
 30029b4:	e5d82010 	ldrb	r2, [r8, #16]
 30029b8:	e1a03352 	asr	r3, r2, r3
 30029bc:	e2038001 	and	r8, r3, #1
 30029c0:	e59f32ec 	ldr	r3, [pc, #748]	@ 3002cb4 <fn_03002854+0x460>
 30029c4:	e58d8014 	str	r8, [sp, #20]
 30029c8:	e1a0e00f 	mov	lr, pc
 30029cc:	e12fff13 	bx	r3
 30029d0:	e3580000 	cmp	r8, #0
 30029d4:	e1d030f4 	ldrsh	r3, [r0, #4]
 30029d8:	11d020f0 	ldrshne	r2, [r0]
 30029dc:	10423003 	subne	r3, r2, r3
 30029e0:	e0444803 	sub	r4, r4, r3, lsl #16
 30029e4:	e1a02005 	mov	r2, r5
 30029e8:	e59f32c8 	ldr	r3, [pc, #712]	@ 3002cb8 <fn_03002854+0x464>
 30029ec:	e1a09000 	mov	r9, r0
 30029f0:	e3a01000 	mov	r1, #0
 30029f4:	e3a0003c 	mov	r0, #60	@ 0x3c
 30029f8:	e1a0e00f 	mov	lr, pc
 30029fc:	e12fff13 	bx	r3
 3002a00:	e5db310c 	ldrb	r3, [fp, #268]	@ 0x10c
 3002a04:	e3530000 	cmp	r3, #0
 3002a08:	e0c23094 	smull	r3, r2, r4, r0
 3002a0c:	e1a03823 	lsr	r3, r3, #16
 3002a10:	e1833802 	orr	r3, r3, r2, lsl #16
 3002a14:	e283270f 	add	r2, r3, #3932160	@ 0x3c0000
 3002a18:	e1a08000 	mov	r8, r0
 3002a1c:	e58d200c 	str	r2, [sp, #12]
 3002a20:	0a00007b 	beq	3002c14 <fn_03002854+0x3c0>
 3002a24:	e59a204c 	ldr	r2, [sl, #76]	@ 0x4c
 3002a28:	e2122701 	ands	r2, r2, #262144	@ 0x40000
 3002a2c:	1a000078 	bne	3002c14 <fn_03002854+0x3c0>
 3002a30:	e3a01901 	mov	r1, #16384	@ 0x4000
 3002a34:	e58d1004 	str	r1, [sp, #4]
 3002a38:	e3a01903 	mov	r1, #49152	@ 0xc000
 3002a3c:	e58d1018 	str	r1, [sp, #24]
 3002a40:	e59f0274 	ldr	r0, [pc, #628]	@ 3002cbc <fn_03002854+0x468>
 3002a44:	e3520000 	cmp	r2, #0
 3002a48:	e59f1270 	ldr	r1, [pc, #624]	@ 3002cc0 <fn_03002854+0x46c>
 3002a4c:	01a01000 	moveq	r1, r0
 3002a50:	e283270f 	add	r2, r3, #3932160	@ 0x3c0000
 3002a54:	e1520001 	cmp	r2, r1
 3002a58:	ca000067 	bgt	3002bfc <fn_03002854+0x3a8>
 3002a5c:	e1d920f0 	ldrsh	r2, [r9]
 3002a60:	e0844802 	add	r4, r4, r2, lsl #16
 3002a64:	e0c24498 	smull	r4, r2, r8, r4
 3002a68:	e1a04824 	lsr	r4, r4, #16
 3002a6c:	e59d0004 	ldr	r0, [sp, #4]
 3002a70:	e1844802 	orr	r4, r4, r2, lsl #16
 3002a74:	e284470f 	add	r4, r4, #3932160	@ 0x3c0000
 3002a78:	e1540000 	cmp	r4, r0
 3002a7c:	da00005e 	ble	3002bfc <fn_03002854+0x3a8>
 3002a80:	e28339f5 	add	r3, r3, #4014080	@ 0x3d4000
 3002a84:	e1540003 	cmp	r4, r3
 3002a88:	da00005b 	ble	3002bfc <fn_03002854+0x3a8>
 3002a8c:	e59b3120 	ldr	r3, [fp, #288]	@ 0x120
 3002a90:	e353005f 	cmp	r3, #95	@ 0x5f
 3002a94:	8a000058 	bhi	3002bfc <fn_03002854+0x3a8>
 3002a98:	e59fe20c 	ldr	lr, [pc, #524]	@ 3002cac <fn_03002854+0x458>
 3002a9c:	e59e2000 	ldr	r2, [lr]
 3002aa0:	e282ec43 	add	lr, r2, #17152	@ 0x4300
 3002aa4:	e28ee0d0 	add	lr, lr, #208	@ 0xd0
 3002aa8:	e0832083 	add	r2, r3, r3, lsl #1
 3002aac:	e59a104c 	ldr	r1, [sl, #76]	@ 0x4c
 3002ab0:	e2833001 	add	r3, r3, #1
 3002ab4:	e58b3120 	str	r3, [fp, #288]	@ 0x120
 3002ab8:	e08e3202 	add	r3, lr, r2, lsl #4
 3002abc:	e5831028 	str	r1, [r3, #40]	@ 0x28
 3002ac0:	e58d3024 	str	r3, [sp, #36]	@ 0x24
 3002ac4:	e1a03202 	lsl	r3, r2, #4
 3002ac8:	e3a01000 	mov	r1, #0
 3002acc:	e1a02005 	mov	r2, r5
 3002ad0:	e58d3020 	str	r3, [sp, #32]
 3002ad4:	e3a00080 	mov	r0, #128	@ 0x80
 3002ad8:	e59f31d8 	ldr	r3, [pc, #472]	@ 3002cb8 <fn_03002854+0x464>
 3002adc:	e58de01c 	str	lr, [sp, #28]
 3002ae0:	e1a0e00f 	mov	lr, pc
 3002ae4:	e12fff13 	bx	r3
 3002ae8:	e59dc004 	ldr	ip, [sp, #4]
 3002aec:	e044200c 	sub	r2, r4, ip
 3002af0:	e2822cff 	add	r2, r2, #65280	@ 0xff00
 3002af4:	e28220ff 	add	r2, r2, #255	@ 0xff
 3002af8:	e1a02842 	asr	r2, r2, #16
 3002afc:	e2422001 	sub	r2, r2, #1
 3002b00:	e3520077 	cmp	r2, #119	@ 0x77
 3002b04:	a3a02077 	movge	r2, #119	@ 0x77
 3002b08:	e59d3024 	ldr	r3, [sp, #36]	@ 0x24
 3002b0c:	e1a053c5 	asr	r5, r5, #7
 3002b10:	e5835020 	str	r5, [r3, #32]
 3002b14:	e5830014 	str	r0, [r3, #20]
 3002b18:	e59d5010 	ldr	r5, [sp, #16]
 3002b1c:	e58d002c 	str	r0, [sp, #44]	@ 0x2c
 3002b20:	e1d900f6 	ldrsh	r0, [r9, #6]
 3002b24:	e59dc018 	ldr	ip, [sp, #24]
 3002b28:	e59d100c 	ldr	r1, [sp, #12]
 3002b2c:	e583500c 	str	r5, [r3, #12]
 3002b30:	e0850800 	add	r0, r5, r0, lsl #16
 3002b34:	e59b50f4 	ldr	r5, [fp, #244]	@ 0xf4
 3002b38:	e041100c 	sub	r1, r1, ip
 3002b3c:	e0400005 	sub	r0, r0, r5
 3002b40:	e2811cff 	add	r1, r1, #65280	@ 0xff00
 3002b44:	e583001c 	str	r0, [r3, #28]
 3002b48:	e28110ff 	add	r1, r1, #255	@ 0xff
 3002b4c:	e28d001c 	add	r0, sp, #28
 3002b50:	e8900021 	ldm	r0, {r0, r5}
 3002b54:	e028cfc8 	eor	ip, r8, r8, asr #31
 3002b58:	e59f4164 	ldr	r4, [pc, #356]	@ 3002cc4 <fn_03002854+0x470>
 3002b5c:	e1a01841 	asr	r1, r1, #16
 3002b60:	e1c11fc1 	bic	r1, r1, r1, asr #31
 3002b64:	e04ccfc8 	sub	ip, ip, r8, asr #31
 3002b68:	e5837004 	str	r7, [r3, #4]
 3002b6c:	e5836008 	str	r6, [r3, #8]
 3002b70:	e5839024 	str	r9, [r3, #36]	@ 0x24
 3002b74:	e18010b5 	strh	r1, [r0, r5]
 3002b78:	e1c320b2 	strh	r2, [r3, #2]
 3002b7c:	e7d4282c 	ldrb	r2, [r4, ip, lsr #16]
 3002b80:	e59fe140 	ldr	lr, [pc, #320]	@ 3002cc8 <fn_03002854+0x474>
 3002b84:	e1a0c23c 	lsr	ip, ip, r2
 3002b88:	e79e010c 	ldr	r0, [lr, ip, lsl #2]
 3002b8c:	e1a00250 	asr	r0, r0, r2
 3002b90:	e59d2004 	ldr	r2, [sp, #4]
 3002b94:	e3580000 	cmp	r8, #0
 3002b98:	e0828801 	add	r8, r2, r1, lsl #16
 3002b9c:	e59d200c 	ldr	r2, [sp, #12]
 3002ba0:	e0488002 	sub	r8, r8, r2
 3002ba4:	e59d2014 	ldr	r2, [sp, #20]
 3002ba8:	b2600000 	rsblt	r0, r0, #0
 3002bac:	e3520000 	cmp	r2, #0
 3002bb0:	e0c12098 	smull	r2, r1, r8, r0
 3002bb4:	e1a02822 	lsr	r2, r2, #16
 3002bb8:	e1822801 	orr	r2, r2, r1, lsl #16
 3002bbc:	11e02002 	mvnne	r2, r2
 3002bc0:	11d910f0 	ldrshne	r1, [r9]
 3002bc4:	10822801 	addne	r2, r2, r1, lsl #16
 3002bc8:	e5832010 	str	r2, [r3, #16]
 3002bcc:	e59a204c 	ldr	r2, [sl, #76]	@ 0x4c
 3002bd0:	12600000 	rsbne	r0, r0, #0
 3002bd4:	e3120701 	tst	r2, #262144	@ 0x40000
 3002bd8:	13a02000 	movne	r2, #0
 3002bdc:	e5830018 	str	r0, [r3, #24]
 3002be0:	1583202c 	strne	r2, [r3, #44]	@ 0x2c
 3002be4:	1a000004 	bne	3002bfc <fn_03002854+0x3a8>
 3002be8:	e59b20fc 	ldr	r2, [fp, #252]	@ 0xfc
 3002bec:	e3520000 	cmp	r2, #0
 3002bf0:	0a000013 	beq	3002c44 <fn_03002854+0x3f0>
 3002bf4:	e59f20d0 	ldr	r2, [pc, #208]	@ 3002ccc <fn_03002854+0x478>
 3002bf8:	e583202c 	str	r2, [r3, #44]	@ 0x2c
 3002bfc:	e59aa018 	ldr	sl, [sl, #24]
 3002c00:	e35a0000 	cmp	sl, #0
 3002c04:	1affff21 	bne	3002890 <fn_03002854+0x3c>
 3002c08:	e28dd034 	add	sp, sp, #52	@ 0x34
 3002c0c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3002c10:	e12fff1e 	bx	lr
 3002c14:	e3a01902 	mov	r1, #32768	@ 0x8000
 3002c18:	e3a02001 	mov	r2, #1
 3002c1c:	e58d1004 	str	r1, [sp, #4]
 3002c20:	e58d1018 	str	r1, [sp, #24]
 3002c24:	eaffff85 	b	3002a40 <fn_03002854+0x1ec>
 3002c28:	e1a0000a 	mov	r0, sl
 3002c2c:	e59f309c 	ldr	r3, [pc, #156]	@ 3002cd0 <fn_03002854+0x47c>
 3002c30:	e1a0e00f 	mov	lr, pc
 3002c34:	e12fff13 	bx	r3
 3002c38:	e1a01000 	mov	r1, r0
 3002c3c:	e58d0008 	str	r0, [sp, #8]
 3002c40:	eaffff3e 	b	3002940 <fn_03002854+0xec>
 3002c44:	e59d2008 	ldr	r2, [sp, #8]
 3002c48:	e1d220f2 	ldrsh	r2, [r2, #2]
 3002c4c:	e3520000 	cmp	r2, #0
 3002c50:	ba000012 	blt	3002ca0 <fn_03002854+0x44c>
 3002c54:	e59d0028 	ldr	r0, [sp, #40]	@ 0x28
 3002c58:	e59b1100 	ldr	r1, [fp, #256]	@ 0x100
 3002c5c:	e0811240 	add	r1, r1, r0, asr #4
 3002c60:	e1c11fc1 	bic	r1, r1, r1, asr #31
 3002c64:	e351000f 	cmp	r1, #15
 3002c68:	a3a0100f 	movge	r1, #15
 3002c6c:	e59d202c 	ldr	r2, [sp, #44]	@ 0x2c
 3002c70:	e0811101 	add	r1, r1, r1, lsl #2
 3002c74:	e1a02522 	lsr	r2, r2, #10
 3002c78:	e1a01281 	lsl	r1, r1, #5
 3002c7c:	e352009f 	cmp	r2, #159	@ 0x9f
 3002c80:	90811002 	addls	r1, r1, r2
 3002c84:	8281109f 	addhi	r1, r1, #159	@ 0x9f
 3002c88:	e59fc044 	ldr	ip, [pc, #68]	@ 3002cd4 <fn_03002854+0x480>
 3002c8c:	e59f0044 	ldr	r0, [pc, #68]	@ 3002cd8 <fn_03002854+0x484>
 3002c90:	e7dc2001 	ldrb	r2, [ip, r1]
 3002c94:	e0802402 	add	r2, r0, r2, lsl #8
 3002c98:	e583202c 	str	r2, [r3, #44]	@ 0x2c
 3002c9c:	eaffffd6 	b	3002bfc <fn_03002854+0x3a8>
 3002ca0:	e59f2030 	ldr	r2, [pc, #48]	@ 3002cd8 <fn_03002854+0x484>
 3002ca4:	e583202c 	str	r2, [r3, #44]	@ 0x2c
 3002ca8:	eaffffd3 	b	3002bfc <fn_03002854+0x3a8>
 3002cac:	030064c4 	.word	0x030064c4	@ data_030064C4
 3002cb0:	030064cc 	.word	0x030064cc	@ data_030064CC
 3002cb4:	0801d569 	.word	0x0801d569	@ fn_0801D568
 3002cb8:	0300092c 	.word	0x0300092c
 3002cbc:	0077c000 	.word	0x0077c000
 3002cc0:	00778000 	.word	0x00778000
 3002cc4:	0802648c 	.word	0x0802648c	@ data_0802648C
 3002cc8:	0802e48c 	.word	0x0802e48c	@ data_0802E48C
 3002ccc:	05000200 	.word	0x05000200
 3002cd0:	08010d9d 	.word	0x08010d9d	@ fn_08010D9C
 3002cd4:	08132804 	.word	0x08132804	@ data_08132804
 3002cd8:	06013600 	.word	0x06013600
