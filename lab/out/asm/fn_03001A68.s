fn_03001A68:
 3001a68:	e0022000 	and	r2, r2, r0
 3001a6c:	e59fc018 	ldr	ip, [pc, #24]	@ 3001a8c <fn_03001A68+0x24>
 3001a70:	e1a02082 	lsl	r2, r2, #1
 3001a74:	e19120b2 	ldrh	r2, [r1, r2]
 3001a78:	e59cc0c4 	ldr	ip, [ip, #196]	@ 0xc4
 3001a7c:	e08cc382 	add	ip, ip, r2, lsl #7
 3001a80:	e1a00003 	mov	r0, r3
 3001a84:	e583c014 	str	ip, [r3, #20]
 3001a88:	eaffff50 	b	30017d0 <fn_030017D0>
 3001a8c:	030064cc 	.word	0x030064cc
