fn_08011B58:
 8011b58:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8011b5a:	4b2d      	ldr	r3, [pc, #180]	@ (8011c10 <fn_08011B58+0xb8>)
 8011b5c:	681c      	ldr	r4, [r3, #0]
 8011b5e:	4b2d      	ldr	r3, [pc, #180]	@ (8011c14 <fn_08011B58+0xbc>)
 8011b60:	5ce3      	ldrb	r3, [r4, r3]
 8011b62:	0005      	movs	r5, r0
 8011b64:	2b00      	cmp	r3, #0
 8011b66:	d044      	beq.n	8011bf2 <fn_08011B58+0x9a>
 8011b68:	0026      	movs	r6, r4
 8011b6a:	36e0      	adds	r6, #224	@ 0xe0
 8011b6c:	7933      	ldrb	r3, [r6, #4]
 8011b6e:	2b02      	cmp	r3, #2
 8011b70:	d046      	beq.n	8011c00 <fn_08011B58+0xa8>
 8011b72:	7a6b      	ldrb	r3, [r5, #9]
 8011b74:	7a2a      	ldrb	r2, [r5, #8]
 8011b76:	021b      	lsls	r3, r3, #8
 8011b78:	4313      	orrs	r3, r2
 8011b7a:	d03d      	beq.n	8011bf8 <fn_08011B58+0xa0>
 8011b7c:	2280      	movs	r2, #128	@ 0x80
 8011b7e:	78e9      	ldrb	r1, [r5, #3]
 8011b80:	78ab      	ldrb	r3, [r5, #2]
 8011b82:	7868      	ldrb	r0, [r5, #1]
 8011b84:	0209      	lsls	r1, r1, #8
 8011b86:	4319      	orrs	r1, r3
 8011b88:	782b      	ldrb	r3, [r5, #0]
 8011b8a:	0200      	lsls	r0, r0, #8
 8011b8c:	4318      	orrs	r0, r3
 8011b8e:	0612      	lsls	r2, r2, #24
 8011b90:	2300      	movs	r3, #0
 8011b92:	0409      	lsls	r1, r1, #16
 8011b94:	0400      	lsls	r0, r0, #16
 8011b96:	f7ff f929 	bl	8010dec <fn_08010DEC>
 8011b9a:	0007      	movs	r7, r0
 8011b9c:	7968      	ldrb	r0, [r5, #5]
 8011b9e:	792b      	ldrb	r3, [r5, #4]
 8011ba0:	0200      	lsls	r0, r0, #8
 8011ba2:	4318      	orrs	r0, r3
 8011ba4:	0400      	lsls	r0, r0, #16
 8011ba6:	212d      	movs	r1, #45	@ 0x2d
 8011ba8:	1400      	asrs	r0, r0, #16
 8011baa:	f013 fcf1 	bl	8025590 <fn_08025590>
 8011bae:	2354      	movs	r3, #84	@ 0x54
 8011bb0:	6ab2      	ldr	r2, [r6, #40]	@ 0x28
 8011bb2:	0740      	lsls	r0, r0, #29
 8011bb4:	6238      	str	r0, [r7, #32]
 8011bb6:	52fa      	strh	r2, [r7, r3]
 8011bb8:	0022      	movs	r2, r4
 8011bba:	338c      	adds	r3, #140	@ 0x8c
 8011bbc:	50e7      	str	r7, [r4, r3]
 8011bbe:	2300      	movs	r3, #0
 8011bc0:	3289      	adds	r2, #137	@ 0x89
 8011bc2:	32ff      	adds	r2, #255	@ 0xff
 8011bc4:	7133      	strb	r3, [r6, #4]
 8011bc6:	6013      	str	r3, [r2, #0]
 8011bc8:	6113      	str	r3, [r2, #16]
 8011bca:	6153      	str	r3, [r2, #20]
 8011bcc:	6193      	str	r3, [r2, #24]
 8011bce:	6213      	str	r3, [r2, #32]
 8011bd0:	22a4      	movs	r2, #164	@ 0xa4
 8011bd2:	34ad      	adds	r4, #173	@ 0xad
 8011bd4:	0392      	lsls	r2, r2, #14
 8011bd6:	34ff      	adds	r4, #255	@ 0xff
 8011bd8:	6023      	str	r3, [r4, #0]
 8011bda:	0030      	movs	r0, r6
 8011bdc:	6172      	str	r2, [r6, #20]
 8011bde:	6273      	str	r3, [r6, #36]	@ 0x24
 8011be0:	6233      	str	r3, [r6, #32]
 8011be2:	f001 ffc3 	bl	8013b6c <fn_08013B6C>
 8011be6:	79eb      	ldrb	r3, [r5, #7]
 8011be8:	79aa      	ldrb	r2, [r5, #6]
 8011bea:	021b      	lsls	r3, r3, #8
 8011bec:	4313      	orrs	r3, r2
 8011bee:	2b01      	cmp	r3, #1
 8011bf0:	d009      	beq.n	8011c06 <fn_08011B58+0xae>
 8011bf2:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8011bf4:	bc01      	pop	{r0}
 8011bf6:	4700      	bx	r0
 8011bf8:	4807      	ldr	r0, [pc, #28]	@ (8011c18 <fn_08011B58+0xc0>)
 8011bfa:	f7ee fcd5 	bl	80005a8 <fn_080005A8>
 8011bfe:	e7bd      	b.n	8011b7c <fn_08011B58+0x24>
 8011c00:	f7f1 fb08 	bl	8003214 <fn_08003214>
 8011c04:	e7b5      	b.n	8011b72 <fn_08011B58+0x1a>
 8011c06:	f009 febb 	bl	801b980 <fn_0801B980>
 8011c0a:	f7f2 feb3 	bl	8004974 <fn_08004974>
 8011c0e:	e7f0      	b.n	8011bf2 <fn_08011B58+0x9a>
 8011c10:	030064c4 	.word	0x030064c4	@ data_030064C4
 8011c14:	0000025d 	.word	0x0000025d
 8011c18:	08149f24 	.word	0x08149f24
