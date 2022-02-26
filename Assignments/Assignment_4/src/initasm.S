;set prescalar as 64
#define __SFR_OFFSET 0
#include <avr/io.h>

.global init

.section .text

init:
	ldi r16, 0b00111100
	out DDRD, r16	
	
	ldi r30, 0b00000011 ;the last 3 bits define the prescaler, 101 => division by 64
	out TCCR0B, r30 

