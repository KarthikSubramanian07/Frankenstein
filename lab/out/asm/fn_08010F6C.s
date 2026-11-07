fn_08010F6C:
 8010f6c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8010f6e:	68c5      	ldr	r5, [r0, #12]
 8010f70:	002b      	movs	r3, r5
 8010f72:	6906      	ldr	r6, [r0, #16]
 8010f74:	0004      	movs	r4, r0
 8010f76:	4333      	orrs	r3, r6
 8010f78:	d102      	bne.n	8010f80 <fn_08010F6C+0x14>
 8010f7a:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8010f7c:	bc01      	pop	{r0}
 8010f7e:	4700      	bx	r0
 8010f80:	0032      	movs	r2, r6
 8010f82:	0029      	movs	r1, r5
 8010f84:	f7fe fa26 	bl	800f3d4 <fn_0800F3D4>
 8010f88:	2800      	cmp	r0, #0
 8010f8a:	d0f6      	beq.n	8010f7a <fn_08010F6C+0xe>
 8010f8c:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
 8010f8e:	6921      	ldr	r1, [r4, #16]
 8010f90:	681a      	ldr	r2, [r3, #0]
 8010f92:	68e0      	ldr	r0, [r4, #12]
 8010f94:	2327      	movs	r3, #39	@ 0x27
 8010f96:	f7ff ff29 	bl	8010dec <fn_08010DEC>
 8010f9a:	2123      	movs	r1, #35	@ 0x23
 8010f9c:	f009 f9ee 	bl	801a37c <fn_0801A37C>
 8010fa0:	0031      	movs	r1, r6
 8010fa2:	0028      	movs	r0, r5
 8010fa4:	f014 fb66 	bl	8025674 <fn_08025674>
 8010fa8:	2327      	movs	r3, #39	@ 0x27
 8010faa:	6802      	ldr	r2, [r0, #0]
 8010fac:	0031      	movs	r1, r6
 8010fae:	0028      	movs	r0, r5
 8010fb0:	f7ff ff1c 	bl	8010dec <fn_08010DEC>
 8010fb4:	2123      	movs	r1, #35	@ 0x23
 8010fb6:	f009 f9e1 	bl	801a37c <fn_0801A37C>
 8010fba:	22ea      	movs	r2, #234	@ 0xea
 8010fbc:	4f19      	ldr	r7, [pc, #100]	@ (8011024 <fn_08010F6C+0xb8>)
 8010fbe:	235a      	movs	r3, #90	@ 0x5a
 8010fc0:	6839      	ldr	r1, [r7, #0]
 8010fc2:	00d2      	lsls	r2, r2, #3
 8010fc4:	588a      	ldr	r2, [r1, r2]
 8010fc6:	215c      	movs	r1, #92	@ 0x5c
 8010fc8:	5ce3      	ldrb	r3, [r4, r3]
 8010fca:	4359      	muls	r1, r3
 8010fcc:	1852      	adds	r2, r2, r1
 8010fce:	2155      	movs	r1, #85	@ 0x55
 8010fd0:	5c52      	ldrb	r2, [r2, r1]
 8010fd2:	2180      	movs	r1, #128	@ 0x80
 8010fd4:	07d2      	lsls	r2, r2, #31
 8010fd6:	0609      	lsls	r1, r1, #24
 8010fd8:	17d2      	asrs	r2, r2, #31
 8010fda:	1852      	adds	r2, r2, r1
 8010fdc:	0028      	movs	r0, r5
 8010fde:	0031      	movs	r1, r6
 8010fe0:	f7ff ff04 	bl	8010dec <fn_08010DEC>
 8010fe4:	6a23      	ldr	r3, [r4, #32]
 8010fe6:	225c      	movs	r2, #92	@ 0x5c
 8010fe8:	6203      	str	r3, [r0, #32]
 8010fea:	2312      	movs	r3, #18
 8010fec:	5483      	strb	r3, [r0, r2]
 8010fee:	0020      	movs	r0, r4
 8010ff0:	f7ff f878 	bl	80100e4 <fn_080100E4>
 8010ff4:	0020      	movs	r0, r4
 8010ff6:	f009 fc03 	bl	801a800 <fn_0801A800>
 8010ffa:	683a      	ldr	r2, [r7, #0]
 8010ffc:	4b0a      	ldr	r3, [pc, #40]	@ (8011028 <fn_08010F6C+0xbc>)
 8010ffe:	5cd3      	ldrb	r3, [r2, r3]
 8011000:	2b00      	cmp	r3, #0
 8011002:	d003      	beq.n	801100c <fn_08010F6C+0xa0>
 8011004:	0020      	movs	r0, r4
 8011006:	f007 fb01 	bl	801860c <fn_0801860C>
 801100a:	e7b6      	b.n	8010f7a <fn_08010F6C+0xe>
 801100c:	0020      	movs	r0, r4
 801100e:	2100      	movs	r1, #0
 8011010:	3050      	adds	r0, #80	@ 0x50
 8011012:	f007 fb27 	bl	8018664 <fn_08018664>
 8011016:	0020      	movs	r0, r4
 8011018:	2100      	movs	r1, #0
 801101a:	3060      	adds	r0, #96	@ 0x60
 801101c:	f007 fb22 	bl	8018664 <fn_08018664>
 8011020:	e7f0      	b.n	8011004 <fn_08010F6C+0x98>
 8011022:	46c0      	nop			@ (mov r8, r8)
 8011024:	030064c4 	.word	0x030064c4
 8011028:	0000025e 	.word	0x0000025e
