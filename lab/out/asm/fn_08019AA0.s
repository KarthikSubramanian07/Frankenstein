fn_08019AA0:
 8019aa0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8019aa2:	46de      	mov	lr, fp
 8019aa4:	4657      	mov	r7, sl
 8019aa6:	4645      	mov	r5, r8
 8019aa8:	464e      	mov	r6, r9
 8019aaa:	b5e0      	push	{r5, r6, r7, lr}
 8019aac:	b083      	sub	sp, #12
 8019aae:	0005      	movs	r5, r0
 8019ab0:	f00b fde6 	bl	8025680 <fn_08025680>
 8019ab4:	4b2a      	ldr	r3, [pc, #168]	@ (8019b60 <fn_08019AA0+0xc0>)
 8019ab6:	681c      	ldr	r4, [r3, #0]
 8019ab8:	469a      	mov	sl, r3
 8019aba:	23ab      	movs	r3, #171	@ 0xab
 8019abc:	00db      	lsls	r3, r3, #3
 8019abe:	5ce3      	ldrb	r3, [r4, r3]
 8019ac0:	4683      	mov	fp, r0
 8019ac2:	2b00      	cmp	r3, #0
 8019ac4:	d042      	beq.n	8019b4c <fn_08019AA0+0xac>
 8019ac6:	2300      	movs	r3, #0
 8019ac8:	4698      	mov	r8, r3
 8019aca:	239c      	movs	r3, #156	@ 0x9c
 8019acc:	00db      	lsls	r3, r3, #3
 8019ace:	4699      	mov	r9, r3
 8019ad0:	4643      	mov	r3, r8
 8019ad2:	9501      	str	r5, [sp, #4]
 8019ad4:	46a0      	mov	r8, r4
 8019ad6:	001c      	movs	r4, r3
 8019ad8:	e002      	b.n	8019ae0 <fn_08019AA0+0x40>
 8019ada:	4653      	mov	r3, sl
 8019adc:	681b      	ldr	r3, [r3, #0]
 8019ade:	4698      	mov	r8, r3
 8019ae0:	4643      	mov	r3, r8
 8019ae2:	0126      	lsls	r6, r4, #4
 8019ae4:	199f      	adds	r7, r3, r6
 8019ae6:	239b      	movs	r3, #155	@ 0x9b
 8019ae8:	00db      	lsls	r3, r3, #3
 8019aea:	58f9      	ldr	r1, [r7, r3]
 8019aec:	2900      	cmp	r1, #0
 8019aee:	d01c      	beq.n	8019b2a <fn_08019AA0+0x8a>
 8019af0:	4b1c      	ldr	r3, [pc, #112]	@ (8019b64 <fn_08019AA0+0xc4>)
 8019af2:	58fa      	ldr	r2, [r7, r3]
 8019af4:	464b      	mov	r3, r9
 8019af6:	58fd      	ldr	r5, [r7, r3]
 8019af8:	1aad      	subs	r5, r5, r2
 8019afa:	2de0      	cmp	r5, #224	@ 0xe0
 8019afc:	dd00      	ble.n	8019b00 <fn_08019AA0+0x60>
 8019afe:	25e0      	movs	r5, #224	@ 0xe0
 8019b00:	4b19      	ldr	r3, [pc, #100]	@ (8019b68 <fn_08019AA0+0xc8>)
 8019b02:	1889      	adds	r1, r1, r2
 8019b04:	58fb      	ldr	r3, [r7, r3]
 8019b06:	002a      	movs	r2, r5
 8019b08:	4658      	mov	r0, fp
 8019b0a:	f00b fdc5 	bl	8025698 <fn_08025698>
 8019b0e:	4b15      	ldr	r3, [pc, #84]	@ (8019b64 <fn_08019AA0+0xc4>)
 8019b10:	4446      	add	r6, r8
 8019b12:	58f2      	ldr	r2, [r6, r3]
 8019b14:	18ad      	adds	r5, r5, r2
 8019b16:	50f5      	str	r5, [r6, r3]
 8019b18:	464b      	mov	r3, r9
 8019b1a:	58fb      	ldr	r3, [r7, r3]
 8019b1c:	429d      	cmp	r5, r3
 8019b1e:	db04      	blt.n	8019b2a <fn_08019AA0+0x8a>
 8019b20:	239b      	movs	r3, #155	@ 0x9b
 8019b22:	00db      	lsls	r3, r3, #3
 8019b24:	18f6      	adds	r6, r6, r3
 8019b26:	2300      	movs	r3, #0
 8019b28:	6033      	str	r3, [r6, #0]
 8019b2a:	3401      	adds	r4, #1
 8019b2c:	2c08      	cmp	r4, #8
 8019b2e:	d1d4      	bne.n	8019ada <fn_08019AA0+0x3a>
 8019b30:	22e0      	movs	r2, #224	@ 0xe0
 8019b32:	4659      	mov	r1, fp
 8019b34:	9801      	ldr	r0, [sp, #4]
 8019b36:	f00b fd7d 	bl	8025634 <fn_08025634>
 8019b3a:	b003      	add	sp, #12
 8019b3c:	bcf0      	pop	{r4, r5, r6, r7}
 8019b3e:	46bb      	mov	fp, r7
 8019b40:	46b2      	mov	sl, r6
 8019b42:	46a9      	mov	r9, r5
 8019b44:	46a0      	mov	r8, r4
 8019b46:	bcf0      	pop	{r4, r5, r6, r7}
 8019b48:	bc01      	pop	{r0}
 8019b4a:	4700      	bx	r0
 8019b4c:	4b07      	ldr	r3, [pc, #28]	@ (8019b6c <fn_08019AA0+0xcc>)
 8019b4e:	22e0      	movs	r2, #224	@ 0xe0
 8019b50:	58e0      	ldr	r0, [r4, r3]
 8019b52:	4659      	mov	r1, fp
 8019b54:	f004 fc32 	bl	801e3bc <fn_0801E3BC>
 8019b58:	4653      	mov	r3, sl
 8019b5a:	681c      	ldr	r4, [r3, #0]
 8019b5c:	e7b3      	b.n	8019ac6 <fn_08019AA0+0x26>
 8019b5e:	46c0      	nop			@ (mov r8, r8)
 8019b60:	030064c4 	.word	0x030064c4
 8019b64:	000004dc 	.word	0x000004dc
 8019b68:	000004e4 	.word	0x000004e4
 8019b6c:	000004d4 	.word	0x000004d4
