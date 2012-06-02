// Copyright 2012 The Go Authors.  All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


TEXT ·div(SB),7,$0

Q       = 0
N       = 1
D       = 2
CC      = 3
M	= 4

	MOVW	numerator+0(FP), R(N) 
	MOVW	denominator+4(FP), R(D) 
	MOVW	$28, R(CC)	
	MOVW	R(N)>>4, R(M)	// modulo

	CMP	R(M)>>12, R(D)
	SUB.LE	$16, R(CC)
	MOVW.LE	R(M)>>16, R(M)

	CMP	R(M)>>4, R(D)
	SUB.LE	$8, R(CC)
	MOVW.LE	R(M)>>8, R(M)

	CMP	R(M), R(D)
	SUB.LE	$4, R(CC)
	MOVW.LE	R(M)>>4, R(M)

	MOVW	R(N)<<R(CC), R(N)
	RSB	$0, R(D)

	ADD.S	R(N), R(N)	
	ADD	R(CC)<<1, R(CC)
	ADD	R(CC)<<2, PC
	MOVW	R0, R0

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	MOVW	R(N), quotient+8(FP)
	RET

TEXT ·mod(SB),7,$0

	MOVW	numerator+0(FP), R(N) 
	MOVW	denominator+4(FP), R(D) 
	MOVW	$28, R(CC)	
	MOVW	R(N)>>4, R(M)

	CMP	R(M)>>12, R(D)
	SUB.LE	$16, R(CC)
	MOVW.LE	R(M)>>16, R(M)

	CMP	R(M)>>4, R(D)
	SUB.LE	$8, R(CC)
	MOVW.LE	R(M)>>8, R(M)

	CMP	R(M), R(D)
	SUB.LE	$4, R(CC)
	MOVW.LE	R(M)>>4, R(M)

	MOVW	R(N)<<R(CC), R(N)
	RSB	$0, R(D)

	ADD.S	R(N), R(N)	
	ADD	R(CC)<<1, R(CC)
	ADD	R(CC)<<2, PC
	MOVW	R0, R0

// 1
	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	
// 9
	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	
// 17
	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	
// 25
	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	ADC.S	R(M)<<1, R(D), R(M)
	SUB.LO	R(D), R(M)
	ADC.S	R(N), R(N)	

	MOVW	R(M), remainder+8(FP)
	RET
