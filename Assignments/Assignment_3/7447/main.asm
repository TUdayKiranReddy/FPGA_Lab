.include "/home/solomon/FPGA/m328Pdef.inc"

ldi r16, 0b00111100
out DDRD, r16
ldi r30, 0b00000100 ;the last 3 bits define the prescaler, 101 => division by 512
out TCCR0B, r30 
ldi r29, 0b00100100

loop:
	ldi r16, 0b0000011
	out PORTD, r16
	display:
		inc r16
		ldi r19, 0b00100000 ;times to run the loop = 64
		rcall PAUSE
		out PORTD, r16
		cpi r16, 0b00101000
		brne display
		rjmp loop 

PAUSE:	;this is delay (function)
lp2:	;loop runs 64 times
		IN r30, TIFR0 ;tifr is timer interupt flag (8 bit timer runs 256 times)
		ldi r17, 0b00000010
		AND r30, r17 ;need second bit
		BREQ PAUSE 
		OUT TIFR0, r17	;set tifr flag high
	dec r19
	brne lp2
	ret