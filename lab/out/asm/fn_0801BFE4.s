fn_0801BFE4:
 801bfe4:	4b20      	ldr	r3, [pc, #128]	@ (801c068 <fn_0801BFE4+0x84>)
 801bfe6:	4a21      	ldr	r2, [pc, #132]	@ (801c06c <fn_0801BFE4+0x88>)
 801bfe8:	681b      	ldr	r3, [r3, #0]
 801bfea:	b5f0      	push	{r4, r5, r6, r7, lr}
 801bfec:	589d      	ldr	r5, [r3, r2]
 801bfee:	46d6      	mov	lr, sl
 801bff0:	4646      	mov	r6, r8
 801bff2:	464f      	mov	r7, r9
 801bff4:	2288      	movs	r2, #136	@ 0x88
 801bff6:	b5c0      	push	{r6, r7, lr}
 801bff8:	0152      	lsls	r2, r2, #5
 801bffa:	589c      	ldr	r4, [r3, r2]
 801bffc:	f7fd f864 	bl	80190c8 <fn_080190C8>
 801c000:	1820      	adds	r0, r4, r0
 801c002:	f001 fb09 	bl	801d618 <fn_0801D618>
 801c006:	233f      	movs	r3, #63	@ 0x3f
 801c008:	469c      	mov	ip, r3
 801c00a:	4b19      	ldr	r3, [pc, #100]	@ (801c070 <fn_0801BFE4+0x8c>)
 801c00c:	002a      	movs	r2, r5
 801c00e:	469a      	mov	sl, r3
 801c010:	2500      	movs	r5, #0
 801c012:	4680      	mov	r8, r0
 801c014:	4c17      	ldr	r4, [pc, #92]	@ (801c074 <fn_0801BFE4+0x90>)
 801c016:	4818      	ldr	r0, [pc, #96]	@ (801c078 <fn_0801BFE4+0x94>)
 801c018:	4918      	ldr	r1, [pc, #96]	@ (801c07c <fn_0801BFE4+0x98>)
 801c01a:	4e19      	ldr	r6, [pc, #100]	@ (801c080 <fn_0801BFE4+0x9c>)
 801c01c:	2740      	movs	r7, #64	@ 0x40
 801c01e:	46b9      	mov	r9, r7
 801c020:	4663      	mov	r3, ip
 801c022:	4491      	add	r9, r2
 801c024:	464f      	mov	r7, r9
 801c026:	402b      	ands	r3, r5
 801c028:	019b      	lsls	r3, r3, #6
 801c02a:	4443      	add	r3, r8
 801c02c:	6023      	str	r3, [r4, #0]
 801c02e:	6002      	str	r2, [r0, #0]
 801c030:	600e      	str	r6, [r1, #0]
 801c032:	6023      	str	r3, [r4, #0]
 801c034:	6007      	str	r7, [r0, #0]
 801c036:	2780      	movs	r7, #128	@ 0x80
 801c038:	46b9      	mov	r9, r7
 801c03a:	4491      	add	r9, r2
 801c03c:	464f      	mov	r7, r9
 801c03e:	600e      	str	r6, [r1, #0]
 801c040:	6023      	str	r3, [r4, #0]
 801c042:	6007      	str	r7, [r0, #0]
 801c044:	600e      	str	r6, [r1, #0]
 801c046:	6023      	str	r3, [r4, #0]
 801c048:	0013      	movs	r3, r2
 801c04a:	33c0      	adds	r3, #192	@ 0xc0
 801c04c:	6003      	str	r3, [r0, #0]
 801c04e:	4653      	mov	r3, sl
 801c050:	3501      	adds	r5, #1
 801c052:	600b      	str	r3, [r1, #0]
 801c054:	32f0      	adds	r2, #240	@ 0xf0
 801c056:	2da0      	cmp	r5, #160	@ 0xa0
 801c058:	d1e0      	bne.n	801c01c <fn_0801BFE4+0x38>
 801c05a:	bce0      	pop	{r5, r6, r7}
 801c05c:	46ba      	mov	sl, r7
 801c05e:	46b1      	mov	r9, r6
 801c060:	46a8      	mov	r8, r5
 801c062:	bcf0      	pop	{r4, r5, r6, r7}
 801c064:	bc01      	pop	{r0}
 801c066:	4700      	bx	r0
 801c068:	030064c4 	.word	0x030064c4
 801c06c:	00005a30 	.word	0x00005a30
 801c070:	8400000c 	.word	0x8400000c
 801c074:	040000d4 	.word	0x040000d4
 801c078:	040000d8 	.word	0x040000d8
 801c07c:	040000dc 	.word	0x040000dc
 801c080:	84000010 	.word	0x84000010
