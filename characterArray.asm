;read 10 characters from user and save in array and add one to each value in array
	
	.ORIG	x3000
	LEA	R3, LABEL		;load effective address of array into R3
	LD	R2, ten

input	LEA	R0, msg1
	PUTS				
	GETC				;input a character, R0
	OUT
	STR	R0, R3, #0		;store first character in R3
	LD	R0, NL			;display new line
	OUT
	ADD	R3, R3, #1		;R3 = R3 + 1
	ADD	R2, R2, #-1		;R2 = R2 - 1
	BRp	input		
	
	LEA	R3, LABEL
	LEA	R4, RES
	LD	R2, ten
	
loop	LDR	R0, R3, #0		;R0 = memory of R3
	ADD	R0, R0, #1		;R0 = R0 + 1
	STR	R0, R4, #0		;R3 = R0
	ADD	R3, R3, #1		;R3 = R3 + 1, to next location
	ADD	R4, R4, #1
	ADD	R2, R2, #-1		;R2 = R2 - 1
	BRp	loop
	
	LEA	R3, LABEL
	LEA	R4, RES
	LD	R2, ten
	LEA	R0, msg
	PUTS
	LD	R0, NL
	OUT

output	
	LDR	R0, R3, #0
	OUT				;Display R0
	LD	R0, spa			;space
	OUT
	LDR	R0, R4, #0
	OUT
	LD	R0, NL			;load new line
	OUT				;new line
	ADD	R3, R3, #1
	ADD	R4, R4, #1
	ADD	R2, R2, #-1
	BRp	output


	HALT	

LABEL	.BLKW	#10
ten	.FILL	#10			;size of array
NL	.FILL	#10			;new line
RES	.BLKW	#10			;result array	
spa	.FILL	#32			;space
msg	.STRINGZ	"The ouput is: "
msg1 	.STRINGZ	"Enter a character: "
	.END
