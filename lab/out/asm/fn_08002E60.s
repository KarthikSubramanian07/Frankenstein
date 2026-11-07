fn_08002E60:
 8002e60:	b570      	push	{r4, r5, r6, lr}
 8002e62:	f003 fe5d 	bl	8006b20 <fn_08006B20>
 8002e66:	220f      	movs	r2, #15
 8002e68:	17c3      	asrs	r3, r0, #31
 8002e6a:	0f1b      	lsrs	r3, r3, #28
 8002e6c:	18c0      	adds	r0, r0, r3
 8002e6e:	4c11      	ldr	r4, [pc, #68]	@ (8002eb4 <fn_08002E60+0x54>)
 8002e70:	4002      	ands	r2, r0
 8002e72:	1a9b      	subs	r3, r3, r2
 8002e74:	8023      	strh	r3, [r4, #0]
 8002e76:	4d10      	ldr	r5, [pc, #64]	@ (8002eb8 <fn_08002E60+0x58>)
 8002e78:	e003      	b.n	8002e82 <fn_08002E60+0x22>
 8002e7a:	2100      	movs	r1, #0
 8002e7c:	8021      	strh	r1, [r4, #0]
 8002e7e:	42ac      	cmp	r4, r5
 8002e80:	d014      	beq.n	8002eac <fn_08002E60+0x4c>
 8002e82:	f003 fe4d 	bl	8006b20 <fn_08006B20>
 8002e86:	2103      	movs	r1, #3
 8002e88:	f022 fb86 	bl	8025598 <fn_08025598>
 8002e8c:	8823      	ldrh	r3, [r4, #0]
 8002e8e:	3901      	subs	r1, #1
 8002e90:	18c9      	adds	r1, r1, r3
 8002e92:	0409      	lsls	r1, r1, #16
 8002e94:	3402      	adds	r4, #2
 8002e96:	1409      	asrs	r1, r1, #16
 8002e98:	2900      	cmp	r1, #0
 8002e9a:	dcee      	bgt.n	8002e7a <fn_08002E60+0x1a>
 8002e9c:	000b      	movs	r3, r1
 8002e9e:	3310      	adds	r3, #16
 8002ea0:	d1ec      	bne.n	8002e7c <fn_08002E60+0x1c>
 8002ea2:	210f      	movs	r1, #15
 8002ea4:	4249      	negs	r1, r1
 8002ea6:	8021      	strh	r1, [r4, #0]
 8002ea8:	42ac      	cmp	r4, r5
 8002eaa:	d1ea      	bne.n	8002e82 <fn_08002E60+0x22>
 8002eac:	bc70      	pop	{r4, r5, r6}
 8002eae:	bc01      	pop	{r0}
 8002eb0:	4700      	bx	r0
 8002eb2:	46c0      	nop			@ (mov r8, r8)
 8002eb4:	06009bc4 	.word	0x06009bc4
 8002eb8:	06009cb2 	.word	0x06009cb2
