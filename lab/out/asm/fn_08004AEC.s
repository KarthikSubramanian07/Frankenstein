fn_08004AEC:
 8004aec:	22fa      	movs	r2, #250	@ 0xfa
 8004aee:	b570      	push	{r4, r5, r6, lr}
 8004af0:	4c17      	ldr	r4, [pc, #92]	@ (8004b50 <fn_08004AEC+0x64>)
 8004af2:	6820      	ldr	r0, [r4, #0]
 8004af4:	0092      	lsls	r2, r2, #2
 8004af6:	5883      	ldr	r3, [r0, r2]
 8004af8:	2b00      	cmp	r3, #0
 8004afa:	d003      	beq.n	8004b04 <fn_08004AEC+0x18>
 8004afc:	3b01      	subs	r3, #1
 8004afe:	5083      	str	r3, [r0, r2]
 8004b00:	2b00      	cmp	r3, #0
 8004b02:	d021      	beq.n	8004b48 <fn_08004AEC+0x5c>
 8004b04:	23ed      	movs	r3, #237	@ 0xed
 8004b06:	00db      	lsls	r3, r3, #3
 8004b08:	58c3      	ldr	r3, [r0, r3]
 8004b0a:	2b00      	cmp	r3, #0
 8004b0c:	d103      	bne.n	8004b16 <fn_08004AEC+0x2a>
 8004b0e:	4b11      	ldr	r3, [pc, #68]	@ (8004b54 <fn_08004AEC+0x68>)
 8004b10:	5cc3      	ldrb	r3, [r0, r3]
 8004b12:	2b00      	cmp	r3, #0
 8004b14:	d015      	beq.n	8004b42 <fn_08004AEC+0x56>
 8004b16:	0005      	movs	r5, r0
 8004b18:	3599      	adds	r5, #153	@ 0x99
 8004b1a:	35ff      	adds	r5, #255	@ 0xff
 8004b1c:	682a      	ldr	r2, [r5, #0]
 8004b1e:	2a00      	cmp	r2, #0
 8004b20:	d00f      	beq.n	8004b42 <fn_08004AEC+0x56>
 8004b22:	23e7      	movs	r3, #231	@ 0xe7
 8004b24:	009b      	lsls	r3, r3, #2
 8004b26:	2100      	movs	r1, #0
 8004b28:	18c0      	adds	r0, r0, r3
 8004b2a:	f7ff fe51 	bl	80047d0 <fn_080047D0>
 8004b2e:	2300      	movs	r3, #0
 8004b30:	22fa      	movs	r2, #250	@ 0xfa
 8004b32:	218c      	movs	r1, #140	@ 0x8c
 8004b34:	602b      	str	r3, [r5, #0]
 8004b36:	6823      	ldr	r3, [r4, #0]
 8004b38:	0092      	lsls	r2, r2, #2
 8004b3a:	5099      	str	r1, [r3, r2]
 8004b3c:	3204      	adds	r2, #4
 8004b3e:	398b      	subs	r1, #139	@ 0x8b
 8004b40:	5299      	strh	r1, [r3, r2]
 8004b42:	bc70      	pop	{r4, r5, r6}
 8004b44:	bc01      	pop	{r0}
 8004b46:	4700      	bx	r0
 8004b48:	3204      	adds	r2, #4
 8004b4a:	5483      	strb	r3, [r0, r2]
 8004b4c:	e7da      	b.n	8004b04 <fn_08004AEC+0x18>
 8004b4e:	46c0      	nop			@ (mov r8, r8)
 8004b50:	030064c4 	.word	0x030064c4	@ data_030064C4
 8004b54:	000003ed 	.word	0x000003ed
