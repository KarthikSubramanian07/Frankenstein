fn_08006AAC:
 8006aac:	4b0c      	ldr	r3, [pc, #48]	@ (8006ae0 <fn_08006AAC+0x34>)
 8006aae:	4a0d      	ldr	r2, [pc, #52]	@ (8006ae4 <fn_08006AAC+0x38>)
 8006ab0:	681b      	ldr	r3, [r3, #0]
 8006ab2:	490d      	ldr	r1, [pc, #52]	@ (8006ae8 <fn_08006AAC+0x3c>)
 8006ab4:	b510      	push	{r4, lr}
 8006ab6:	505a      	str	r2, [r3, r1]
 8006ab8:	2200      	movs	r2, #0
 8006aba:	200a      	movs	r0, #10
 8006abc:	490b      	ldr	r1, [pc, #44]	@ (8006aec <fn_08006AAC+0x40>)
 8006abe:	545a      	strb	r2, [r3, r1]
 8006ac0:	3902      	subs	r1, #2
 8006ac2:	525a      	strh	r2, [r3, r1]
 8006ac4:	490a      	ldr	r1, [pc, #40]	@ (8006af0 <fn_08006AAC+0x44>)
 8006ac6:	5258      	strh	r0, [r3, r1]
 8006ac8:	490a      	ldr	r1, [pc, #40]	@ (8006af4 <fn_08006AAC+0x48>)
 8006aca:	505a      	str	r2, [r3, r1]
 8006acc:	3104      	adds	r1, #4
 8006ace:	505a      	str	r2, [r3, r1]
 8006ad0:	4909      	ldr	r1, [pc, #36]	@ (8006af8 <fn_08006AAC+0x4c>)
 8006ad2:	505a      	str	r2, [r3, r1]
 8006ad4:	f7fc fd9e 	bl	8003614 <fn_08003614>
 8006ad8:	bc10      	pop	{r4}
 8006ada:	bc01      	pop	{r0}
 8006adc:	4700      	bx	r0
 8006ade:	46c0      	nop			@ (mov r8, r8)
 8006ae0:	030064c4 	.word	0x030064c4
 8006ae4:	080260c0 	.word	0x080260c0
 8006ae8:	00000784 	.word	0x00000784
 8006aec:	00000792 	.word	0x00000792
 8006af0:	0000078e 	.word	0x0000078e
 8006af4:	00000774 	.word	0x00000774
 8006af8:	0000077c 	.word	0x0000077c
 8006afc:	4710      	bx	r2
 8006afe:	4718      	bx	r3
