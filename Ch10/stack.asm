;
;subroutine to pop the top two operands from the stack 
;and multiply them. push the result onto the stack.
;R6 is the stack pointer

POP	ST	R2, save2
	ST	R1, save1

	LD	R1, BASE
	ADD	R1, R1, #-1
	ADD	R2, R6, R1
	BRz 	fail
	
	LDR	R0, R6, #0
	ADD	R6, R6, #1
	BR	success
	


PUSH	ST	R2, save2
	ST	R1, save1
	LD	R1, MAX
	ADD	R2, R6, R1
	BRz fail
	ADD	R6, R6, #-1
	STR	R0, R6, #0		;ACTUAL PUSH
success LD	R1, save1
	LD	R2, save2
	AND	R5, R5, #0
	RET
fail	LD	R1, save1
	LD	R2, save2
	AND	R5, R5, #0
	ADD	R5, R5, #1
	RET

MAX	.FILL	xC005
save1	.FILL	x0000
save2	.FILL	x0000
BASE	.FILL	xC001

;THIS IS WHAT PUSH AND POP BRINGS BACK
;	AND	R5, R5, #0
;	ADD	R5, R5, #1	;ONLU IF FAIL, SO RETURN R5 WITH ONE WHICH CHECKS IF POP IS SUCCESSFUL

opMult	
	AND	R3, R3, #0
	JSR	POP			;GET THE FIRST NUMBER
	ADD	R5, R5, #0		;IS IT SUCCESSFUL
	BRp	Exit
	ADD	R1, R0, #0
	JSR	POP			;GETS THE SECOND OPERAND
	ADD	R5, R5, #0
	BRp	restore
	ADD	R2, R0, #0		;PUT MULTIPLYER IN R2
	BRzp	PostMult

	ADD	R2, R2, #1		;?? DK WHAT IT DOES
	
PostMult AND 	R0, R0, #0		;CLEAR R0
	ADD	R2, R2, #0
	BRz	PushMult
	
LOOP	ADD	R0, R0, R1		;PERFORM MULTIPLICATION
	ADD	R2, R2, #-1
	BRp	LOOP
	
PushMulT JSR	PUSH
	RET











;subroutine to pop the top two operands from the stack
;and then add them. push the sum onto the stack. 
;R6 is the stack pointer

OpAdd
	JSR	POP			;gets the first source operand, put it in R0
	ADD	R5, R5, #0		;This will test if pop was successful
	BRp	Exit
	ADD	R1, R0, #0		;Make room for the second operand, R1 has first operand
	JSR	POP			;test if the pop operation is successful
	ADD	R5, R5, #0		;gets the second operand, put it in R0
	BRp	restore			;if not successful push the previous pop back to the stack
	ADD	R0, R0, R1		;ADD RO AND R1
	JSR	PUSH			;push the sum to the stack
	
restore	ADD	R6, R6, #-1		;decrement the stack pointer
	
Exit	RET	

