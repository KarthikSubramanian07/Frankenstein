fn_0801ADD0:
 801add0:	b5f0      	push	{r4, r5, r6, r7, lr}
 801add2:	4657      	mov	r7, sl
 801add4:	4645      	mov	r5, r8
 801add6:	46de      	mov	lr, fp
 801add8:	464e      	mov	r6, r9
 801adda:	b5e0      	push	{r5, r6, r7, lr}
 801addc:	4692      	mov	sl, r2
 801adde:	b089      	sub	sp, #36	@ 0x24
 801ade0:	001f      	movs	r7, r3
 801ade2:	8042      	strh	r2, [r0, #2]
 801ade4:	2200      	movs	r2, #0
 801ade6:	000d      	movs	r5, r1
 801ade8:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
 801adea:	8001      	strh	r1, [r0, #0]
 801adec:	9912      	ldr	r1, [sp, #72]	@ 0x48
 801adee:	0004      	movs	r4, r0
 801adf0:	6082      	str	r2, [r0, #8]
 801adf2:	8083      	strh	r3, [r0, #4]
 801adf4:	60c1      	str	r1, [r0, #12]
 801adf6:	6107      	str	r7, [r0, #16]
 801adf8:	8302      	strh	r2, [r0, #24]
 801adfa:	7702      	strb	r2, [r0, #28]
 801adfc:	2b00      	cmp	r3, #0
 801adfe:	dd6e      	ble.n	801aede <fn_0801ADD0+0x10e>
 801ae00:	683a      	ldr	r2, [r7, #0]
 801ae02:	4690      	mov	r8, r2
 801ae04:	2100      	movs	r1, #0
 801ae06:	5e51      	ldrsh	r1, [r2, r1]
 801ae08:	1a6a      	subs	r2, r5, r1
 801ae0a:	4691      	mov	r9, r2
 801ae0c:	2228      	movs	r2, #40	@ 0x28
 801ae0e:	4693      	mov	fp, r2
 801ae10:	3a27      	subs	r2, #39	@ 0x27
 801ae12:	2601      	movs	r6, #1
 801ae14:	4694      	mov	ip, r2
 801ae16:	4642      	mov	r2, r8
 801ae18:	3301      	adds	r3, #1
 801ae1a:	9304      	str	r3, [sp, #16]
 801ae1c:	2300      	movs	r3, #0
 801ae1e:	9206      	str	r2, [sp, #24]
 801ae20:	9603      	str	r6, [sp, #12]
 801ae22:	9107      	str	r1, [sp, #28]
 801ae24:	9705      	str	r7, [sp, #20]
 801ae26:	44bb      	add	fp, r7
 801ae28:	4688      	mov	r8, r1
 801ae2a:	9d05      	ldr	r5, [sp, #20]
 801ae2c:	e003      	b.n	801ae36 <fn_0801ADD0+0x66>
 801ae2e:	682a      	ldr	r2, [r5, #0]
 801ae30:	2100      	movs	r1, #0
 801ae32:	5e51      	ldrsh	r1, [r2, r1]
 801ae34:	4688      	mov	r8, r1
 801ae36:	4648      	mov	r0, r9
 801ae38:	682f      	ldr	r7, [r5, #0]
 801ae3a:	2104      	movs	r1, #4
 801ae3c:	5e7a      	ldrsh	r2, [r7, r1]
 801ae3e:	1a82      	subs	r2, r0, r2
 801ae40:	0016      	movs	r6, r2
 801ae42:	4660      	mov	r0, ip
 801ae44:	4386      	bics	r6, r0
 801ae46:	2106      	movs	r1, #6
 801ae48:	5e78      	ldrsh	r0, [r7, r1]
 801ae4a:	4651      	mov	r1, sl
 801ae4c:	1a08      	subs	r0, r1, r0
 801ae4e:	4661      	mov	r1, ip
 801ae50:	4442      	add	r2, r8
 801ae52:	3201      	adds	r2, #1
 801ae54:	438a      	bics	r2, r1
 801ae56:	2102      	movs	r1, #2
 801ae58:	5e79      	ldrsh	r1, [r7, r1]
 801ae5a:	9201      	str	r2, [sp, #4]
 801ae5c:	1809      	adds	r1, r1, r0
 801ae5e:	2b00      	cmp	r3, #0
 801ae60:	d017      	beq.n	801ae92 <fn_0801ADD0+0xc2>
 801ae62:	2714      	movs	r7, #20
 801ae64:	5fe2      	ldrsh	r2, [r4, r7]
 801ae66:	9202      	str	r2, [sp, #8]
 801ae68:	4296      	cmp	r6, r2
 801ae6a:	dd00      	ble.n	801ae6e <fn_0801ADD0+0x9e>
 801ae6c:	0016      	movs	r6, r2
 801ae6e:	2216      	movs	r2, #22
 801ae70:	5ea7      	ldrsh	r7, [r4, r2]
 801ae72:	46b8      	mov	r8, r7
 801ae74:	42b8      	cmp	r0, r7
 801ae76:	dd00      	ble.n	801ae7a <fn_0801ADD0+0xaa>
 801ae78:	0038      	movs	r0, r7
 801ae7a:	9a02      	ldr	r2, [sp, #8]
 801ae7c:	189f      	adds	r7, r3, r2
 801ae7e:	9b01      	ldr	r3, [sp, #4]
 801ae80:	42bb      	cmp	r3, r7
 801ae82:	da00      	bge.n	801ae86 <fn_0801ADD0+0xb6>
 801ae84:	9701      	str	r7, [sp, #4]
 801ae86:	221a      	movs	r2, #26
 801ae88:	5ea3      	ldrsh	r3, [r4, r2]
 801ae8a:	4443      	add	r3, r8
 801ae8c:	4299      	cmp	r1, r3
 801ae8e:	da00      	bge.n	801ae92 <fn_0801ADD0+0xc2>
 801ae90:	0019      	movs	r1, r3
 801ae92:	43f3      	mvns	r3, r6
 801ae94:	17db      	asrs	r3, r3, #31
 801ae96:	4033      	ands	r3, r6
 801ae98:	82a3      	strh	r3, [r4, #20]
 801ae9a:	2880      	cmp	r0, #128	@ 0x80
 801ae9c:	da00      	bge.n	801aea0 <fn_0801ADD0+0xd0>
 801ae9e:	2080      	movs	r0, #128	@ 0x80
 801aea0:	9a01      	ldr	r2, [sp, #4]
 801aea2:	82e0      	strh	r0, [r4, #22]
 801aea4:	2af0      	cmp	r2, #240	@ 0xf0
 801aea6:	dd00      	ble.n	801aeaa <fn_0801ADD0+0xda>
 801aea8:	22f0      	movs	r2, #240	@ 0xf0
 801aeaa:	1ad3      	subs	r3, r2, r3
 801aeac:	041b      	lsls	r3, r3, #16
 801aeae:	141b      	asrs	r3, r3, #16
 801aeb0:	8323      	strh	r3, [r4, #24]
 801aeb2:	29a0      	cmp	r1, #160	@ 0xa0
 801aeb4:	dd00      	ble.n	801aeb8 <fn_0801ADD0+0xe8>
 801aeb6:	21a0      	movs	r1, #160	@ 0xa0
 801aeb8:	1a09      	subs	r1, r1, r0
 801aeba:	3504      	adds	r5, #4
 801aebc:	8361      	strh	r1, [r4, #26]
 801aebe:	45ab      	cmp	fp, r5
 801aec0:	d1b5      	bne.n	801ae2e <fn_0801ADD0+0x5e>
 801aec2:	9a03      	ldr	r2, [sp, #12]
 801aec4:	9904      	ldr	r1, [sp, #16]
 801aec6:	3201      	adds	r2, #1
 801aec8:	9203      	str	r2, [sp, #12]
 801aeca:	428a      	cmp	r2, r1
 801aecc:	d007      	beq.n	801aede <fn_0801ADD0+0x10e>
 801aece:	464a      	mov	r2, r9
 801aed0:	9907      	ldr	r1, [sp, #28]
 801aed2:	1a52      	subs	r2, r2, r1
 801aed4:	4691      	mov	r9, r2
 801aed6:	9a06      	ldr	r2, [sp, #24]
 801aed8:	2100      	movs	r1, #0
 801aeda:	5e51      	ldrsh	r1, [r2, r1]
 801aedc:	e7a4      	b.n	801ae28 <fn_0801ADD0+0x58>
 801aede:	b009      	add	sp, #36	@ 0x24
 801aee0:	bcf0      	pop	{r4, r5, r6, r7}
 801aee2:	46bb      	mov	fp, r7
 801aee4:	46b2      	mov	sl, r6
 801aee6:	46a9      	mov	r9, r5
 801aee8:	46a0      	mov	r8, r4
 801aeea:	bcf0      	pop	{r4, r5, r6, r7}
 801aeec:	bc01      	pop	{r0}
 801aeee:	4700      	bx	r0
