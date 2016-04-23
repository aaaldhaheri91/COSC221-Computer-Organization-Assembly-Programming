;		largest of 2 1-digit numbers
		.orig x3000
		AND R1, R1, #0
		AND R2, R2, #0
		LD R3, neg
		IN
		ADD R1, R3, R0
		IN
		ADD R2, R3, R0
		NOT R4, R2			;R4 now has the negative of R2, this 1's complement of R2 in R4
		ADD R4, R4, #1		;Add one to R4 to convert to 2's complement
		
		LD R6, pos

		ADD R5, R4, R1
		
		
		BRz lrgR1
		BRp lrgR1
		BRn lrgR2
	
lrgR2	ADD R0, R2, #0
		BR done

lrgR1	ADD R0, R1, #0
done	ADD R0, R0, R6
		OUT


		HALT

neg .FILL xFFD0	
pos .FILL x30
	
		.END

