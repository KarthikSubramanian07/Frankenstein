fn_08013AB0:
 8013ab0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8013ab2:	464f      	mov	r7, r9
 8013ab4:	4646      	mov	r6, r8
 8013ab6:	46d6      	mov	lr, sl
 8013ab8:	4b24      	ldr	r3, [pc, #144]	@ (8013b4c <fn_08013AB0+0x9c>)
 8013aba:	469a      	mov	sl, r3
 8013abc:	4b24      	ldr	r3, [pc, #144]	@ (8013b50 <fn_08013AB0+0xa0>)
 8013abe:	b5c0      	push	{r6, r7, lr}
 8013ac0:	4680      	mov	r8, r0
 8013ac2:	2700      	movs	r7, #0
 8013ac4:	4699      	mov	r9, r3
 8013ac6:	2607      	movs	r6, #7
 8013ac8:	e004      	b.n	8013ad4 <fn_08013AB0+0x24>
 8013aca:	4b22      	ldr	r3, [pc, #136]	@ (8013b54 <fn_08013AB0+0xa4>)
 8013acc:	18ff      	adds	r7, r7, r3
 8013ace:	4b22      	ldr	r3, [pc, #136]	@ (8013b58 <fn_08013AB0+0xa8>)
 8013ad0:	429f      	cmp	r7, r3
 8013ad2:	d033      	beq.n	8013b3c <fn_08013AB0+0x8c>
 8013ad4:	4643      	mov	r3, r8
 8013ad6:	6a19      	ldr	r1, [r3, #32]
 8013ad8:	23e0      	movs	r3, #224	@ 0xe0
 8013ada:	061b      	lsls	r3, r3, #24
 8013adc:	18c9      	adds	r1, r1, r3
 8013ade:	2280      	movs	r2, #128	@ 0x80
 8013ae0:	4643      	mov	r3, r8
 8013ae2:	04d2      	lsls	r2, r2, #19
 8013ae4:	6d18      	ldr	r0, [r3, #80]	@ 0x50
 8013ae6:	19c9      	adds	r1, r1, r7
 8013ae8:	f7fb ffe6 	bl	800fab8 <fn_0800FAB8>
 8013aec:	4653      	mov	r3, sl
 8013aee:	464a      	mov	r2, r9
 8013af0:	681b      	ldr	r3, [r3, #0]
 8013af2:	589b      	ldr	r3, [r3, r2]
 8013af4:	2b00      	cmp	r3, #0
 8013af6:	d0e8      	beq.n	8013aca <fn_08013AB0+0x1a>
 8013af8:	6b9a      	ldr	r2, [r3, #56]	@ 0x38
 8013afa:	6959      	ldr	r1, [r3, #20]
 8013afc:	1092      	asrs	r2, r2, #2
 8013afe:	330c      	adds	r3, #12
 8013b00:	1852      	adds	r2, r2, r1
 8013b02:	cb03      	ldmia	r3!, {r0, r1}
 8013b04:	232a      	movs	r3, #42	@ 0x2a
 8013b06:	f7fd f971 	bl	8010dec <fn_08010DEC>
 8013b0a:	240f      	movs	r4, #15
 8013b0c:	2500      	movs	r5, #0
 8013b0e:	f7f2 fff7 	bl	8006b00 <fn_08006B00>
 8013b12:	4030      	ands	r0, r6
 8013b14:	3001      	adds	r0, #1
 8013b16:	3c01      	subs	r4, #1
 8013b18:	182d      	adds	r5, r5, r0
 8013b1a:	2c00      	cmp	r4, #0
 8013b1c:	d1f7      	bne.n	8013b0e <fn_08013AB0+0x5e>
 8013b1e:	4643      	mov	r3, r8
 8013b20:	6d19      	ldr	r1, [r3, #80]	@ 0x50
 8013b22:	4653      	mov	r3, sl
 8013b24:	464a      	mov	r2, r9
 8013b26:	681b      	ldr	r3, [r3, #0]
 8013b28:	5898      	ldr	r0, [r3, r2]
 8013b2a:	002b      	movs	r3, r5
 8013b2c:	000a      	movs	r2, r1
 8013b2e:	f7f9 ff45 	bl	800d9bc <fn_0800D9BC>
 8013b32:	4b08      	ldr	r3, [pc, #32]	@ (8013b54 <fn_08013AB0+0xa4>)
 8013b34:	18ff      	adds	r7, r7, r3
 8013b36:	4b08      	ldr	r3, [pc, #32]	@ (8013b58 <fn_08013AB0+0xa8>)
 8013b38:	429f      	cmp	r7, r3
 8013b3a:	d1cb      	bne.n	8013ad4 <fn_08013AB0+0x24>
 8013b3c:	bce0      	pop	{r5, r6, r7}
 8013b3e:	46ba      	mov	sl, r7
 8013b40:	46b1      	mov	r9, r6
 8013b42:	46a8      	mov	r8, r5
 8013b44:	bcf0      	pop	{r4, r5, r6, r7}
 8013b46:	bc01      	pop	{r0}
 8013b48:	4700      	bx	r0
 8013b4a:	46c0      	nop			@ (mov r8, r8)
 8013b4c:	030064c4 	.word	0x030064c4
 8013b50:	000008f4 	.word	0x000008f4
 8013b54:	01999999 	.word	0x01999999
 8013b58:	3fffffe8 	.word	0x3fffffe8
