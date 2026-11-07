fn_0800E938:
 800e938:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 800e93a:	b570      	push	{r4, r5, r6, lr}
 800e93c:	0005      	movs	r5, r0
 800e93e:	075b      	lsls	r3, r3, #29
 800e940:	d52a      	bpl.n	800e998 <fn_0800E938+0x60>
 800e942:	235a      	movs	r3, #90	@ 0x5a
 800e944:	22fd      	movs	r2, #253	@ 0xfd
 800e946:	5cc3      	ldrb	r3, [r0, r3]
 800e948:	3b13      	subs	r3, #19
 800e94a:	4213      	tst	r3, r2
 800e94c:	d024      	beq.n	800e998 <fn_0800E938+0x60>
 800e94e:	4b1a      	ldr	r3, [pc, #104]	@ (800e9b8 <fn_0800E938+0x80>)
 800e950:	681a      	ldr	r2, [r3, #0]
 800e952:	001e      	movs	r6, r3
 800e954:	4b19      	ldr	r3, [pc, #100]	@ (800e9bc <fn_0800E938+0x84>)
 800e956:	58d1      	ldr	r1, [r2, r3]
 800e958:	68c4      	ldr	r4, [r0, #12]
 800e95a:	68cb      	ldr	r3, [r1, #12]
 800e95c:	1ae4      	subs	r4, r4, r3
 800e95e:	6903      	ldr	r3, [r0, #16]
 800e960:	6908      	ldr	r0, [r1, #16]
 800e962:	1a1b      	subs	r3, r3, r0
 800e964:	17d8      	asrs	r0, r3, #31
 800e966:	181b      	adds	r3, r3, r0
 800e968:	4043      	eors	r3, r0
 800e96a:	17e0      	asrs	r0, r4, #31
 800e96c:	1824      	adds	r4, r4, r0
 800e96e:	4044      	eors	r4, r0
 800e970:	429c      	cmp	r4, r3
 800e972:	da00      	bge.n	800e976 <fn_0800E938+0x3e>
 800e974:	001c      	movs	r4, r3
 800e976:	235b      	movs	r3, #91	@ 0x5b
 800e978:	5ceb      	ldrb	r3, [r5, r3]
 800e97a:	041b      	lsls	r3, r3, #16
 800e97c:	1ae4      	subs	r4, r4, r3
 800e97e:	1424      	asrs	r4, r4, #16
 800e980:	43e3      	mvns	r3, r4
 800e982:	17db      	asrs	r3, r3, #31
 800e984:	401c      	ands	r4, r3
 800e986:	4b0e      	ldr	r3, [pc, #56]	@ (800e9c0 <fn_0800E938+0x88>)
 800e988:	58d3      	ldr	r3, [r2, r3]
 800e98a:	429c      	cmp	r4, r3
 800e98c:	da04      	bge.n	800e998 <fn_0800E938+0x60>
 800e98e:	0028      	movs	r0, r5
 800e990:	f005 fc7c 	bl	801428c <fn_0801428C>
 800e994:	2800      	cmp	r0, #0
 800e996:	d103      	bne.n	800e9a0 <fn_0800E938+0x68>
 800e998:	2001      	movs	r0, #1
 800e99a:	bc70      	pop	{r4, r5, r6}
 800e99c:	bc02      	pop	{r1}
 800e99e:	4708      	bx	r1
 800e9a0:	6831      	ldr	r1, [r6, #0]
 800e9a2:	4b07      	ldr	r3, [pc, #28]	@ (800e9c0 <fn_0800E938+0x88>)
 800e9a4:	4805      	ldr	r0, [pc, #20]	@ (800e9bc <fn_0800E938+0x84>)
 800e9a6:	58cb      	ldr	r3, [r1, r3]
 800e9a8:	4a06      	ldr	r2, [pc, #24]	@ (800e9c4 <fn_0800E938+0x8c>)
 800e9aa:	1b1b      	subs	r3, r3, r4
 800e9ac:	588a      	ldr	r2, [r1, r2]
 800e9ae:	5809      	ldr	r1, [r1, r0]
 800e9b0:	0028      	movs	r0, r5
 800e9b2:	f7ff f803 	bl	800d9bc <fn_0800D9BC>
 800e9b6:	e7ef      	b.n	800e998 <fn_0800E938+0x60>
 800e9b8:	030064c4 	.word	0x030064c4	@ data_030064C4
 800e9bc:	00000918 	.word	0x00000918
 800e9c0:	0000091c 	.word	0x0000091c
 800e9c4:	00000914 	.word	0x00000914
