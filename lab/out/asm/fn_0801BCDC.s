fn_0801BCDC:
 801bcdc:	b5f0      	push	{r4, r5, r6, r7, lr}
 801bcde:	4645      	mov	r5, r8
 801bce0:	4657      	mov	r7, sl
 801bce2:	46de      	mov	lr, fp
 801bce4:	464e      	mov	r6, r9
 801bce6:	4b78      	ldr	r3, [pc, #480]	@ (801bec8 <fn_0801BCDC+0x1ec>)
 801bce8:	2400      	movs	r4, #0
 801bcea:	4698      	mov	r8, r3
 801bcec:	b5e0      	push	{r5, r6, r7, lr}
 801bcee:	4f77      	ldr	r7, [pc, #476]	@ (801becc <fn_0801BCDC+0x1f0>)
 801bcf0:	4d77      	ldr	r5, [pc, #476]	@ (801bed0 <fn_0801BCDC+0x1f4>)
 801bcf2:	b08b      	sub	sp, #44	@ 0x2c
 801bcf4:	0023      	movs	r3, r4
 801bcf6:	003a      	movs	r2, r7
 801bcf8:	2109      	movs	r1, #9
 801bcfa:	a807      	add	r0, sp, #28
 801bcfc:	f7e9 fbac 	bl	8005458 <fn_08005458>
 801bd00:	a807      	add	r0, sp, #28
 801bd02:	f001 fbbd 	bl	801d480 <fn_0801D480>
 801bd06:	f001 fc2f 	bl	801d568 <fn_0801D568>
 801bd0a:	4b72      	ldr	r3, [pc, #456]	@ (801bed4 <fn_0801BCDC+0x1f8>)
 801bd0c:	682e      	ldr	r6, [r5, #0]
 801bd0e:	18e3      	adds	r3, r4, r3
 801bd10:	009b      	lsls	r3, r3, #2
 801bd12:	50f0      	str	r0, [r6, r3]
 801bd14:	4642      	mov	r2, r8
 801bd16:	0023      	movs	r3, r4
 801bd18:	2109      	movs	r1, #9
 801bd1a:	a807      	add	r0, sp, #28
 801bd1c:	f7e9 fb9c 	bl	8005458 <fn_08005458>
 801bd20:	a807      	add	r0, sp, #28
 801bd22:	f001 fbad 	bl	801d480 <fn_0801D480>
 801bd26:	f001 fc1f 	bl	801d568 <fn_0801D568>
 801bd2a:	4b6b      	ldr	r3, [pc, #428]	@ (801bed8 <fn_0801BCDC+0x1fc>)
 801bd2c:	682e      	ldr	r6, [r5, #0]
 801bd2e:	18e3      	adds	r3, r4, r3
 801bd30:	009b      	lsls	r3, r3, #2
 801bd32:	3401      	adds	r4, #1
 801bd34:	50f0      	str	r0, [r6, r3]
 801bd36:	2c0a      	cmp	r4, #10
 801bd38:	d1dc      	bne.n	801bcf4 <fn_0801BCDC+0x18>
 801bd3a:	2400      	movs	r4, #0
 801bd3c:	4f67      	ldr	r7, [pc, #412]	@ (801bedc <fn_0801BCDC+0x200>)
 801bd3e:	0023      	movs	r3, r4
 801bd40:	003a      	movs	r2, r7
 801bd42:	2109      	movs	r1, #9
 801bd44:	a807      	add	r0, sp, #28
 801bd46:	f7e9 fb87 	bl	8005458 <fn_08005458>
 801bd4a:	a807      	add	r0, sp, #28
 801bd4c:	f001 fb98 	bl	801d480 <fn_0801D480>
 801bd50:	f001 fc0a 	bl	801d568 <fn_0801D568>
 801bd54:	4b62      	ldr	r3, [pc, #392]	@ (801bee0 <fn_0801BCDC+0x204>)
 801bd56:	682e      	ldr	r6, [r5, #0]
 801bd58:	18e3      	adds	r3, r4, r3
 801bd5a:	009b      	lsls	r3, r3, #2
 801bd5c:	3401      	adds	r4, #1
 801bd5e:	50f0      	str	r0, [r6, r3]
 801bd60:	2c06      	cmp	r4, #6
 801bd62:	d1ec      	bne.n	801bd3e <fn_0801BCDC+0x62>
 801bd64:	2400      	movs	r4, #0
 801bd66:	4f5f      	ldr	r7, [pc, #380]	@ (801bee4 <fn_0801BCDC+0x208>)
 801bd68:	1ca3      	adds	r3, r4, #2
 801bd6a:	003a      	movs	r2, r7
 801bd6c:	2109      	movs	r1, #9
 801bd6e:	a807      	add	r0, sp, #28
 801bd70:	f7e9 fb72 	bl	8005458 <fn_08005458>
 801bd74:	a807      	add	r0, sp, #28
 801bd76:	f001 fb83 	bl	801d480 <fn_0801D480>
 801bd7a:	f001 fbf5 	bl	801d568 <fn_0801D568>
 801bd7e:	4b5a      	ldr	r3, [pc, #360]	@ (801bee8 <fn_0801BCDC+0x20c>)
 801bd80:	682e      	ldr	r6, [r5, #0]
 801bd82:	18e3      	adds	r3, r4, r3
 801bd84:	00db      	lsls	r3, r3, #3
 801bd86:	50f0      	str	r0, [r6, r3]
 801bd88:	4a58      	ldr	r2, [pc, #352]	@ (801beec <fn_0801BCDC+0x210>)
 801bd8a:	00e3      	lsls	r3, r4, #3
 801bd8c:	18f3      	adds	r3, r6, r3
 801bd8e:	189b      	adds	r3, r3, r2
 801bd90:	4a57      	ldr	r2, [pc, #348]	@ (801bef0 <fn_0801BCDC+0x214>)
 801bd92:	18a2      	adds	r2, r4, r2
 801bd94:	0092      	lsls	r2, r2, #2
 801bd96:	5992      	ldr	r2, [r2, r6]
 801bd98:	3401      	adds	r4, #1
 801bd9a:	601a      	str	r2, [r3, #0]
 801bd9c:	2c06      	cmp	r4, #6
 801bd9e:	d1e3      	bne.n	801bd68 <fn_0801BCDC+0x8c>
 801bda0:	4b54      	ldr	r3, [pc, #336]	@ (801bef4 <fn_0801BCDC+0x218>)
 801bda2:	469a      	mov	sl, r3
 801bda4:	4b54      	ldr	r3, [pc, #336]	@ (801bef8 <fn_0801BCDC+0x21c>)
 801bda6:	9302      	str	r3, [sp, #8]
 801bda8:	4b54      	ldr	r3, [pc, #336]	@ (801befc <fn_0801BCDC+0x220>)
 801bdaa:	9303      	str	r3, [sp, #12]
 801bdac:	4b54      	ldr	r3, [pc, #336]	@ (801bf00 <fn_0801BCDC+0x224>)
 801bdae:	9304      	str	r3, [sp, #16]
 801bdb0:	4b54      	ldr	r3, [pc, #336]	@ (801bf04 <fn_0801BCDC+0x228>)
 801bdb2:	9305      	str	r3, [sp, #20]
 801bdb4:	4b54      	ldr	r3, [pc, #336]	@ (801bf08 <fn_0801BCDC+0x22c>)
 801bdb6:	2700      	movs	r7, #0
 801bdb8:	2600      	movs	r6, #0
 801bdba:	469b      	mov	fp, r3
 801bdbc:	2400      	movs	r4, #0
 801bdbe:	46b8      	mov	r8, r7
 801bdc0:	46a9      	mov	r9, r5
 801bdc2:	4652      	mov	r2, sl
 801bdc4:	0033      	movs	r3, r6
 801bdc6:	2109      	movs	r1, #9
 801bdc8:	9400      	str	r4, [sp, #0]
 801bdca:	a807      	add	r0, sp, #28
 801bdcc:	f7e9 fb44 	bl	8005458 <fn_08005458>
 801bdd0:	a807      	add	r0, sp, #28
 801bdd2:	f001 fb55 	bl	801d480 <fn_0801D480>
 801bdd6:	464b      	mov	r3, r9
 801bdd8:	681d      	ldr	r5, [r3, #0]
 801bdda:	f001 fbc5 	bl	801d568 <fn_0801D568>
 801bdde:	4a4b      	ldr	r2, [pc, #300]	@ (801bf0c <fn_0801BCDC+0x230>)
 801bde0:	19e3      	adds	r3, r4, r7
 801bde2:	189b      	adds	r3, r3, r2
 801bde4:	009b      	lsls	r3, r3, #2
 801bde6:	3401      	adds	r4, #1
 801bde8:	50e8      	str	r0, [r5, r3]
 801bdea:	2c03      	cmp	r4, #3
 801bdec:	d1e9      	bne.n	801bdc2 <fn_0801BCDC+0xe6>
 801bdee:	0033      	movs	r3, r6
 801bdf0:	2109      	movs	r1, #9
 801bdf2:	9a02      	ldr	r2, [sp, #8]
 801bdf4:	a807      	add	r0, sp, #28
 801bdf6:	f7e9 fb2f 	bl	8005458 <fn_08005458>
 801bdfa:	464d      	mov	r5, r9
 801bdfc:	a807      	add	r0, sp, #28
 801bdfe:	f001 fb3f 	bl	801d480 <fn_0801D480>
 801be02:	f001 fbb1 	bl	801d568 <fn_0801D568>
 801be06:	4b42      	ldr	r3, [pc, #264]	@ (801bf10 <fn_0801BCDC+0x234>)
 801be08:	682c      	ldr	r4, [r5, #0]
 801be0a:	18fb      	adds	r3, r7, r3
 801be0c:	009b      	lsls	r3, r3, #2
 801be0e:	2109      	movs	r1, #9
 801be10:	50e0      	str	r0, [r4, r3]
 801be12:	9a03      	ldr	r2, [sp, #12]
 801be14:	0033      	movs	r3, r6
 801be16:	a807      	add	r0, sp, #28
 801be18:	f7e9 fb1e 	bl	8005458 <fn_08005458>
 801be1c:	a807      	add	r0, sp, #28
 801be1e:	f001 fb2f 	bl	801d480 <fn_0801D480>
 801be22:	f001 fba1 	bl	801d568 <fn_0801D568>
 801be26:	4b3b      	ldr	r3, [pc, #236]	@ (801bf14 <fn_0801BCDC+0x238>)
 801be28:	682c      	ldr	r4, [r5, #0]
 801be2a:	18fb      	adds	r3, r7, r3
 801be2c:	009b      	lsls	r3, r3, #2
 801be2e:	2109      	movs	r1, #9
 801be30:	50e0      	str	r0, [r4, r3]
 801be32:	9a04      	ldr	r2, [sp, #16]
 801be34:	0033      	movs	r3, r6
 801be36:	a807      	add	r0, sp, #28
 801be38:	f7e9 fb0e 	bl	8005458 <fn_08005458>
 801be3c:	a807      	add	r0, sp, #28
 801be3e:	f001 fb1f 	bl	801d480 <fn_0801D480>
 801be42:	f001 fb91 	bl	801d568 <fn_0801D568>
 801be46:	4b34      	ldr	r3, [pc, #208]	@ (801bf18 <fn_0801BCDC+0x23c>)
 801be48:	682c      	ldr	r4, [r5, #0]
 801be4a:	18fb      	adds	r3, r7, r3
 801be4c:	009b      	lsls	r3, r3, #2
 801be4e:	2109      	movs	r1, #9
 801be50:	50e0      	str	r0, [r4, r3]
 801be52:	9a05      	ldr	r2, [sp, #20]
 801be54:	0033      	movs	r3, r6
 801be56:	a807      	add	r0, sp, #28
 801be58:	f7e9 fafe 	bl	8005458 <fn_08005458>
 801be5c:	a807      	add	r0, sp, #28
 801be5e:	f001 fb0f 	bl	801d480 <fn_0801D480>
 801be62:	f001 fb81 	bl	801d568 <fn_0801D568>
 801be66:	4b2d      	ldr	r3, [pc, #180]	@ (801bf1c <fn_0801BCDC+0x240>)
 801be68:	682c      	ldr	r4, [r5, #0]
 801be6a:	18fb      	adds	r3, r7, r3
 801be6c:	009b      	lsls	r3, r3, #2
 801be6e:	50e0      	str	r0, [r4, r3]
 801be70:	465a      	mov	r2, fp
 801be72:	0033      	movs	r3, r6
 801be74:	2109      	movs	r1, #9
 801be76:	a807      	add	r0, sp, #28
 801be78:	f7e9 faee 	bl	8005458 <fn_08005458>
 801be7c:	a807      	add	r0, sp, #28
 801be7e:	f001 faff 	bl	801d480 <fn_0801D480>
 801be82:	f001 fb71 	bl	801d568 <fn_0801D568>
 801be86:	4b26      	ldr	r3, [pc, #152]	@ (801bf20 <fn_0801BCDC+0x244>)
 801be88:	682c      	ldr	r4, [r5, #0]
 801be8a:	4443      	add	r3, r8
 801be8c:	009b      	lsls	r3, r3, #2
 801be8e:	3601      	adds	r6, #1
 801be90:	50e0      	str	r0, [r4, r3]
 801be92:	3708      	adds	r7, #8
 801be94:	2e05      	cmp	r6, #5
 801be96:	d191      	bne.n	801bdbc <fn_0801BCDC+0xe0>
 801be98:	4822      	ldr	r0, [pc, #136]	@ (801bf24 <fn_0801BCDC+0x248>)
 801be9a:	f001 faf1 	bl	801d480 <fn_0801D480>
 801be9e:	f001 fb63 	bl	801d568 <fn_0801D568>
 801bea2:	4b21      	ldr	r3, [pc, #132]	@ (801bf28 <fn_0801BCDC+0x24c>)
 801bea4:	50e0      	str	r0, [r4, r3]
 801bea6:	4821      	ldr	r0, [pc, #132]	@ (801bf2c <fn_0801BCDC+0x250>)
 801bea8:	f001 faea 	bl	801d480 <fn_0801D480>
 801beac:	f001 fb5c 	bl	801d568 <fn_0801D568>
 801beb0:	4b1f      	ldr	r3, [pc, #124]	@ (801bf30 <fn_0801BCDC+0x254>)
 801beb2:	50e0      	str	r0, [r4, r3]
 801beb4:	b00b      	add	sp, #44	@ 0x2c
 801beb6:	bcf0      	pop	{r4, r5, r6, r7}
 801beb8:	46bb      	mov	fp, r7
 801beba:	46b2      	mov	sl, r6
 801bebc:	46a9      	mov	r9, r5
 801bebe:	46a0      	mov	r8, r4
 801bec0:	bcf0      	pop	{r4, r5, r6, r7}
 801bec2:	bc01      	pop	{r0}
 801bec4:	4700      	bx	r0
 801bec6:	46c0      	nop			@ (mov r8, r8)
 801bec8:	0814a868 	.word	0x0814a868
 801becc:	0814a85c 	.word	0x0814a85c
 801bed0:	030064c4 	.word	0x030064c4	@ data_030064C4
 801bed4:	00001592 	.word	0x00001592
 801bed8:	0000159c 	.word	0x0000159c
 801bedc:	0814a874 	.word	0x0814a874
 801bee0:	000015a6 	.word	0x000015a6
 801bee4:	0814a880 	.word	0x0814a880
 801bee8:	00000aeb 	.word	0x00000aeb
 801beec:	0000575c 	.word	0x0000575c
 801bef0:	0000159e 	.word	0x0000159e
 801bef4:	0814a88c 	.word	0x0814a88c
 801bef8:	0814a898 	.word	0x0814a898
 801befc:	0814a8a4 	.word	0x0814a8a4
 801bf00:	0814a8b0 	.word	0x0814a8b0
 801bf04:	0814a8bc 	.word	0x0814a8bc
 801bf08:	0814a8c8 	.word	0x0814a8c8
 801bf0c:	000015ac 	.word	0x000015ac
 801bf10:	000015af 	.word	0x000015af
 801bf14:	000015b0 	.word	0x000015b0
 801bf18:	000015b1 	.word	0x000015b1
 801bf1c:	000015b2 	.word	0x000015b2
 801bf20:	000015b3 	.word	0x000015b3
 801bf24:	0814a8d4 	.word	0x0814a8d4
 801bf28:	00005750 	.word	0x00005750
 801bf2c:	0814a8dc 	.word	0x0814a8dc
 801bf30:	00005754 	.word	0x00005754
