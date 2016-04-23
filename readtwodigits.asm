		.orig	x3000
		GETC				;it will reach first char, store it in R0			
		OUT					;echo the first char
		
		LD		R6, negasc		;R6 = -48	 
		ADD		R0, R0, R6		;R0 = R0 - R5		EX: '2' - '0'
		ADD		R1, R0, R0		;R1 = 2 * R0		EX: R1 = 4
		ADD		R2, R1, #0		;R2 = R1			EX: R2 = 4
		ADD		R2, R2, R2		;R2 = R2 * 2		R2 = 8
		ADD 	R2, R2, R2		;R2 = R2 * 2		R2 = 16
		ADD		R2, R2, R1		;R2 = R2 + R1 		R2 = 20

		GETC				;it will reach first char, store it in R0			
 		OUT					;echo second char

		ADD 	R0, R0, R6		;convert to digit from ascci	R0 = 3
		ADD		R3, R2, R0		;R3 = R2 + R0					R3 = 23

		AND		R0, R0, #0
		ADD		R5, R3, #0
loop	
		ADD		R0, R0, #1
		ADD		R5, R5, #-10
		BRzp	loop
		
		ADD		R0, R0, #-1
		LD		R6, posasc
		ADD		R0, R0, R6
		OUT 

		HALT

negasc	.FILL	xFFD0	;-48
posasc	.FILL	x30		;48
		.END