fn_0801BD8C:
 801bd8c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801bd8e:	4645      	mov	r5, r8
 801bd90:	4657      	mov	r7, sl
 801bd92:	46de      	mov	lr, fp
 801bd94:	464e      	mov	r6, r9
 801bd96:	4b78      	ldr	r3, [pc, #480]	@ (801bf78 <fn_0801BD8C+0x1ec>)
 801bd98:	2400      	movs	r4, #0
 801bd9a:	4698      	mov	r8, r3
 801bd9c:	b5e0      	push	{r5, r6, r7, lr}
 801bd9e:	4f77      	ldr	r7, [pc, #476]	@ (801bf7c <fn_0801BD8C+0x1f0>)
 801bda0:	4d77      	ldr	r5, [pc, #476]	@ (801bf80 <fn_0801BD8C+0x1f4>)
 801bda2:	b08b      	sub	sp, #44	@ 0x2c
 801bda4:	0023      	movs	r3, r4
 801bda6:	003a      	movs	r2, r7
 801bda8:	2109      	movs	r1, #9
 801bdaa:	a807      	add	r0, sp, #28
 801bdac:	f7e9 fb54 	bl	8005458 <fn_08005458>
 801bdb0:	a807      	add	r0, sp, #28
 801bdb2:	f001 fbbd 	bl	801d530 <fn_0801D530>
 801bdb6:	f001 fc2f 	bl	801d618 <fn_0801D618>
 801bdba:	4b72      	ldr	r3, [pc, #456]	@ (801bf84 <fn_0801BD8C+0x1f8>)
 801bdbc:	682e      	ldr	r6, [r5, #0]
 801bdbe:	18e3      	adds	r3, r4, r3
 801bdc0:	009b      	lsls	r3, r3, #2
 801bdc2:	50f0      	str	r0, [r6, r3]
 801bdc4:	4642      	mov	r2, r8
 801bdc6:	0023      	movs	r3, r4
 801bdc8:	2109      	movs	r1, #9
 801bdca:	a807      	add	r0, sp, #28
 801bdcc:	f7e9 fb44 	bl	8005458 <fn_08005458>
 801bdd0:	a807      	add	r0, sp, #28
 801bdd2:	f001 fbad 	bl	801d530 <fn_0801D530>
 801bdd6:	f001 fc1f 	bl	801d618 <fn_0801D618>
 801bdda:	4b6b      	ldr	r3, [pc, #428]	@ (801bf88 <fn_0801BD8C+0x1fc>)
 801bddc:	682e      	ldr	r6, [r5, #0]
 801bdde:	18e3      	adds	r3, r4, r3
 801bde0:	009b      	lsls	r3, r3, #2
 801bde2:	3401      	adds	r4, #1
 801bde4:	50f0      	str	r0, [r6, r3]
 801bde6:	2c0a      	cmp	r4, #10
 801bde8:	d1dc      	bne.n	801bda4 <fn_0801BD8C+0x18>
 801bdea:	2400      	movs	r4, #0
 801bdec:	4f67      	ldr	r7, [pc, #412]	@ (801bf8c <fn_0801BD8C+0x200>)
 801bdee:	0023      	movs	r3, r4
 801bdf0:	003a      	movs	r2, r7
 801bdf2:	2109      	movs	r1, #9
 801bdf4:	a807      	add	r0, sp, #28
 801bdf6:	f7e9 fb2f 	bl	8005458 <fn_08005458>
 801bdfa:	a807      	add	r0, sp, #28
 801bdfc:	f001 fb98 	bl	801d530 <fn_0801D530>
 801be00:	f001 fc0a 	bl	801d618 <fn_0801D618>
 801be04:	4b62      	ldr	r3, [pc, #392]	@ (801bf90 <fn_0801BD8C+0x204>)
 801be06:	682e      	ldr	r6, [r5, #0]
 801be08:	18e3      	adds	r3, r4, r3
 801be0a:	009b      	lsls	r3, r3, #2
 801be0c:	3401      	adds	r4, #1
 801be0e:	50f0      	str	r0, [r6, r3]
 801be10:	2c06      	cmp	r4, #6
 801be12:	d1ec      	bne.n	801bdee <fn_0801BD8C+0x62>
 801be14:	2400      	movs	r4, #0
 801be16:	4f5f      	ldr	r7, [pc, #380]	@ (801bf94 <fn_0801BD8C+0x208>)
 801be18:	1ca3      	adds	r3, r4, #2
 801be1a:	003a      	movs	r2, r7
 801be1c:	2109      	movs	r1, #9
 801be1e:	a807      	add	r0, sp, #28
 801be20:	f7e9 fb1a 	bl	8005458 <fn_08005458>
 801be24:	a807      	add	r0, sp, #28
 801be26:	f001 fb83 	bl	801d530 <fn_0801D530>
 801be2a:	f001 fbf5 	bl	801d618 <fn_0801D618>
 801be2e:	4b5a      	ldr	r3, [pc, #360]	@ (801bf98 <fn_0801BD8C+0x20c>)
 801be30:	682e      	ldr	r6, [r5, #0]
 801be32:	18e3      	adds	r3, r4, r3
 801be34:	00db      	lsls	r3, r3, #3
 801be36:	50f0      	str	r0, [r6, r3]
 801be38:	4a58      	ldr	r2, [pc, #352]	@ (801bf9c <fn_0801BD8C+0x210>)
 801be3a:	00e3      	lsls	r3, r4, #3
 801be3c:	18f3      	adds	r3, r6, r3
 801be3e:	189b      	adds	r3, r3, r2
 801be40:	4a57      	ldr	r2, [pc, #348]	@ (801bfa0 <fn_0801BD8C+0x214>)
 801be42:	18a2      	adds	r2, r4, r2
 801be44:	0092      	lsls	r2, r2, #2
 801be46:	5992      	ldr	r2, [r2, r6]
 801be48:	3401      	adds	r4, #1
 801be4a:	601a      	str	r2, [r3, #0]
 801be4c:	2c06      	cmp	r4, #6
 801be4e:	d1e3      	bne.n	801be18 <fn_0801BD8C+0x8c>
 801be50:	4b54      	ldr	r3, [pc, #336]	@ (801bfa4 <fn_0801BD8C+0x218>)
 801be52:	469a      	mov	sl, r3
 801be54:	4b54      	ldr	r3, [pc, #336]	@ (801bfa8 <fn_0801BD8C+0x21c>)
 801be56:	9302      	str	r3, [sp, #8]
 801be58:	4b54      	ldr	r3, [pc, #336]	@ (801bfac <fn_0801BD8C+0x220>)
 801be5a:	9303      	str	r3, [sp, #12]
 801be5c:	4b54      	ldr	r3, [pc, #336]	@ (801bfb0 <fn_0801BD8C+0x224>)
 801be5e:	9304      	str	r3, [sp, #16]
 801be60:	4b54      	ldr	r3, [pc, #336]	@ (801bfb4 <fn_0801BD8C+0x228>)
 801be62:	9305      	str	r3, [sp, #20]
 801be64:	4b54      	ldr	r3, [pc, #336]	@ (801bfb8 <fn_0801BD8C+0x22c>)
 801be66:	2700      	movs	r7, #0
 801be68:	2600      	movs	r6, #0
 801be6a:	469b      	mov	fp, r3
 801be6c:	2400      	movs	r4, #0
 801be6e:	46b8      	mov	r8, r7
 801be70:	46a9      	mov	r9, r5
 801be72:	4652      	mov	r2, sl
 801be74:	0033      	movs	r3, r6
 801be76:	2109      	movs	r1, #9
 801be78:	9400      	str	r4, [sp, #0]
 801be7a:	a807      	add	r0, sp, #28
 801be7c:	f7e9 faec 	bl	8005458 <fn_08005458>
 801be80:	a807      	add	r0, sp, #28
 801be82:	f001 fb55 	bl	801d530 <fn_0801D530>
 801be86:	464b      	mov	r3, r9
 801be88:	681d      	ldr	r5, [r3, #0]
 801be8a:	f001 fbc5 	bl	801d618 <fn_0801D618>
 801be8e:	4a4b      	ldr	r2, [pc, #300]	@ (801bfbc <fn_0801BD8C+0x230>)
 801be90:	19e3      	adds	r3, r4, r7
 801be92:	189b      	adds	r3, r3, r2
 801be94:	009b      	lsls	r3, r3, #2
 801be96:	3401      	adds	r4, #1
 801be98:	50e8      	str	r0, [r5, r3]
 801be9a:	2c03      	cmp	r4, #3
 801be9c:	d1e9      	bne.n	801be72 <fn_0801BD8C+0xe6>
 801be9e:	0033      	movs	r3, r6
 801bea0:	2109      	movs	r1, #9
 801bea2:	9a02      	ldr	r2, [sp, #8]
 801bea4:	a807      	add	r0, sp, #28
 801bea6:	f7e9 fad7 	bl	8005458 <fn_08005458>
 801beaa:	464d      	mov	r5, r9
 801beac:	a807      	add	r0, sp, #28
 801beae:	f001 fb3f 	bl	801d530 <fn_0801D530>
 801beb2:	f001 fbb1 	bl	801d618 <fn_0801D618>
 801beb6:	4b42      	ldr	r3, [pc, #264]	@ (801bfc0 <fn_0801BD8C+0x234>)
 801beb8:	682c      	ldr	r4, [r5, #0]
 801beba:	18fb      	adds	r3, r7, r3
 801bebc:	009b      	lsls	r3, r3, #2
 801bebe:	2109      	movs	r1, #9
 801bec0:	50e0      	str	r0, [r4, r3]
 801bec2:	9a03      	ldr	r2, [sp, #12]
 801bec4:	0033      	movs	r3, r6
 801bec6:	a807      	add	r0, sp, #28
 801bec8:	f7e9 fac6 	bl	8005458 <fn_08005458>
 801becc:	a807      	add	r0, sp, #28
 801bece:	f001 fb2f 	bl	801d530 <fn_0801D530>
 801bed2:	f001 fba1 	bl	801d618 <fn_0801D618>
 801bed6:	4b3b      	ldr	r3, [pc, #236]	@ (801bfc4 <fn_0801BD8C+0x238>)
 801bed8:	682c      	ldr	r4, [r5, #0]
 801beda:	18fb      	adds	r3, r7, r3
 801bedc:	009b      	lsls	r3, r3, #2
 801bede:	2109      	movs	r1, #9
 801bee0:	50e0      	str	r0, [r4, r3]
 801bee2:	9a04      	ldr	r2, [sp, #16]
 801bee4:	0033      	movs	r3, r6
 801bee6:	a807      	add	r0, sp, #28
 801bee8:	f7e9 fab6 	bl	8005458 <fn_08005458>
 801beec:	a807      	add	r0, sp, #28
 801beee:	f001 fb1f 	bl	801d530 <fn_0801D530>
 801bef2:	f001 fb91 	bl	801d618 <fn_0801D618>
 801bef6:	4b34      	ldr	r3, [pc, #208]	@ (801bfc8 <fn_0801BD8C+0x23c>)
 801bef8:	682c      	ldr	r4, [r5, #0]
 801befa:	18fb      	adds	r3, r7, r3
 801befc:	009b      	lsls	r3, r3, #2
 801befe:	2109      	movs	r1, #9
 801bf00:	50e0      	str	r0, [r4, r3]
 801bf02:	9a05      	ldr	r2, [sp, #20]
 801bf04:	0033      	movs	r3, r6
 801bf06:	a807      	add	r0, sp, #28
 801bf08:	f7e9 faa6 	bl	8005458 <fn_08005458>
 801bf0c:	a807      	add	r0, sp, #28
 801bf0e:	f001 fb0f 	bl	801d530 <fn_0801D530>
 801bf12:	f001 fb81 	bl	801d618 <fn_0801D618>
 801bf16:	4b2d      	ldr	r3, [pc, #180]	@ (801bfcc <fn_0801BD8C+0x240>)
 801bf18:	682c      	ldr	r4, [r5, #0]
 801bf1a:	18fb      	adds	r3, r7, r3
 801bf1c:	009b      	lsls	r3, r3, #2
 801bf1e:	50e0      	str	r0, [r4, r3]
 801bf20:	465a      	mov	r2, fp
 801bf22:	0033      	movs	r3, r6
 801bf24:	2109      	movs	r1, #9
 801bf26:	a807      	add	r0, sp, #28
 801bf28:	f7e9 fa96 	bl	8005458 <fn_08005458>
 801bf2c:	a807      	add	r0, sp, #28
 801bf2e:	f001 faff 	bl	801d530 <fn_0801D530>
 801bf32:	f001 fb71 	bl	801d618 <fn_0801D618>
 801bf36:	4b26      	ldr	r3, [pc, #152]	@ (801bfd0 <fn_0801BD8C+0x244>)
 801bf38:	682c      	ldr	r4, [r5, #0]
 801bf3a:	4443      	add	r3, r8
 801bf3c:	009b      	lsls	r3, r3, #2
 801bf3e:	3601      	adds	r6, #1
 801bf40:	50e0      	str	r0, [r4, r3]
 801bf42:	3708      	adds	r7, #8
 801bf44:	2e05      	cmp	r6, #5
 801bf46:	d191      	bne.n	801be6c <fn_0801BD8C+0xe0>
 801bf48:	4822      	ldr	r0, [pc, #136]	@ (801bfd4 <fn_0801BD8C+0x248>)
 801bf4a:	f001 faf1 	bl	801d530 <fn_0801D530>
 801bf4e:	f001 fb63 	bl	801d618 <fn_0801D618>
 801bf52:	4b21      	ldr	r3, [pc, #132]	@ (801bfd8 <fn_0801BD8C+0x24c>)
 801bf54:	50e0      	str	r0, [r4, r3]
 801bf56:	4821      	ldr	r0, [pc, #132]	@ (801bfdc <fn_0801BD8C+0x250>)
 801bf58:	f001 faea 	bl	801d530 <fn_0801D530>
 801bf5c:	f001 fb5c 	bl	801d618 <fn_0801D618>
 801bf60:	4b1f      	ldr	r3, [pc, #124]	@ (801bfe0 <fn_0801BD8C+0x254>)
 801bf62:	50e0      	str	r0, [r4, r3]
 801bf64:	b00b      	add	sp, #44	@ 0x2c
 801bf66:	bcf0      	pop	{r4, r5, r6, r7}
 801bf68:	46bb      	mov	fp, r7
 801bf6a:	46b2      	mov	sl, r6
 801bf6c:	46a9      	mov	r9, r5
 801bf6e:	46a0      	mov	r8, r4
 801bf70:	bcf0      	pop	{r4, r5, r6, r7}
 801bf72:	bc01      	pop	{r0}
 801bf74:	4700      	bx	r0
 801bf76:	46c0      	nop			@ (mov r8, r8)
 801bf78:	0814a93c 	.word	0x0814a93c
 801bf7c:	0814a930 	.word	0x0814a930
 801bf80:	030064c4 	.word	0x030064c4
 801bf84:	00001592 	.word	0x00001592
 801bf88:	0000159c 	.word	0x0000159c
 801bf8c:	0814a948 	.word	0x0814a948
 801bf90:	000015a6 	.word	0x000015a6
 801bf94:	0814a954 	.word	0x0814a954
 801bf98:	00000aeb 	.word	0x00000aeb
 801bf9c:	0000575c 	.word	0x0000575c
 801bfa0:	0000159e 	.word	0x0000159e
 801bfa4:	0814a960 	.word	0x0814a960
 801bfa8:	0814a96c 	.word	0x0814a96c
 801bfac:	0814a978 	.word	0x0814a978
 801bfb0:	0814a984 	.word	0x0814a984
 801bfb4:	0814a990 	.word	0x0814a990
 801bfb8:	0814a99c 	.word	0x0814a99c
 801bfbc:	000015ac 	.word	0x000015ac
 801bfc0:	000015af 	.word	0x000015af
 801bfc4:	000015b0 	.word	0x000015b0
 801bfc8:	000015b1 	.word	0x000015b1
 801bfcc:	000015b2 	.word	0x000015b2
 801bfd0:	000015b3 	.word	0x000015b3
 801bfd4:	0814a9a8 	.word	0x0814a9a8
 801bfd8:	00005750 	.word	0x00005750
 801bfdc:	0814a9b0 	.word	0x0814a9b0
 801bfe0:	00005754 	.word	0x00005754
