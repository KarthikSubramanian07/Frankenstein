fn_08001ABC:
 8001abc:	23ee      	movs	r3, #238	@ 0xee
 8001abe:	b570      	push	{r4, r5, r6, lr}
 8001ac0:	4c12      	ldr	r4, [pc, #72]	@ (8001b0c <fn_08001ABC+0x50>)
 8001ac2:	6822      	ldr	r2, [r4, #0]
 8001ac4:	005b      	lsls	r3, r3, #1
 8001ac6:	58d3      	ldr	r3, [r2, r3]
 8001ac8:	0005      	movs	r5, r0
 8001aca:	2b02      	cmp	r3, #2
 8001acc:	dc02      	bgt.n	8001ad4 <fn_08001ABC+0x18>
 8001ace:	bc70      	pop	{r4, r5, r6}
 8001ad0:	bc01      	pop	{r0}
 8001ad2:	4700      	bx	r0
 8001ad4:	f004 fbd8 	bl	8006288 <fn_08006288>
 8001ad8:	2800      	cmp	r0, #0
 8001ada:	d1f8      	bne.n	8001ace <fn_08001ABC+0x12>
 8001adc:	23d5      	movs	r3, #213	@ 0xd5
 8001ade:	6822      	ldr	r2, [r4, #0]
 8001ae0:	56d3      	ldrsb	r3, [r2, r3]
 8001ae2:	2b00      	cmp	r3, #0
 8001ae4:	d10e      	bne.n	8001b04 <fn_08001ABC+0x48>
 8001ae6:	0028      	movs	r0, r5
 8001ae8:	f003 fe9e 	bl	8005828 <fn_08005828>
 8001aec:	2800      	cmp	r0, #0
 8001aee:	d1ee      	bne.n	8001ace <fn_08001ABC+0x12>
 8001af0:	0028      	movs	r0, r5
 8001af2:	f019 fe6f 	bl	801b7d4 <fn_0801B7D4>
 8001af6:	2800      	cmp	r0, #0
 8001af8:	d1e9      	bne.n	8001ace <fn_08001ABC+0x12>
 8001afa:	0028      	movs	r0, r5
 8001afc:	f7ff fb32 	bl	8001164 <fn_08001164>
 8001b00:	2800      	cmp	r0, #0
 8001b02:	d1e4      	bne.n	8001ace <fn_08001ABC+0x12>
 8001b04:	0028      	movs	r0, r5
 8001b06:	f001 fb3d 	bl	8003184 <fn_08003184>
 8001b0a:	e7e0      	b.n	8001ace <fn_08001ABC+0x12>
 8001b0c:	030064c4 	.word	0x030064c4
