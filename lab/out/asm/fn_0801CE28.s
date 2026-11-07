fn_0801CE28:
 801ce28:	b5f0      	push	{r4, r5, r6, r7, lr}
 801ce2a:	46c6      	mov	lr, r8
 801ce2c:	4e57      	ldr	r6, [pc, #348]	@ (801cf8c <fn_0801CE28+0x164>)
 801ce2e:	b500      	push	{lr}
 801ce30:	6832      	ldr	r2, [r6, #0]
 801ce32:	4b57      	ldr	r3, [pc, #348]	@ (801cf90 <fn_0801CE28+0x168>)
 801ce34:	58d3      	ldr	r3, [r2, r3]
 801ce36:	2102      	movs	r1, #2
 801ce38:	5e59      	ldrsh	r1, [r3, r1]
 801ce3a:	004b      	lsls	r3, r1, #1
 801ce3c:	185b      	adds	r3, r3, r1
 801ce3e:	0fdc      	lsrs	r4, r3, #31
 801ce40:	18e4      	adds	r4, r4, r3
 801ce42:	2394      	movs	r3, #148	@ 0x94
 801ce44:	5cd1      	ldrb	r1, [r2, r3]
 801ce46:	b084      	sub	sp, #16
 801ce48:	1064      	asrs	r4, r4, #1
 801ce4a:	2902      	cmp	r1, #2
 801ce4c:	d100      	bne.n	801ce50 <fn_0801CE28+0x28>
 801ce4e:	e077      	b.n	801cf40 <fn_0801CE28+0x118>
 801ce50:	4b50      	ldr	r3, [pc, #320]	@ (801cf94 <fn_0801CE28+0x16c>)
 801ce52:	58d3      	ldr	r3, [r2, r3]
 801ce54:	681b      	ldr	r3, [r3, #0]
 801ce56:	2903      	cmp	r1, #3
 801ce58:	d102      	bne.n	801ce60 <fn_0801CE28+0x38>
 801ce5a:	2b03      	cmp	r3, #3
 801ce5c:	d100      	bne.n	801ce60 <fn_0801CE28+0x38>
 801ce5e:	e06f      	b.n	801cf40 <fn_0801CE28+0x118>
 801ce60:	ad01      	add	r5, sp, #4
 801ce62:	2109      	movs	r1, #9
 801ce64:	0028      	movs	r0, r5
 801ce66:	4a4c      	ldr	r2, [pc, #304]	@ (801cf98 <fn_0801CE28+0x170>)
 801ce68:	f7e8 faf6 	bl	8005458 <fn_08005458>
 801ce6c:	0028      	movs	r0, r5
 801ce6e:	f000 fb07 	bl	801d480 <fn_0801D480>
 801ce72:	f7ff f9a7 	bl	801c1c4 <fn_0801C1C4>
 801ce76:	f7ff fbf1 	bl	801c65c <fn_0801C65C>
 801ce7a:	4d48      	ldr	r5, [pc, #288]	@ (801cf9c <fn_0801CE28+0x174>)
 801ce7c:	0028      	movs	r0, r5
 801ce7e:	3030      	adds	r0, #48	@ 0x30
 801ce80:	f000 fafe 	bl	801d480 <fn_0801D480>
 801ce84:	2200      	movs	r2, #0
 801ce86:	0003      	movs	r3, r0
 801ce88:	2132      	movs	r1, #50	@ 0x32
 801ce8a:	2032      	movs	r0, #50	@ 0x32
 801ce8c:	f7ff f950 	bl	801c130 <fn_0801C130>
 801ce90:	6832      	ldr	r2, [r6, #0]
 801ce92:	4b43      	ldr	r3, [pc, #268]	@ (801cfa0 <fn_0801CE28+0x178>)
 801ce94:	58d1      	ldr	r1, [r2, r3]
 801ce96:	2900      	cmp	r1, #0
 801ce98:	dd00      	ble.n	801ce9c <fn_0801CE28+0x74>
 801ce9a:	e073      	b.n	801cf84 <fn_0801CE28+0x15c>
 801ce9c:	0028      	movs	r0, r5
 801ce9e:	0027      	movs	r7, r4
 801cea0:	3038      	adds	r0, #56	@ 0x38
 801cea2:	f000 faed 	bl	801d480 <fn_0801D480>
 801cea6:	3732      	adds	r7, #50	@ 0x32
 801cea8:	0003      	movs	r3, r0
 801ceaa:	2200      	movs	r2, #0
 801ceac:	0039      	movs	r1, r7
 801ceae:	2032      	movs	r0, #50	@ 0x32
 801ceb0:	f7ff f93e 	bl	801c130 <fn_0801C130>
 801ceb4:	6832      	ldr	r2, [r6, #0]
 801ceb6:	4b3b      	ldr	r3, [pc, #236]	@ (801cfa4 <fn_0801CE28+0x17c>)
 801ceb8:	58d1      	ldr	r1, [r2, r3]
 801ceba:	2900      	cmp	r1, #0
 801cebc:	dc5e      	bgt.n	801cf7c <fn_0801CE28+0x154>
 801cebe:	0028      	movs	r0, r5
 801cec0:	3040      	adds	r0, #64	@ 0x40
 801cec2:	f000 fadd 	bl	801d480 <fn_0801D480>
 801cec6:	3419      	adds	r4, #25
 801cec8:	0003      	movs	r3, r0
 801ceca:	2200      	movs	r2, #0
 801cecc:	0061      	lsls	r1, r4, #1
 801cece:	2032      	movs	r0, #50	@ 0x32
 801ced0:	f7ff f92e 	bl	801c130 <fn_0801C130>
 801ced4:	6833      	ldr	r3, [r6, #0]
 801ced6:	4a34      	ldr	r2, [pc, #208]	@ (801cfa8 <fn_0801CE28+0x180>)
 801ced8:	5899      	ldr	r1, [r3, r2]
 801ceda:	2900      	cmp	r1, #0
 801cedc:	dc49      	bgt.n	801cf72 <fn_0801CE28+0x14a>
 801cede:	0028      	movs	r0, r5
 801cee0:	4a32      	ldr	r2, [pc, #200]	@ (801cfac <fn_0801CE28+0x184>)
 801cee2:	589c      	ldr	r4, [r3, r2]
 801cee4:	4a32      	ldr	r2, [pc, #200]	@ (801cfb0 <fn_0801CE28+0x188>)
 801cee6:	589f      	ldr	r7, [r3, r2]
 801cee8:	4a32      	ldr	r2, [pc, #200]	@ (801cfb4 <fn_0801CE28+0x18c>)
 801ceea:	589b      	ldr	r3, [r3, r2]
 801ceec:	3048      	adds	r0, #72	@ 0x48
 801ceee:	4698      	mov	r8, r3
 801cef0:	f000 fac6 	bl	801d480 <fn_0801D480>
 801cef4:	2200      	movs	r2, #0
 801cef6:	0003      	movs	r3, r0
 801cef8:	21a0      	movs	r1, #160	@ 0xa0
 801cefa:	2008      	movs	r0, #8
 801cefc:	f7ff f918 	bl	801c130 <fn_0801C130>
 801cf00:	0022      	movs	r2, r4
 801cf02:	21a0      	movs	r1, #160	@ 0xa0
 801cf04:	2098      	movs	r0, #152	@ 0x98
 801cf06:	f7ff faa9 	bl	801c45c <fn_0801C45C>
 801cf0a:	0028      	movs	r0, r5
 801cf0c:	3050      	adds	r0, #80	@ 0x50
 801cf0e:	f000 fab7 	bl	801d480 <fn_0801D480>
 801cf12:	2200      	movs	r2, #0
 801cf14:	0003      	movs	r3, r0
 801cf16:	21b4      	movs	r1, #180	@ 0xb4
 801cf18:	2008      	movs	r0, #8
 801cf1a:	f7ff f909 	bl	801c130 <fn_0801C130>
 801cf1e:	003a      	movs	r2, r7
 801cf20:	21b4      	movs	r1, #180	@ 0xb4
 801cf22:	2098      	movs	r0, #152	@ 0x98
 801cf24:	f7ff fa9a 	bl	801c45c <fn_0801C45C>
 801cf28:	6832      	ldr	r2, [r6, #0]
 801cf2a:	4b1a      	ldr	r3, [pc, #104]	@ (801cf94 <fn_0801CE28+0x16c>)
 801cf2c:	58d3      	ldr	r3, [r2, r3]
 801cf2e:	681b      	ldr	r3, [r3, #0]
 801cf30:	2b02      	cmp	r3, #2
 801cf32:	dd0d      	ble.n	801cf50 <fn_0801CE28+0x128>
 801cf34:	b004      	add	sp, #16
 801cf36:	bc80      	pop	{r7}
 801cf38:	46b8      	mov	r8, r7
 801cf3a:	bcf0      	pop	{r4, r5, r6, r7}
 801cf3c:	bc01      	pop	{r0}
 801cf3e:	4700      	bx	r0
 801cf40:	ad01      	add	r5, sp, #4
 801cf42:	002a      	movs	r2, r5
 801cf44:	4b1c      	ldr	r3, [pc, #112]	@ (801cfb8 <fn_0801CE28+0x190>)
 801cf46:	cb03      	ldmia	r3!, {r0, r1}
 801cf48:	c203      	stmia	r2!, {r0, r1}
 801cf4a:	781b      	ldrb	r3, [r3, #0]
 801cf4c:	7013      	strb	r3, [r2, #0]
 801cf4e:	e78d      	b.n	801ce6c <fn_0801CE28+0x44>
 801cf50:	0028      	movs	r0, r5
 801cf52:	3058      	adds	r0, #88	@ 0x58
 801cf54:	f000 fa94 	bl	801d480 <fn_0801D480>
 801cf58:	2200      	movs	r2, #0
 801cf5a:	0003      	movs	r3, r0
 801cf5c:	21a0      	movs	r1, #160	@ 0xa0
 801cf5e:	20a8      	movs	r0, #168	@ 0xa8
 801cf60:	f7ff f8e6 	bl	801c130 <fn_0801C130>
 801cf64:	209c      	movs	r0, #156	@ 0x9c
 801cf66:	4642      	mov	r2, r8
 801cf68:	21a0      	movs	r1, #160	@ 0xa0
 801cf6a:	0040      	lsls	r0, r0, #1
 801cf6c:	f7ff fa76 	bl	801c45c <fn_0801C45C>
 801cf70:	e7e0      	b.n	801cf34 <fn_0801CE28+0x10c>
 801cf72:	0060      	lsls	r0, r4, #1
 801cf74:	f7ff fb00 	bl	801c578 <fn_0801C578>
 801cf78:	6833      	ldr	r3, [r6, #0]
 801cf7a:	e7b0      	b.n	801cede <fn_0801CE28+0xb6>
 801cf7c:	0038      	movs	r0, r7
 801cf7e:	f7ff fafb 	bl	801c578 <fn_0801C578>
 801cf82:	e79c      	b.n	801cebe <fn_0801CE28+0x96>
 801cf84:	2032      	movs	r0, #50	@ 0x32
 801cf86:	f7ff faf7 	bl	801c578 <fn_0801C578>
 801cf8a:	e787      	b.n	801ce9c <fn_0801CE28+0x74>
 801cf8c:	030064c4 	.word	0x030064c4	@ data_030064C4
 801cf90:	00005a60 	.word	0x00005a60
 801cf94:	00005a40 	.word	0x00005a40
 801cf98:	0814a95c 	.word	0x0814a95c
 801cf9c:	08147804 	.word	0x08147804	@ data_08147804
 801cfa0:	00005a8c 	.word	0x00005a8c
 801cfa4:	00005a90 	.word	0x00005a90
 801cfa8:	00005a94 	.word	0x00005a94
 801cfac:	00005a50 	.word	0x00005a50
 801cfb0:	00005a54 	.word	0x00005a54
 801cfb4:	00005a58 	.word	0x00005a58
 801cfb8:	0814a964 	.word	0x0814a964
