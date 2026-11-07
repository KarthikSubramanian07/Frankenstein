fn_0801AD1C:
 801ad1c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801ad1e:	4657      	mov	r7, sl
 801ad20:	4645      	mov	r5, r8
 801ad22:	46de      	mov	lr, fp
 801ad24:	464e      	mov	r6, r9
 801ad26:	b5e0      	push	{r5, r6, r7, lr}
 801ad28:	4692      	mov	sl, r2
 801ad2a:	b089      	sub	sp, #36	@ 0x24
 801ad2c:	001f      	movs	r7, r3
 801ad2e:	8042      	strh	r2, [r0, #2]
 801ad30:	2200      	movs	r2, #0
 801ad32:	000d      	movs	r5, r1
 801ad34:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
 801ad36:	8001      	strh	r1, [r0, #0]
 801ad38:	9912      	ldr	r1, [sp, #72]	@ 0x48
 801ad3a:	0004      	movs	r4, r0
 801ad3c:	6082      	str	r2, [r0, #8]
 801ad3e:	8083      	strh	r3, [r0, #4]
 801ad40:	60c1      	str	r1, [r0, #12]
 801ad42:	6107      	str	r7, [r0, #16]
 801ad44:	8302      	strh	r2, [r0, #24]
 801ad46:	7702      	strb	r2, [r0, #28]
 801ad48:	2b00      	cmp	r3, #0
 801ad4a:	dd6e      	ble.n	801ae2a <fn_0801AD1C+0x10e>
 801ad4c:	683a      	ldr	r2, [r7, #0]
 801ad4e:	4690      	mov	r8, r2
 801ad50:	2100      	movs	r1, #0
 801ad52:	5e51      	ldrsh	r1, [r2, r1]
 801ad54:	1a6a      	subs	r2, r5, r1
 801ad56:	4691      	mov	r9, r2
 801ad58:	2228      	movs	r2, #40	@ 0x28
 801ad5a:	4693      	mov	fp, r2
 801ad5c:	3a27      	subs	r2, #39	@ 0x27
 801ad5e:	2601      	movs	r6, #1
 801ad60:	4694      	mov	ip, r2
 801ad62:	4642      	mov	r2, r8
 801ad64:	3301      	adds	r3, #1
 801ad66:	9304      	str	r3, [sp, #16]
 801ad68:	2300      	movs	r3, #0
 801ad6a:	9206      	str	r2, [sp, #24]
 801ad6c:	9603      	str	r6, [sp, #12]
 801ad6e:	9107      	str	r1, [sp, #28]
 801ad70:	9705      	str	r7, [sp, #20]
 801ad72:	44bb      	add	fp, r7
 801ad74:	4688      	mov	r8, r1
 801ad76:	9d05      	ldr	r5, [sp, #20]
 801ad78:	e003      	b.n	801ad82 <fn_0801AD1C+0x66>
 801ad7a:	682a      	ldr	r2, [r5, #0]
 801ad7c:	2100      	movs	r1, #0
 801ad7e:	5e51      	ldrsh	r1, [r2, r1]
 801ad80:	4688      	mov	r8, r1
 801ad82:	4648      	mov	r0, r9
 801ad84:	682f      	ldr	r7, [r5, #0]
 801ad86:	2104      	movs	r1, #4
 801ad88:	5e7a      	ldrsh	r2, [r7, r1]
 801ad8a:	1a82      	subs	r2, r0, r2
 801ad8c:	0016      	movs	r6, r2
 801ad8e:	4660      	mov	r0, ip
 801ad90:	4386      	bics	r6, r0
 801ad92:	2106      	movs	r1, #6
 801ad94:	5e78      	ldrsh	r0, [r7, r1]
 801ad96:	4651      	mov	r1, sl
 801ad98:	1a08      	subs	r0, r1, r0
 801ad9a:	4661      	mov	r1, ip
 801ad9c:	4442      	add	r2, r8
 801ad9e:	3201      	adds	r2, #1
 801ada0:	438a      	bics	r2, r1
 801ada2:	2102      	movs	r1, #2
 801ada4:	5e79      	ldrsh	r1, [r7, r1]
 801ada6:	9201      	str	r2, [sp, #4]
 801ada8:	1809      	adds	r1, r1, r0
 801adaa:	2b00      	cmp	r3, #0
 801adac:	d017      	beq.n	801adde <fn_0801AD1C+0xc2>
 801adae:	2714      	movs	r7, #20
 801adb0:	5fe2      	ldrsh	r2, [r4, r7]
 801adb2:	9202      	str	r2, [sp, #8]
 801adb4:	4296      	cmp	r6, r2
 801adb6:	dd00      	ble.n	801adba <fn_0801AD1C+0x9e>
 801adb8:	0016      	movs	r6, r2
 801adba:	2216      	movs	r2, #22
 801adbc:	5ea7      	ldrsh	r7, [r4, r2]
 801adbe:	46b8      	mov	r8, r7
 801adc0:	42b8      	cmp	r0, r7
 801adc2:	dd00      	ble.n	801adc6 <fn_0801AD1C+0xaa>
 801adc4:	0038      	movs	r0, r7
 801adc6:	9a02      	ldr	r2, [sp, #8]
 801adc8:	189f      	adds	r7, r3, r2
 801adca:	9b01      	ldr	r3, [sp, #4]
 801adcc:	42bb      	cmp	r3, r7
 801adce:	da00      	bge.n	801add2 <fn_0801AD1C+0xb6>
 801add0:	9701      	str	r7, [sp, #4]
 801add2:	221a      	movs	r2, #26
 801add4:	5ea3      	ldrsh	r3, [r4, r2]
 801add6:	4443      	add	r3, r8
 801add8:	4299      	cmp	r1, r3
 801adda:	da00      	bge.n	801adde <fn_0801AD1C+0xc2>
 801addc:	0019      	movs	r1, r3
 801adde:	43f3      	mvns	r3, r6
 801ade0:	17db      	asrs	r3, r3, #31
 801ade2:	4033      	ands	r3, r6
 801ade4:	82a3      	strh	r3, [r4, #20]
 801ade6:	2880      	cmp	r0, #128	@ 0x80
 801ade8:	da00      	bge.n	801adec <fn_0801AD1C+0xd0>
 801adea:	2080      	movs	r0, #128	@ 0x80
 801adec:	9a01      	ldr	r2, [sp, #4]
 801adee:	82e0      	strh	r0, [r4, #22]
 801adf0:	2af0      	cmp	r2, #240	@ 0xf0
 801adf2:	dd00      	ble.n	801adf6 <fn_0801AD1C+0xda>
 801adf4:	22f0      	movs	r2, #240	@ 0xf0
 801adf6:	1ad3      	subs	r3, r2, r3
 801adf8:	041b      	lsls	r3, r3, #16
 801adfa:	141b      	asrs	r3, r3, #16
 801adfc:	8323      	strh	r3, [r4, #24]
 801adfe:	29a0      	cmp	r1, #160	@ 0xa0
 801ae00:	dd00      	ble.n	801ae04 <fn_0801AD1C+0xe8>
 801ae02:	21a0      	movs	r1, #160	@ 0xa0
 801ae04:	1a09      	subs	r1, r1, r0
 801ae06:	3504      	adds	r5, #4
 801ae08:	8361      	strh	r1, [r4, #26]
 801ae0a:	45ab      	cmp	fp, r5
 801ae0c:	d1b5      	bne.n	801ad7a <fn_0801AD1C+0x5e>
 801ae0e:	9a03      	ldr	r2, [sp, #12]
 801ae10:	9904      	ldr	r1, [sp, #16]
 801ae12:	3201      	adds	r2, #1
 801ae14:	9203      	str	r2, [sp, #12]
 801ae16:	428a      	cmp	r2, r1
 801ae18:	d007      	beq.n	801ae2a <fn_0801AD1C+0x10e>
 801ae1a:	464a      	mov	r2, r9
 801ae1c:	9907      	ldr	r1, [sp, #28]
 801ae1e:	1a52      	subs	r2, r2, r1
 801ae20:	4691      	mov	r9, r2
 801ae22:	9a06      	ldr	r2, [sp, #24]
 801ae24:	2100      	movs	r1, #0
 801ae26:	5e51      	ldrsh	r1, [r2, r1]
 801ae28:	e7a4      	b.n	801ad74 <fn_0801AD1C+0x58>
 801ae2a:	b009      	add	sp, #36	@ 0x24
 801ae2c:	bcf0      	pop	{r4, r5, r6, r7}
 801ae2e:	46bb      	mov	fp, r7
 801ae30:	46b2      	mov	sl, r6
 801ae32:	46a9      	mov	r9, r5
 801ae34:	46a0      	mov	r8, r4
 801ae36:	bcf0      	pop	{r4, r5, r6, r7}
 801ae38:	bc01      	pop	{r0}
 801ae3a:	4700      	bx	r0
