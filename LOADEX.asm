		.ORIG	x3000
		LD	R1, SIX
		LEA	R2, NUM			;load the address, load effective address
		AND	R3, R3, #0

AGAIN	LDR	R4, R2, #0			;R4 = Content of R2
		ADD R2, R2, #1			;increment R2 address by one
		ADD R3, R3, R4			;R3 = R3 + R4
		ADD R1, R1, #-1			;decrement counter
		BRp	AGAIN			;if its positive loop again
		
		ST	R3, RES			;store r3 in result		

		HALT

SIX		.FILL 	x0006
NUM		.BLKW	6			;reserve 6 area for NUM	
RES		.BLKW	1	
		.END