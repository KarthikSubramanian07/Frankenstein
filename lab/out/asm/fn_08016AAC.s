fn_08016AAC:
 8016aac:	4b61      	ldr	r3, [pc, #388]	@ (8016c34 <fn_08016AAC+0x188>)
 8016aae:	b5f0      	push	{r4, r5, r6, r7, lr}
 8016ab0:	46de      	mov	lr, fp
 8016ab2:	469b      	mov	fp, r3
 8016ab4:	681b      	ldr	r3, [r3, #0]
 8016ab6:	4657      	mov	r7, sl
 8016ab8:	464e      	mov	r6, r9
 8016aba:	4645      	mov	r5, r8
 8016abc:	4699      	mov	r9, r3
 8016abe:	b5e0      	push	{r5, r6, r7, lr}
 8016ac0:	464a      	mov	r2, r9
 8016ac2:	25e9      	movs	r5, #233	@ 0xe9
 8016ac4:	4b5c      	ldr	r3, [pc, #368]	@ (8016c38 <fn_08016AAC+0x18c>)
 8016ac6:	012d      	lsls	r5, r5, #4
 8016ac8:	58d3      	ldr	r3, [r2, r3]
 8016aca:	444d      	add	r5, r9
 8016acc:	469a      	mov	sl, r3
 8016ace:	b089      	sub	sp, #36	@ 0x24
 8016ad0:	429d      	cmp	r5, r3
 8016ad2:	d225      	bcs.n	8016b20 <fn_08016AAC+0x74>
 8016ad4:	4b59      	ldr	r3, [pc, #356]	@ (8016c3c <fn_08016AAC+0x190>)
 8016ad6:	58d3      	ldr	r3, [r2, r3]
 8016ad8:	10db      	asrs	r3, r3, #3
 8016ada:	9301      	str	r3, [sp, #4]
 8016adc:	4b58      	ldr	r3, [pc, #352]	@ (8016c40 <fn_08016AAC+0x194>)
 8016ade:	681b      	ldr	r3, [r3, #0]
 8016ae0:	4698      	mov	r8, r3
 8016ae2:	4b58      	ldr	r3, [pc, #352]	@ (8016c44 <fn_08016AAC+0x198>)
 8016ae4:	681f      	ldr	r7, [r3, #0]
 8016ae6:	2306      	movs	r3, #6
 8016ae8:	5eee      	ldrsh	r6, [r5, r3]
 8016aea:	1e72      	subs	r2, r6, #1
 8016aec:	2304      	movs	r3, #4
 8016aee:	5eec      	ldrsh	r4, [r5, r3]
 8016af0:	4216      	tst	r6, r2
 8016af2:	d174      	bne.n	8016bde <fn_08016AAC+0x132>
 8016af4:	9b01      	ldr	r3, [sp, #4]
 8016af6:	401a      	ands	r2, r3
 8016af8:	1912      	adds	r2, r2, r4
 8016afa:	2e00      	cmp	r6, #0
 8016afc:	dd0d      	ble.n	8016b1a <fn_08016AAC+0x6e>
 8016afe:	782b      	ldrb	r3, [r5, #0]
 8016b00:	2b00      	cmp	r3, #0
 8016b02:	d161      	bne.n	8016bc8 <fn_08016AAC+0x11c>
 8016b04:	4641      	mov	r1, r8
 8016b06:	0063      	lsls	r3, r4, #1
 8016b08:	52ca      	strh	r2, [r1, r3]
 8016b0a:	2106      	movs	r1, #6
 8016b0c:	5e6b      	ldrsh	r3, [r5, r1]
 8016b0e:	2004      	movs	r0, #4
 8016b10:	5e29      	ldrsh	r1, [r5, r0]
 8016b12:	3401      	adds	r4, #1
 8016b14:	185b      	adds	r3, r3, r1
 8016b16:	42a3      	cmp	r3, r4
 8016b18:	dcf4      	bgt.n	8016b04 <fn_08016AAC+0x58>
 8016b1a:	350a      	adds	r5, #10
 8016b1c:	4555      	cmp	r5, sl
 8016b1e:	d3e2      	bcc.n	8016ae6 <fn_08016AAC+0x3a>
 8016b20:	2400      	movs	r4, #0
 8016b22:	4d49      	ldr	r5, [pc, #292]	@ (8016c48 <fn_08016AAC+0x19c>)
 8016b24:	00a1      	lsls	r1, r4, #2
 8016b26:	190b      	adds	r3, r1, r4
 8016b28:	4a48      	ldr	r2, [pc, #288]	@ (8016c4c <fn_08016AAC+0x1a0>)
 8016b2a:	009b      	lsls	r3, r3, #2
 8016b2c:	444b      	add	r3, r9
 8016b2e:	1898      	adds	r0, r3, r2
 8016b30:	6802      	ldr	r2, [r0, #0]
 8016b32:	2a00      	cmp	r2, #0
 8016b34:	d040      	beq.n	8016bb8 <fn_08016AAC+0x10c>
 8016b36:	3a01      	subs	r2, #1
 8016b38:	6002      	str	r2, [r0, #0]
 8016b3a:	2a00      	cmp	r2, #0
 8016b3c:	d13c      	bne.n	8016bb8 <fn_08016AAC+0x10c>
 8016b3e:	2285      	movs	r2, #133	@ 0x85
 8016b40:	0152      	lsls	r2, r2, #5
 8016b42:	5c9a      	ldrb	r2, [r3, r2]
 8016b44:	2a01      	cmp	r2, #1
 8016b46:	d067      	beq.n	8016c18 <fn_08016AAC+0x16c>
 8016b48:	2a02      	cmp	r2, #2
 8016b4a:	d057      	beq.n	8016bfc <fn_08016AAC+0x150>
 8016b4c:	2a00      	cmp	r2, #0
 8016b4e:	d10c      	bne.n	8016b6a <fn_08016AAC+0xbe>
 8016b50:	4648      	mov	r0, r9
 8016b52:	4a3d      	ldr	r2, [pc, #244]	@ (8016c48 <fn_08016AAC+0x19c>)
 8016b54:	589a      	ldr	r2, [r3, r2]
 8016b56:	8a96      	ldrh	r6, [r2, #20]
 8016b58:	4a3d      	ldr	r2, [pc, #244]	@ (8016c50 <fn_08016AAC+0x1a4>)
 8016b5a:	5880      	ldr	r0, [r0, r2]
 8016b5c:	0072      	lsls	r2, r6, #1
 8016b5e:	1992      	adds	r2, r2, r6
 8016b60:	4e3c      	ldr	r6, [pc, #240]	@ (8016c54 <fn_08016AAC+0x1a8>)
 8016b62:	0092      	lsls	r2, r2, #2
 8016b64:	599e      	ldr	r6, [r3, r6]
 8016b66:	1882      	adds	r2, r0, r2
 8016b68:	8096      	strh	r6, [r2, #4]
 8016b6a:	190b      	adds	r3, r1, r4
 8016b6c:	4a3a      	ldr	r2, [pc, #232]	@ (8016c58 <fn_08016AAC+0x1ac>)
 8016b6e:	009b      	lsls	r3, r3, #2
 8016b70:	444b      	add	r3, r9
 8016b72:	5898      	ldr	r0, [r3, r2]
 8016b74:	a904      	add	r1, sp, #16
 8016b76:	f7f9 fbcd 	bl	8010314 <fn_08010314>
 8016b7a:	9a07      	ldr	r2, [sp, #28]
 8016b7c:	9906      	ldr	r1, [sp, #24]
 8016b7e:	0fd3      	lsrs	r3, r2, #31
 8016b80:	189b      	adds	r3, r3, r2
 8016b82:	0fca      	lsrs	r2, r1, #31
 8016b84:	1852      	adds	r2, r2, r1
 8016b86:	1052      	asrs	r2, r2, #1
 8016b88:	105b      	asrs	r3, r3, #1
 8016b8a:	189b      	adds	r3, r3, r2
 8016b8c:	9a04      	ldr	r2, [sp, #16]
 8016b8e:	9905      	ldr	r1, [sp, #20]
 8016b90:	9302      	str	r3, [sp, #8]
 8016b92:	0fd3      	lsrs	r3, r2, #31
 8016b94:	189b      	adds	r3, r3, r2
 8016b96:	0fca      	lsrs	r2, r1, #31
 8016b98:	1852      	adds	r2, r2, r1
 8016b9a:	1052      	asrs	r2, r2, #1
 8016b9c:	105b      	asrs	r3, r3, #1
 8016b9e:	189b      	adds	r3, r3, r2
 8016ba0:	2117      	movs	r1, #23
 8016ba2:	a802      	add	r0, sp, #8
 8016ba4:	9303      	str	r3, [sp, #12]
 8016ba6:	f003 fb9d 	bl	801a2e4 <fn_0801A2E4>
 8016baa:	465b      	mov	r3, fp
 8016bac:	6818      	ldr	r0, [r3, #0]
 8016bae:	2214      	movs	r2, #20
 8016bb0:	2100      	movs	r1, #0
 8016bb2:	1940      	adds	r0, r0, r5
 8016bb4:	f009 feec 	bl	8020990 <fn_08020990>
 8016bb8:	3401      	adds	r4, #1
 8016bba:	2c04      	cmp	r4, #4
 8016bbc:	d015      	beq.n	8016bea <fn_08016AAC+0x13e>
 8016bbe:	465b      	mov	r3, fp
 8016bc0:	681b      	ldr	r3, [r3, #0]
 8016bc2:	3514      	adds	r5, #20
 8016bc4:	4699      	mov	r9, r3
 8016bc6:	e7ad      	b.n	8016b24 <fn_08016AAC+0x78>
 8016bc8:	0063      	lsls	r3, r4, #1
 8016bca:	52fa      	strh	r2, [r7, r3]
 8016bcc:	2104      	movs	r1, #4
 8016bce:	5e6b      	ldrsh	r3, [r5, r1]
 8016bd0:	2006      	movs	r0, #6
 8016bd2:	5e29      	ldrsh	r1, [r5, r0]
 8016bd4:	3401      	adds	r4, #1
 8016bd6:	185b      	adds	r3, r3, r1
 8016bd8:	42a3      	cmp	r3, r4
 8016bda:	dcf5      	bgt.n	8016bc8 <fn_08016AAC+0x11c>
 8016bdc:	e79d      	b.n	8016b1a <fn_08016AAC+0x6e>
 8016bde:	0031      	movs	r1, r6
 8016be0:	9801      	ldr	r0, [sp, #4]
 8016be2:	f00e fcd9 	bl	8025598 <fn_08025598>
 8016be6:	190a      	adds	r2, r1, r4
 8016be8:	e787      	b.n	8016afa <fn_08016AAC+0x4e>
 8016bea:	b009      	add	sp, #36	@ 0x24
 8016bec:	bcf0      	pop	{r4, r5, r6, r7}
 8016bee:	46bb      	mov	fp, r7
 8016bf0:	46b2      	mov	sl, r6
 8016bf2:	46a9      	mov	r9, r5
 8016bf4:	46a0      	mov	r8, r4
 8016bf6:	bcf0      	pop	{r4, r5, r6, r7}
 8016bf8:	bc01      	pop	{r0}
 8016bfa:	4700      	bx	r0
 8016bfc:	464e      	mov	r6, r9
 8016bfe:	4a12      	ldr	r2, [pc, #72]	@ (8016c48 <fn_08016AAC+0x19c>)
 8016c00:	589a      	ldr	r2, [r3, r2]
 8016c02:	4813      	ldr	r0, [pc, #76]	@ (8016c50 <fn_08016AAC+0x1a4>)
 8016c04:	8a92      	ldrh	r2, [r2, #20]
 8016c06:	5836      	ldr	r6, [r6, r0]
 8016c08:	0050      	lsls	r0, r2, #1
 8016c0a:	1880      	adds	r0, r0, r2
 8016c0c:	4a11      	ldr	r2, [pc, #68]	@ (8016c54 <fn_08016AAC+0x1a8>)
 8016c0e:	0080      	lsls	r0, r0, #2
 8016c10:	589a      	ldr	r2, [r3, r2]
 8016c12:	1830      	adds	r0, r6, r0
 8016c14:	80c2      	strh	r2, [r0, #6]
 8016c16:	e7a8      	b.n	8016b6a <fn_08016AAC+0xbe>
 8016c18:	4648      	mov	r0, r9
 8016c1a:	4a0b      	ldr	r2, [pc, #44]	@ (8016c48 <fn_08016AAC+0x19c>)
 8016c1c:	589a      	ldr	r2, [r3, r2]
 8016c1e:	8a96      	ldrh	r6, [r2, #20]
 8016c20:	4a0b      	ldr	r2, [pc, #44]	@ (8016c50 <fn_08016AAC+0x1a4>)
 8016c22:	5880      	ldr	r0, [r0, r2]
 8016c24:	0072      	lsls	r2, r6, #1
 8016c26:	1992      	adds	r2, r2, r6
 8016c28:	4e0a      	ldr	r6, [pc, #40]	@ (8016c54 <fn_08016AAC+0x1a8>)
 8016c2a:	0092      	lsls	r2, r2, #2
 8016c2c:	599e      	ldr	r6, [r3, r6]
 8016c2e:	1882      	adds	r2, r0, r2
 8016c30:	8116      	strh	r6, [r2, #8]
 8016c32:	e79a      	b.n	8016b6a <fn_08016AAC+0xbe>
 8016c34:	030064c4 	.word	0x030064c4
 8016c38:	00000e8c 	.word	0x00000e8c
 8016c3c:	000010ec 	.word	0x000010ec
 8016c40:	030066ec 	.word	0x030066ec
 8016c44:	030065a4 	.word	0x030065a4
 8016c48:	0000109c 	.word	0x0000109c
 8016c4c:	000010a8 	.word	0x000010a8
 8016c50:	00000e14 	.word	0x00000e14
 8016c54:	000010a4 	.word	0x000010a4
 8016c58:	000010ac 	.word	0x000010ac
