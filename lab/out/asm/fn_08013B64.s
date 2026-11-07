fn_08013B64:
 8013b64:	b5f0      	push	{r4, r5, r6, r7, lr}
 8013b66:	464f      	mov	r7, r9
 8013b68:	4646      	mov	r6, r8
 8013b6a:	46d6      	mov	lr, sl
 8013b6c:	4b24      	ldr	r3, [pc, #144]	@ (8013c00 <fn_08013B64+0x9c>)
 8013b6e:	469a      	mov	sl, r3
 8013b70:	4b24      	ldr	r3, [pc, #144]	@ (8013c04 <fn_08013B64+0xa0>)
 8013b72:	b5c0      	push	{r6, r7, lr}
 8013b74:	4680      	mov	r8, r0
 8013b76:	2700      	movs	r7, #0
 8013b78:	4699      	mov	r9, r3
 8013b7a:	2607      	movs	r6, #7
 8013b7c:	e004      	b.n	8013b88 <fn_08013B64+0x24>
 8013b7e:	4b22      	ldr	r3, [pc, #136]	@ (8013c08 <fn_08013B64+0xa4>)
 8013b80:	18ff      	adds	r7, r7, r3
 8013b82:	4b22      	ldr	r3, [pc, #136]	@ (8013c0c <fn_08013B64+0xa8>)
 8013b84:	429f      	cmp	r7, r3
 8013b86:	d033      	beq.n	8013bf0 <fn_08013B64+0x8c>
 8013b88:	4643      	mov	r3, r8
 8013b8a:	6a19      	ldr	r1, [r3, #32]
 8013b8c:	23e0      	movs	r3, #224	@ 0xe0
 8013b8e:	061b      	lsls	r3, r3, #24
 8013b90:	18c9      	adds	r1, r1, r3
 8013b92:	2280      	movs	r2, #128	@ 0x80
 8013b94:	4643      	mov	r3, r8
 8013b96:	04d2      	lsls	r2, r2, #19
 8013b98:	6d18      	ldr	r0, [r3, #80]	@ 0x50
 8013b9a:	19c9      	adds	r1, r1, r7
 8013b9c:	f7fb ff8c 	bl	800fab8 <fn_0800FAB8>
 8013ba0:	4653      	mov	r3, sl
 8013ba2:	464a      	mov	r2, r9
 8013ba4:	681b      	ldr	r3, [r3, #0]
 8013ba6:	589b      	ldr	r3, [r3, r2]
 8013ba8:	2b00      	cmp	r3, #0
 8013baa:	d0e8      	beq.n	8013b7e <fn_08013B64+0x1a>
 8013bac:	6b9a      	ldr	r2, [r3, #56]	@ 0x38
 8013bae:	6959      	ldr	r1, [r3, #20]
 8013bb0:	1092      	asrs	r2, r2, #2
 8013bb2:	330c      	adds	r3, #12
 8013bb4:	1852      	adds	r2, r2, r1
 8013bb6:	cb03      	ldmia	r3!, {r0, r1}
 8013bb8:	232a      	movs	r3, #42	@ 0x2a
 8013bba:	f7fd f917 	bl	8010dec <fn_08010DEC>
 8013bbe:	240f      	movs	r4, #15
 8013bc0:	2500      	movs	r5, #0
 8013bc2:	f7f2 ff9d 	bl	8006b00 <fn_08006B00>
 8013bc6:	4030      	ands	r0, r6
 8013bc8:	3001      	adds	r0, #1
 8013bca:	3c01      	subs	r4, #1
 8013bcc:	182d      	adds	r5, r5, r0
 8013bce:	2c00      	cmp	r4, #0
 8013bd0:	d1f7      	bne.n	8013bc2 <fn_08013B64+0x5e>
 8013bd2:	4643      	mov	r3, r8
 8013bd4:	6d19      	ldr	r1, [r3, #80]	@ 0x50
 8013bd6:	4653      	mov	r3, sl
 8013bd8:	464a      	mov	r2, r9
 8013bda:	681b      	ldr	r3, [r3, #0]
 8013bdc:	5898      	ldr	r0, [r3, r2]
 8013bde:	002b      	movs	r3, r5
 8013be0:	000a      	movs	r2, r1
 8013be2:	f7f9 feeb 	bl	800d9bc <fn_0800D9BC>
 8013be6:	4b08      	ldr	r3, [pc, #32]	@ (8013c08 <fn_08013B64+0xa4>)
 8013be8:	18ff      	adds	r7, r7, r3
 8013bea:	4b08      	ldr	r3, [pc, #32]	@ (8013c0c <fn_08013B64+0xa8>)
 8013bec:	429f      	cmp	r7, r3
 8013bee:	d1cb      	bne.n	8013b88 <fn_08013B64+0x24>
 8013bf0:	bce0      	pop	{r5, r6, r7}
 8013bf2:	46ba      	mov	sl, r7
 8013bf4:	46b1      	mov	r9, r6
 8013bf6:	46a8      	mov	r8, r5
 8013bf8:	bcf0      	pop	{r4, r5, r6, r7}
 8013bfa:	bc01      	pop	{r0}
 8013bfc:	4700      	bx	r0
 8013bfe:	46c0      	nop			@ (mov r8, r8)
 8013c00:	030064c4 	.word	0x030064c4
 8013c04:	000008f4 	.word	0x000008f4
 8013c08:	01999999 	.word	0x01999999
 8013c0c:	3fffffe8 	.word	0x3fffffe8
