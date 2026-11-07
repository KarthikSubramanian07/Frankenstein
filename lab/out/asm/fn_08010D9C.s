fn_08010D9C:
 8010d9c:	4b10      	ldr	r3, [pc, #64]	@ (8010de0 <fn_08010D9C+0x44>)
 8010d9e:	b570      	push	{r4, r5, r6, lr}
 8010da0:	681d      	ldr	r5, [r3, #0]
 8010da2:	2356      	movs	r3, #86	@ 0x56
 8010da4:	0004      	movs	r4, r0
 8010da6:	5ec0      	ldrsh	r0, [r0, r3]
 8010da8:	4b0e      	ldr	r3, [pc, #56]	@ (8010de4 <fn_08010D9C+0x48>)
 8010daa:	58eb      	ldr	r3, [r5, r3]
 8010dac:	18c0      	adds	r0, r0, r3
 8010dae:	2358      	movs	r3, #88	@ 0x58
 8010db0:	5ee1      	ldrsh	r1, [r4, r3]
 8010db2:	f014 fb99 	bl	80254e8 <fn_080254E8>
 8010db6:	6ca0      	ldr	r0, [r4, #72]	@ 0x48
 8010db8:	2204      	movs	r2, #4
 8010dba:	5e83      	ldrsh	r3, [r0, r2]
 8010dbc:	4299      	cmp	r1, r3
 8010dbe:	db0b      	blt.n	8010dd8 <fn_08010D9C+0x3c>
 8010dc0:	4a09      	ldr	r2, [pc, #36]	@ (8010de8 <fn_08010D9C+0x4c>)
 8010dc2:	58aa      	ldr	r2, [r5, r2]
 8010dc4:	1ac9      	subs	r1, r1, r3
 8010dc6:	8903      	ldrh	r3, [r0, #8]
 8010dc8:	0098      	lsls	r0, r3, #2
 8010dca:	18c0      	adds	r0, r0, r3
 8010dcc:	0040      	lsls	r0, r0, #1
 8010dce:	1810      	adds	r0, r2, r0
 8010dd0:	2404      	movs	r4, #4
 8010dd2:	5f03      	ldrsh	r3, [r0, r4]
 8010dd4:	428b      	cmp	r3, r1
 8010dd6:	ddf5      	ble.n	8010dc4 <fn_08010D9C+0x28>
 8010dd8:	bc70      	pop	{r4, r5, r6}
 8010dda:	bc02      	pop	{r1}
 8010ddc:	4708      	bx	r1
 8010dde:	46c0      	nop			@ (mov r8, r8)
 8010de0:	030064c4 	.word	0x030064c4	@ data_030064C4
 8010de4:	000010ec 	.word	0x000010ec
 8010de8:	0000074c 	.word	0x0000074c
