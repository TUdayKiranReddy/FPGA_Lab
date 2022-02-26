;Display seven segment display
#define __SFR_OFFSET 0
#include <avr/io.h>

.global disp_sevenseg

.section .text

disp_sevenseg:
	PUSH R24
	LDI R20, 0b00000010	;counter = 2
	RCALL looplsl		;calling the looplsl routine
	out PORTD, r24		;writing output to pin 13 (PB5)
	POP R24
	RET

;loop for bit shift to left
looplsl:	
	LSL R24			;left shift
	DEC r20			;counter --
	BRNE	looplsl	;if counter != 0
	RET
