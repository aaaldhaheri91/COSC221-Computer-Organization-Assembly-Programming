;Ahmed Aldhaheri
;COSC221, Winter 2016
;Assignment #8
;Description: reverse a string of 9 characters

		
	.ORIG	x3000
	LD	R6, BASE			;R6 = -BASE
	NOT	R6, R6				;R6 = BASE
	ADD	R6, R6, #1			;make 2's complement
	LD	R1, MAX				;R1 = -MAX
	LD	R3, nlneg			;R3 = -10
	LEA	R4, labl			;R4 = point at labl
	
	JSR	READS				;call READS subroutine
	LEA	R0, msg3			;load msg3
	PUTS					;display msg 3
	LD	R0, MAXpos			;load stack
	PUTS					;display stack
	
	LD	R0, nl				;load new line
	OUT					;display new line
				
	LEA	R0, msg4			;load msg4 and display
	PUTS
	GETC					;get character 
	OUT					;display char	
	AND	R3, R3, #0			;clear R3
	ADD	R3, R3, R0			;R3 = R0
	NOT	R3, R3				;R3 = -R3
	ADD	R3, R3, #1			; make 2's complement	
	LD	R0, nl				;load new line
	OUT					;display new line
	LEA	R0, msg5			;load msg5 and display it
	PUTS
				
loop2	JSR	POP				;call POP subroutine		
	ADD	R1, R3, R0			;Check if char poped same as char entered
	BRz	loop2				;if true dont display loop again
	OUT					;if false display 
	BR	loop2				;loop again

done	HALT

PUSH	ADD	R2, R6, R1			;check if stack at max
	BRz	fail				;if it is branch to fail
	ADD	R6, R6, #-1			;decrement pointer by one
	STR	R0, R6, #0			;push character to stack
fail	RET

POP	LD	R1, BASE			;load R1 with base
	ADD	R2, R6, R1			;check if stack empty
	BRz	done				;if stack empty branch to done
	LDR	R0, R6, #0			;load content of pointer R6
	ADD	R6, R6, #1			;increment pointer
	RET 

READS	ADD	R5, R7, #0			;save R7 in R5
	LEA	R0, msg1			;R0 = address of first msg
	PUTS					;display msg1
loop1	GETC					;get char entered
	OUT					;diplay char
	JSR	PUSH				;push subroutine
	STR	R0, R4, #0			;str char in block of memory
	ADD	R4, R4, #1			;add block address pointer
	ADD	R0, R0, R3			;check if char entered is return
	BRp	loop1				;if not return loop
	LEA	R0, msg2			;load msg2
	PUTS					;display msg2
	LEA	R0, labl			;load address of string entered
	PUTS					;display string entered
	ADD	R7, R5, #0			;put R7 back to go back to main 
	RET
	
BASE	.FILL		xC000
MAX	.FILL		xC009			
MAXpos	.FILL		x3FF7

msg1	.STRINGZ	"Enter a string no more than 9 chars ==> "
msg2	.STRINGZ	"The string entered is:  "
msg3	.STRINGZ	"The reversed string is:  "
msg4	.STRINGZ	"Enter a character => "
msg5	.STRINGZ	"The modified string is: "
nlneg	.FILL		#-10			;negative value of return key
nl	.FILL		#10
labl	.BLKW		#9	
	
	.END
