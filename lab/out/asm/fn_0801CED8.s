fn_0801CED8:
 801ced8:	b5f0      	push	{r4, r5, r6, r7, lr}
 801ceda:	46c6      	mov	lr, r8
 801cedc:	4e57      	ldr	r6, [pc, #348]	@ (801d03c <fn_0801CED8+0x164>)
 801cede:	b500      	push	{lr}
 801cee0:	6832      	ldr	r2, [r6, #0]
 801cee2:	4b57      	ldr	r3, [pc, #348]	@ (801d040 <fn_0801CED8+0x168>)
 801cee4:	58d3      	ldr	r3, [r2, r3]
 801cee6:	2102      	movs	r1, #2
 801cee8:	5e59      	ldrsh	r1, [r3, r1]
 801ceea:	004b      	lsls	r3, r1, #1
 801ceec:	185b      	adds	r3, r3, r1
 801ceee:	0fdc      	lsrs	r4, r3, #31
 801cef0:	18e4      	adds	r4, r4, r3
 801cef2:	2394      	movs	r3, #148	@ 0x94
 801cef4:	5cd1      	ldrb	r1, [r2, r3]
 801cef6:	b084      	sub	sp, #16
 801cef8:	1064      	asrs	r4, r4, #1
 801cefa:	2902      	cmp	r1, #2
 801cefc:	d100      	bne.n	801cf00 <fn_0801CED8+0x28>
 801cefe:	e077      	b.n	801cff0 <fn_0801CED8+0x118>
 801cf00:	4b50      	ldr	r3, [pc, #320]	@ (801d044 <fn_0801CED8+0x16c>)
 801cf02:	58d3      	ldr	r3, [r2, r3]
 801cf04:	681b      	ldr	r3, [r3, #0]
 801cf06:	2903      	cmp	r1, #3
 801cf08:	d102      	bne.n	801cf10 <fn_0801CED8+0x38>
 801cf0a:	2b03      	cmp	r3, #3
 801cf0c:	d100      	bne.n	801cf10 <fn_0801CED8+0x38>
 801cf0e:	e06f      	b.n	801cff0 <fn_0801CED8+0x118>
 801cf10:	ad01      	add	r5, sp, #4
 801cf12:	2109      	movs	r1, #9
 801cf14:	0028      	movs	r0, r5
 801cf16:	4a4c      	ldr	r2, [pc, #304]	@ (801d048 <fn_0801CED8+0x170>)
 801cf18:	f7e8 fa9e 	bl	8005458 <fn_08005458>
 801cf1c:	0028      	movs	r0, r5
 801cf1e:	f000 fb07 	bl	801d530 <fn_0801D530>
 801cf22:	f7ff f9a7 	bl	801c274 <fn_0801C274>
 801cf26:	f7ff fbf1 	bl	801c70c <fn_0801C70C>
 801cf2a:	4d48      	ldr	r5, [pc, #288]	@ (801d04c <fn_0801CED8+0x174>)
 801cf2c:	0028      	movs	r0, r5
 801cf2e:	3030      	adds	r0, #48	@ 0x30
 801cf30:	f000 fafe 	bl	801d530 <fn_0801D530>
 801cf34:	2200      	movs	r2, #0
 801cf36:	0003      	movs	r3, r0
 801cf38:	2132      	movs	r1, #50	@ 0x32
 801cf3a:	2032      	movs	r0, #50	@ 0x32
 801cf3c:	f7ff f950 	bl	801c1e0 <fn_0801C1E0>
 801cf40:	6832      	ldr	r2, [r6, #0]
 801cf42:	4b43      	ldr	r3, [pc, #268]	@ (801d050 <fn_0801CED8+0x178>)
 801cf44:	58d1      	ldr	r1, [r2, r3]
 801cf46:	2900      	cmp	r1, #0
 801cf48:	dd00      	ble.n	801cf4c <fn_0801CED8+0x74>
 801cf4a:	e073      	b.n	801d034 <fn_0801CED8+0x15c>
 801cf4c:	0028      	movs	r0, r5
 801cf4e:	0027      	movs	r7, r4
 801cf50:	3038      	adds	r0, #56	@ 0x38
 801cf52:	f000 faed 	bl	801d530 <fn_0801D530>
 801cf56:	3732      	adds	r7, #50	@ 0x32
 801cf58:	0003      	movs	r3, r0
 801cf5a:	2200      	movs	r2, #0
 801cf5c:	0039      	movs	r1, r7
 801cf5e:	2032      	movs	r0, #50	@ 0x32
 801cf60:	f7ff f93e 	bl	801c1e0 <fn_0801C1E0>
 801cf64:	6832      	ldr	r2, [r6, #0]
 801cf66:	4b3b      	ldr	r3, [pc, #236]	@ (801d054 <fn_0801CED8+0x17c>)
 801cf68:	58d1      	ldr	r1, [r2, r3]
 801cf6a:	2900      	cmp	r1, #0
 801cf6c:	dc5e      	bgt.n	801d02c <fn_0801CED8+0x154>
 801cf6e:	0028      	movs	r0, r5
 801cf70:	3040      	adds	r0, #64	@ 0x40
 801cf72:	f000 fadd 	bl	801d530 <fn_0801D530>
 801cf76:	3419      	adds	r4, #25
 801cf78:	0003      	movs	r3, r0
 801cf7a:	2200      	movs	r2, #0
 801cf7c:	0061      	lsls	r1, r4, #1
 801cf7e:	2032      	movs	r0, #50	@ 0x32
 801cf80:	f7ff f92e 	bl	801c1e0 <fn_0801C1E0>
 801cf84:	6833      	ldr	r3, [r6, #0]
 801cf86:	4a34      	ldr	r2, [pc, #208]	@ (801d058 <fn_0801CED8+0x180>)
 801cf88:	5899      	ldr	r1, [r3, r2]
 801cf8a:	2900      	cmp	r1, #0
 801cf8c:	dc49      	bgt.n	801d022 <fn_0801CED8+0x14a>
 801cf8e:	0028      	movs	r0, r5
 801cf90:	4a32      	ldr	r2, [pc, #200]	@ (801d05c <fn_0801CED8+0x184>)
 801cf92:	589c      	ldr	r4, [r3, r2]
 801cf94:	4a32      	ldr	r2, [pc, #200]	@ (801d060 <fn_0801CED8+0x188>)
 801cf96:	589f      	ldr	r7, [r3, r2]
 801cf98:	4a32      	ldr	r2, [pc, #200]	@ (801d064 <fn_0801CED8+0x18c>)
 801cf9a:	589b      	ldr	r3, [r3, r2]
 801cf9c:	3048      	adds	r0, #72	@ 0x48
 801cf9e:	4698      	mov	r8, r3
 801cfa0:	f000 fac6 	bl	801d530 <fn_0801D530>
 801cfa4:	2200      	movs	r2, #0
 801cfa6:	0003      	movs	r3, r0
 801cfa8:	21a0      	movs	r1, #160	@ 0xa0
 801cfaa:	2008      	movs	r0, #8
 801cfac:	f7ff f918 	bl	801c1e0 <fn_0801C1E0>
 801cfb0:	0022      	movs	r2, r4
 801cfb2:	21a0      	movs	r1, #160	@ 0xa0
 801cfb4:	2098      	movs	r0, #152	@ 0x98
 801cfb6:	f7ff faa9 	bl	801c50c <fn_0801C50C>
 801cfba:	0028      	movs	r0, r5
 801cfbc:	3050      	adds	r0, #80	@ 0x50
 801cfbe:	f000 fab7 	bl	801d530 <fn_0801D530>
 801cfc2:	2200      	movs	r2, #0
 801cfc4:	0003      	movs	r3, r0
 801cfc6:	21b4      	movs	r1, #180	@ 0xb4
 801cfc8:	2008      	movs	r0, #8
 801cfca:	f7ff f909 	bl	801c1e0 <fn_0801C1E0>
 801cfce:	003a      	movs	r2, r7
 801cfd0:	21b4      	movs	r1, #180	@ 0xb4
 801cfd2:	2098      	movs	r0, #152	@ 0x98
 801cfd4:	f7ff fa9a 	bl	801c50c <fn_0801C50C>
 801cfd8:	6832      	ldr	r2, [r6, #0]
 801cfda:	4b1a      	ldr	r3, [pc, #104]	@ (801d044 <fn_0801CED8+0x16c>)
 801cfdc:	58d3      	ldr	r3, [r2, r3]
 801cfde:	681b      	ldr	r3, [r3, #0]
 801cfe0:	2b02      	cmp	r3, #2
 801cfe2:	dd0d      	ble.n	801d000 <fn_0801CED8+0x128>
 801cfe4:	b004      	add	sp, #16
 801cfe6:	bc80      	pop	{r7}
 801cfe8:	46b8      	mov	r8, r7
 801cfea:	bcf0      	pop	{r4, r5, r6, r7}
 801cfec:	bc01      	pop	{r0}
 801cfee:	4700      	bx	r0
 801cff0:	ad01      	add	r5, sp, #4
 801cff2:	002a      	movs	r2, r5
 801cff4:	4b1c      	ldr	r3, [pc, #112]	@ (801d068 <fn_0801CED8+0x190>)
 801cff6:	cb03      	ldmia	r3!, {r0, r1}
 801cff8:	c203      	stmia	r2!, {r0, r1}
 801cffa:	781b      	ldrb	r3, [r3, #0]
 801cffc:	7013      	strb	r3, [r2, #0]
 801cffe:	e78d      	b.n	801cf1c <fn_0801CED8+0x44>
 801d000:	0028      	movs	r0, r5
 801d002:	3058      	adds	r0, #88	@ 0x58
 801d004:	f000 fa94 	bl	801d530 <fn_0801D530>
 801d008:	2200      	movs	r2, #0
 801d00a:	0003      	movs	r3, r0
 801d00c:	21a0      	movs	r1, #160	@ 0xa0
 801d00e:	20a8      	movs	r0, #168	@ 0xa8
 801d010:	f7ff f8e6 	bl	801c1e0 <fn_0801C1E0>
 801d014:	209c      	movs	r0, #156	@ 0x9c
 801d016:	4642      	mov	r2, r8
 801d018:	21a0      	movs	r1, #160	@ 0xa0
 801d01a:	0040      	lsls	r0, r0, #1
 801d01c:	f7ff fa76 	bl	801c50c <fn_0801C50C>
 801d020:	e7e0      	b.n	801cfe4 <fn_0801CED8+0x10c>
 801d022:	0060      	lsls	r0, r4, #1
 801d024:	f7ff fb00 	bl	801c628 <fn_0801C628>
 801d028:	6833      	ldr	r3, [r6, #0]
 801d02a:	e7b0      	b.n	801cf8e <fn_0801CED8+0xb6>
 801d02c:	0038      	movs	r0, r7
 801d02e:	f7ff fafb 	bl	801c628 <fn_0801C628>
 801d032:	e79c      	b.n	801cf6e <fn_0801CED8+0x96>
 801d034:	2032      	movs	r0, #50	@ 0x32
 801d036:	f7ff faf7 	bl	801c628 <fn_0801C628>
 801d03a:	e787      	b.n	801cf4c <fn_0801CED8+0x74>
 801d03c:	030064c4 	.word	0x030064c4
 801d040:	00005a60 	.word	0x00005a60
 801d044:	00005a40 	.word	0x00005a40
 801d048:	0814aa30 	.word	0x0814aa30
 801d04c:	081478d8 	.word	0x081478d8
 801d050:	00005a8c 	.word	0x00005a8c
 801d054:	00005a90 	.word	0x00005a90
 801d058:	00005a94 	.word	0x00005a94
 801d05c:	00005a50 	.word	0x00005a50
 801d060:	00005a54 	.word	0x00005a54
 801d064:	00005a58 	.word	0x00005a58
 801d068:	0814aa38 	.word	0x0814aa38
