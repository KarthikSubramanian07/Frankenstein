fn_0801BF34:
 801bf34:	4b20      	ldr	r3, [pc, #128]	@ (801bfb8 <fn_0801BF34+0x84>)
 801bf36:	4a21      	ldr	r2, [pc, #132]	@ (801bfbc <fn_0801BF34+0x88>)
 801bf38:	681b      	ldr	r3, [r3, #0]
 801bf3a:	b5f0      	push	{r4, r5, r6, r7, lr}
 801bf3c:	589d      	ldr	r5, [r3, r2]
 801bf3e:	46d6      	mov	lr, sl
 801bf40:	4646      	mov	r6, r8
 801bf42:	464f      	mov	r7, r9
 801bf44:	2288      	movs	r2, #136	@ 0x88
 801bf46:	b5c0      	push	{r6, r7, lr}
 801bf48:	0152      	lsls	r2, r2, #5
 801bf4a:	589c      	ldr	r4, [r3, r2]
 801bf4c:	f7fd f862 	bl	8019014 <fn_08019014>
 801bf50:	1820      	adds	r0, r4, r0
 801bf52:	f001 fb09 	bl	801d568 <fn_0801D568>
 801bf56:	233f      	movs	r3, #63	@ 0x3f
 801bf58:	469c      	mov	ip, r3
 801bf5a:	4b19      	ldr	r3, [pc, #100]	@ (801bfc0 <fn_0801BF34+0x8c>)
 801bf5c:	002a      	movs	r2, r5
 801bf5e:	469a      	mov	sl, r3
 801bf60:	2500      	movs	r5, #0
 801bf62:	4680      	mov	r8, r0
 801bf64:	4c17      	ldr	r4, [pc, #92]	@ (801bfc4 <fn_0801BF34+0x90>)
 801bf66:	4818      	ldr	r0, [pc, #96]	@ (801bfc8 <fn_0801BF34+0x94>)
 801bf68:	4918      	ldr	r1, [pc, #96]	@ (801bfcc <fn_0801BF34+0x98>)
 801bf6a:	4e19      	ldr	r6, [pc, #100]	@ (801bfd0 <fn_0801BF34+0x9c>)
 801bf6c:	2740      	movs	r7, #64	@ 0x40
 801bf6e:	46b9      	mov	r9, r7
 801bf70:	4663      	mov	r3, ip
 801bf72:	4491      	add	r9, r2
 801bf74:	464f      	mov	r7, r9
 801bf76:	402b      	ands	r3, r5
 801bf78:	019b      	lsls	r3, r3, #6
 801bf7a:	4443      	add	r3, r8
 801bf7c:	6023      	str	r3, [r4, #0]
 801bf7e:	6002      	str	r2, [r0, #0]
 801bf80:	600e      	str	r6, [r1, #0]
 801bf82:	6023      	str	r3, [r4, #0]
 801bf84:	6007      	str	r7, [r0, #0]
 801bf86:	2780      	movs	r7, #128	@ 0x80
 801bf88:	46b9      	mov	r9, r7
 801bf8a:	4491      	add	r9, r2
 801bf8c:	464f      	mov	r7, r9
 801bf8e:	600e      	str	r6, [r1, #0]
 801bf90:	6023      	str	r3, [r4, #0]
 801bf92:	6007      	str	r7, [r0, #0]
 801bf94:	600e      	str	r6, [r1, #0]
 801bf96:	6023      	str	r3, [r4, #0]
 801bf98:	0013      	movs	r3, r2
 801bf9a:	33c0      	adds	r3, #192	@ 0xc0
 801bf9c:	6003      	str	r3, [r0, #0]
 801bf9e:	4653      	mov	r3, sl
 801bfa0:	3501      	adds	r5, #1
 801bfa2:	600b      	str	r3, [r1, #0]
 801bfa4:	32f0      	adds	r2, #240	@ 0xf0
 801bfa6:	2da0      	cmp	r5, #160	@ 0xa0
 801bfa8:	d1e0      	bne.n	801bf6c <fn_0801BF34+0x38>
 801bfaa:	bce0      	pop	{r5, r6, r7}
 801bfac:	46ba      	mov	sl, r7
 801bfae:	46b1      	mov	r9, r6
 801bfb0:	46a8      	mov	r8, r5
 801bfb2:	bcf0      	pop	{r4, r5, r6, r7}
 801bfb4:	bc01      	pop	{r0}
 801bfb6:	4700      	bx	r0
 801bfb8:	030064c4 	.word	0x030064c4	@ data_030064C4
 801bfbc:	00005a30 	.word	0x00005a30
 801bfc0:	8400000c 	.word	0x8400000c
 801bfc4:	040000d4 	.word	0x040000d4
 801bfc8:	040000d8 	.word	0x040000d8
 801bfcc:	040000dc 	.word	0x040000dc
 801bfd0:	84000010 	.word	0x84000010
