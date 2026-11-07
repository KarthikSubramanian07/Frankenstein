fn_03000DA0:
 3000da0:	e3a03301 	mov	r3, #67108864	@ 0x4000000
 3000da4:	e1a020a2 	lsr	r2, r2, #1
 3000da8:	e3822102 	orr	r2, r2, #-2147483648	@ 0x80000000
 3000dac:	e58310d4 	str	r1, [r3, #212]	@ 0xd4
 3000db0:	e58300d8 	str	r0, [r3, #216]	@ 0xd8
 3000db4:	e58320dc 	str	r2, [r3, #220]	@ 0xdc
 3000db8:	e12fff1e 	bx	lr
