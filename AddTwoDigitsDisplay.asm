;	read digits into R1 and R2, compute the sum, and output it	
		.orig x3000
		AND R1, R1, #0		;initialize R1 to 0
		AND R2, R2, #0		;initialize R2 to 0
		LD R3, neg			;loads negative x30 into R3
		IN 					;reads input number into R0 by default, if R0 has a value it overrides it
		ADD R1, R3, R0		;storing first number in R1 after  converting it from ASCII
		IN					;reads another input in R0
		ADD R2, R3, R0		;storing second number in R2
		ADD R0, R1, R2		;Add the two numbers and store them in R0
		LD R3, pos			;loads pos in R3
		ADD R0, R0, R3		;Converting the result in R0 to its ASCII. We use R0 for input and output
		OUT					;display R0, which is the sum onto the Console

		HALT
neg		.FILL xFFD0			;assign -x30 to neg
pos 	.FILL x30			;assign x30 to pos
		
		.END