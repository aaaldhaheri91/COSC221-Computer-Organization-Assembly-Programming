		.orig	x3000
		AND		R6,R6,	#0		;clear R6
		AND		R7, R7,	#0		;counter = 0
		AND 	R1, R1, #0		;Clear R1 by ANDing with zero
		AND 	R2, R2, #0		;Clear R2
		LD		R1, NUM1		;load NUM1 to R1
		LD 		R2, NUM2		;load NUM2 to R2
		NOT		R3,	R2			;not R2 and store it in R3
		ADD		R3, R3, #1		; add one to make R3 = -4
		
posLbl	ADD 	R7,	R7,	#1		;counter++
		ADD 	R1,	R1,	R3		;R1 = R1 + R3
		
		BRZ		zeroLbl	
		BRP		posLbl

		ADD		R7,	R7,#-1		;counter--. bc its off by one
		ADD		R6,	R1,	R2		;Adds Rq and R2 to get the remainder
zeroLbl		HALT

NUM1	.FILL	#25
NUM2	.FILL	#4

		.END