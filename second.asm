;second.asm.	This is a PIC assembly language source file for a time delay
; Author:		Tim Weber
;Date:			120319
;**********************************SETUP***************************
include"P16F877.INC" 			; This tells the assembler to 'include'
							
INNER		EQU 	H'0020' 	; register at address 20h is named INNER
OUTER		EQU	H'0021'		; register at address 21h is named OUTER
delval		EQU 	H'00FF' 	; this is the delay time value 255

;*******************************PORT SETUP*************************
		banksel	TRISD 		;change register bank (page)
		clrf 	PORTD 		; make PORTD an output port
		banksel	PORTD		; change back to original bank
;************************************MAIN**************************
start 		movlw 	0 		; move 'literal' value 0 into the W register
		movwf 	PORTD 		; clear LEDs on PORTD
loop 	incf 	PORTD,F			; update the LEDs by incrementing them
		call	delay 		; Call delay subroutine
		nop			; do nothing at all for one machine cycle
		call	hex

		goto	loop		; go back to the instruction labelled 'loop'
;******************************DELAY SUBROUTINE****************
delay	movlw 	delval 			; load w with delay time value
		movwf	OUTER		; and put it into register for OUTER
delay1	movlw	delval			; load the working register with the delay value
		movwf	INNER		; put it into the register for INNER
delay2	decfsz	INNER, 		F	; count down one and skip if the number is 0
		goto	delay2		; go back and count down one until 0
		decfsz	OUTER, 	F	; count down one and skip if at 0
		goto	delay1		
		return			; return to call point
		end			; note that end is the very last line of code
