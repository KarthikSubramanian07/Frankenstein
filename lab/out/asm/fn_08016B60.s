fn_08016B60:
 8016b60:	4b61      	ldr	r3, [pc, #388]	@ (8016ce8 <fn_08016B60+0x188>)
 8016b62:	b5f0      	push	{r4, r5, r6, r7, lr}
 8016b64:	46de      	mov	lr, fp
 8016b66:	469b      	mov	fp, r3
 8016b68:	681b      	ldr	r3, [r3, #0]
 8016b6a:	4657      	mov	r7, sl
 8016b6c:	464e      	mov	r6, r9
 8016b6e:	4645      	mov	r5, r8
 8016b70:	4699      	mov	r9, r3
 8016b72:	b5e0      	push	{r5, r6, r7, lr}
 8016b74:	464a      	mov	r2, r9
 8016b76:	25e9      	movs	r5, #233	@ 0xe9
 8016b78:	4b5c      	ldr	r3, [pc, #368]	@ (8016cec <fn_08016B60+0x18c>)
 8016b7a:	012d      	lsls	r5, r5, #4
 8016b7c:	58d3      	ldr	r3, [r2, r3]
 8016b7e:	444d      	add	r5, r9
 8016b80:	469a      	mov	sl, r3
 8016b82:	b089      	sub	sp, #36	@ 0x24
 8016b84:	429d      	cmp	r5, r3
 8016b86:	d225      	bcs.n	8016bd4 <fn_08016B60+0x74>
 8016b88:	4b59      	ldr	r3, [pc, #356]	@ (8016cf0 <fn_08016B60+0x190>)
 8016b8a:	58d3      	ldr	r3, [r2, r3]
 8016b8c:	10db      	asrs	r3, r3, #3
 8016b8e:	9301      	str	r3, [sp, #4]
 8016b90:	4b58      	ldr	r3, [pc, #352]	@ (8016cf4 <fn_08016B60+0x194>)
 8016b92:	681b      	ldr	r3, [r3, #0]
 8016b94:	4698      	mov	r8, r3
 8016b96:	4b58      	ldr	r3, [pc, #352]	@ (8016cf8 <fn_08016B60+0x198>)
 8016b98:	681f      	ldr	r7, [r3, #0]
 8016b9a:	2306      	movs	r3, #6
 8016b9c:	5eee      	ldrsh	r6, [r5, r3]
 8016b9e:	1e72      	subs	r2, r6, #1
 8016ba0:	2304      	movs	r3, #4
 8016ba2:	5eec      	ldrsh	r4, [r5, r3]
 8016ba4:	4216      	tst	r6, r2
 8016ba6:	d174      	bne.n	8016c92 <fn_08016B60+0x132>
 8016ba8:	9b01      	ldr	r3, [sp, #4]
 8016baa:	401a      	ands	r2, r3
 8016bac:	1912      	adds	r2, r2, r4
 8016bae:	2e00      	cmp	r6, #0
 8016bb0:	dd0d      	ble.n	8016bce <fn_08016B60+0x6e>
 8016bb2:	782b      	ldrb	r3, [r5, #0]
 8016bb4:	2b00      	cmp	r3, #0
 8016bb6:	d161      	bne.n	8016c7c <fn_08016B60+0x11c>
 8016bb8:	4641      	mov	r1, r8
 8016bba:	0063      	lsls	r3, r4, #1
 8016bbc:	52ca      	strh	r2, [r1, r3]
 8016bbe:	2106      	movs	r1, #6
 8016bc0:	5e6b      	ldrsh	r3, [r5, r1]
 8016bc2:	2004      	movs	r0, #4
 8016bc4:	5e29      	ldrsh	r1, [r5, r0]
 8016bc6:	3401      	adds	r4, #1
 8016bc8:	185b      	adds	r3, r3, r1
 8016bca:	42a3      	cmp	r3, r4
 8016bcc:	dcf4      	bgt.n	8016bb8 <fn_08016B60+0x58>
 8016bce:	350a      	adds	r5, #10
 8016bd0:	4555      	cmp	r5, sl
 8016bd2:	d3e2      	bcc.n	8016b9a <fn_08016B60+0x3a>
 8016bd4:	2400      	movs	r4, #0
 8016bd6:	4d49      	ldr	r5, [pc, #292]	@ (8016cfc <fn_08016B60+0x19c>)
 8016bd8:	00a1      	lsls	r1, r4, #2
 8016bda:	190b      	adds	r3, r1, r4
 8016bdc:	4a48      	ldr	r2, [pc, #288]	@ (8016d00 <fn_08016B60+0x1a0>)
 8016bde:	009b      	lsls	r3, r3, #2
 8016be0:	444b      	add	r3, r9
 8016be2:	1898      	adds	r0, r3, r2
 8016be4:	6802      	ldr	r2, [r0, #0]
 8016be6:	2a00      	cmp	r2, #0
 8016be8:	d040      	beq.n	8016c6c <fn_08016B60+0x10c>
 8016bea:	3a01      	subs	r2, #1
 8016bec:	6002      	str	r2, [r0, #0]
 8016bee:	2a00      	cmp	r2, #0
 8016bf0:	d13c      	bne.n	8016c6c <fn_08016B60+0x10c>
 8016bf2:	2285      	movs	r2, #133	@ 0x85
 8016bf4:	0152      	lsls	r2, r2, #5
 8016bf6:	5c9a      	ldrb	r2, [r3, r2]
 8016bf8:	2a01      	cmp	r2, #1
 8016bfa:	d067      	beq.n	8016ccc <fn_08016B60+0x16c>
 8016bfc:	2a02      	cmp	r2, #2
 8016bfe:	d057      	beq.n	8016cb0 <fn_08016B60+0x150>
 8016c00:	2a00      	cmp	r2, #0
 8016c02:	d10c      	bne.n	8016c1e <fn_08016B60+0xbe>
 8016c04:	4648      	mov	r0, r9
 8016c06:	4a3d      	ldr	r2, [pc, #244]	@ (8016cfc <fn_08016B60+0x19c>)
 8016c08:	589a      	ldr	r2, [r3, r2]
 8016c0a:	8a96      	ldrh	r6, [r2, #20]
 8016c0c:	4a3d      	ldr	r2, [pc, #244]	@ (8016d04 <fn_08016B60+0x1a4>)
 8016c0e:	5880      	ldr	r0, [r0, r2]
 8016c10:	0072      	lsls	r2, r6, #1
 8016c12:	1992      	adds	r2, r2, r6
 8016c14:	4e3c      	ldr	r6, [pc, #240]	@ (8016d08 <fn_08016B60+0x1a8>)
 8016c16:	0092      	lsls	r2, r2, #2
 8016c18:	599e      	ldr	r6, [r3, r6]
 8016c1a:	1882      	adds	r2, r0, r2
 8016c1c:	8096      	strh	r6, [r2, #4]
 8016c1e:	190b      	adds	r3, r1, r4
 8016c20:	4a3a      	ldr	r2, [pc, #232]	@ (8016d0c <fn_08016B60+0x1ac>)
 8016c22:	009b      	lsls	r3, r3, #2
 8016c24:	444b      	add	r3, r9
 8016c26:	5898      	ldr	r0, [r3, r2]
 8016c28:	a904      	add	r1, sp, #16
 8016c2a:	f7f9 fb73 	bl	8010314 <fn_08010314>
 8016c2e:	9a07      	ldr	r2, [sp, #28]
 8016c30:	9906      	ldr	r1, [sp, #24]
 8016c32:	0fd3      	lsrs	r3, r2, #31
 8016c34:	189b      	adds	r3, r3, r2
 8016c36:	0fca      	lsrs	r2, r1, #31
 8016c38:	1852      	adds	r2, r2, r1
 8016c3a:	1052      	asrs	r2, r2, #1
 8016c3c:	105b      	asrs	r3, r3, #1
 8016c3e:	189b      	adds	r3, r3, r2
 8016c40:	9a04      	ldr	r2, [sp, #16]
 8016c42:	9905      	ldr	r1, [sp, #20]
 8016c44:	9302      	str	r3, [sp, #8]
 8016c46:	0fd3      	lsrs	r3, r2, #31
 8016c48:	189b      	adds	r3, r3, r2
 8016c4a:	0fca      	lsrs	r2, r1, #31
 8016c4c:	1852      	adds	r2, r2, r1
 8016c4e:	1052      	asrs	r2, r2, #1
 8016c50:	105b      	asrs	r3, r3, #1
 8016c52:	189b      	adds	r3, r3, r2
 8016c54:	2117      	movs	r1, #23
 8016c56:	a802      	add	r0, sp, #8
 8016c58:	9303      	str	r3, [sp, #12]
 8016c5a:	f003 fb9d 	bl	801a398 <fn_0801A398>
 8016c5e:	465b      	mov	r3, fp
 8016c60:	6818      	ldr	r0, [r3, #0]
 8016c62:	2214      	movs	r2, #20
 8016c64:	2100      	movs	r1, #0
 8016c66:	1940      	adds	r0, r0, r5
 8016c68:	f009 feea 	bl	8020a40 <fn_08020A40>
 8016c6c:	3401      	adds	r4, #1
 8016c6e:	2c04      	cmp	r4, #4
 8016c70:	d015      	beq.n	8016c9e <fn_08016B60+0x13e>
 8016c72:	465b      	mov	r3, fp
 8016c74:	681b      	ldr	r3, [r3, #0]
 8016c76:	3514      	adds	r5, #20
 8016c78:	4699      	mov	r9, r3
 8016c7a:	e7ad      	b.n	8016bd8 <fn_08016B60+0x78>
 8016c7c:	0063      	lsls	r3, r4, #1
 8016c7e:	52fa      	strh	r2, [r7, r3]
 8016c80:	2104      	movs	r1, #4
 8016c82:	5e6b      	ldrsh	r3, [r5, r1]
 8016c84:	2006      	movs	r0, #6
 8016c86:	5e29      	ldrsh	r1, [r5, r0]
 8016c88:	3401      	adds	r4, #1
 8016c8a:	185b      	adds	r3, r3, r1
 8016c8c:	42a3      	cmp	r3, r4
 8016c8e:	dcf5      	bgt.n	8016c7c <fn_08016B60+0x11c>
 8016c90:	e79d      	b.n	8016bce <fn_08016B60+0x6e>
 8016c92:	0031      	movs	r1, r6
 8016c94:	9801      	ldr	r0, [sp, #4]
 8016c96:	f00e fcd7 	bl	8025648 <fn_08025648>
 8016c9a:	190a      	adds	r2, r1, r4
 8016c9c:	e787      	b.n	8016bae <fn_08016B60+0x4e>
 8016c9e:	b009      	add	sp, #36	@ 0x24
 8016ca0:	bcf0      	pop	{r4, r5, r6, r7}
 8016ca2:	46bb      	mov	fp, r7
 8016ca4:	46b2      	mov	sl, r6
 8016ca6:	46a9      	mov	r9, r5
 8016ca8:	46a0      	mov	r8, r4
 8016caa:	bcf0      	pop	{r4, r5, r6, r7}
 8016cac:	bc01      	pop	{r0}
 8016cae:	4700      	bx	r0
 8016cb0:	464e      	mov	r6, r9
 8016cb2:	4a12      	ldr	r2, [pc, #72]	@ (8016cfc <fn_08016B60+0x19c>)
 8016cb4:	589a      	ldr	r2, [r3, r2]
 8016cb6:	4813      	ldr	r0, [pc, #76]	@ (8016d04 <fn_08016B60+0x1a4>)
 8016cb8:	8a92      	ldrh	r2, [r2, #20]
 8016cba:	5836      	ldr	r6, [r6, r0]
 8016cbc:	0050      	lsls	r0, r2, #1
 8016cbe:	1880      	adds	r0, r0, r2
 8016cc0:	4a11      	ldr	r2, [pc, #68]	@ (8016d08 <fn_08016B60+0x1a8>)
 8016cc2:	0080      	lsls	r0, r0, #2
 8016cc4:	589a      	ldr	r2, [r3, r2]
 8016cc6:	1830      	adds	r0, r6, r0
 8016cc8:	80c2      	strh	r2, [r0, #6]
 8016cca:	e7a8      	b.n	8016c1e <fn_08016B60+0xbe>
 8016ccc:	4648      	mov	r0, r9
 8016cce:	4a0b      	ldr	r2, [pc, #44]	@ (8016cfc <fn_08016B60+0x19c>)
 8016cd0:	589a      	ldr	r2, [r3, r2]
 8016cd2:	8a96      	ldrh	r6, [r2, #20]
 8016cd4:	4a0b      	ldr	r2, [pc, #44]	@ (8016d04 <fn_08016B60+0x1a4>)
 8016cd6:	5880      	ldr	r0, [r0, r2]
 8016cd8:	0072      	lsls	r2, r6, #1
 8016cda:	1992      	adds	r2, r2, r6
 8016cdc:	4e0a      	ldr	r6, [pc, #40]	@ (8016d08 <fn_08016B60+0x1a8>)
 8016cde:	0092      	lsls	r2, r2, #2
 8016ce0:	599e      	ldr	r6, [r3, r6]
 8016ce2:	1882      	adds	r2, r0, r2
 8016ce4:	8116      	strh	r6, [r2, #8]
 8016ce6:	e79a      	b.n	8016c1e <fn_08016B60+0xbe>
 8016ce8:	030064c4 	.word	0x030064c4
 8016cec:	00000e8c 	.word	0x00000e8c
 8016cf0:	000010ec 	.word	0x000010ec
 8016cf4:	030066ec 	.word	0x030066ec
 8016cf8:	030065a4 	.word	0x030065a4
 8016cfc:	0000109c 	.word	0x0000109c
 8016d00:	000010a8 	.word	0x000010a8
 8016d04:	00000e14 	.word	0x00000e14
 8016d08:	000010a4 	.word	0x000010a4
 8016d0c:	000010ac 	.word	0x000010ac
