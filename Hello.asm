		.orig	x3000
		LEA 	R0, Label		;load address of label
		PUTS					;display string
		HALT
Label	.STRINGZ	"Hello World"

		.END