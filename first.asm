;first.asm.	This is a PIC assembly language source file for a 7-segment display
; Author:		Tim Weber
;Date:			02/04/2019
;**********************************SETUP***************************
include		  "P16F877.INC" 		; This tells the assembler to 'include'
								
INNER		  EQU   h'20' 			; register at the hex address 20 is named INNER
OUTER		  EQU	h'21'			; register at the hex address 21 is named OUTER
count_up	  EQU	h'22'			; register at the address hex 22 is named count_up
count_down	  EQU	h'23'			; register at the hex address 23 is named count_down
delval		  EQU   h'FF'			; this is the delay time value 255

;*******************************PORT SETUP*************************
banksel	    	TRISD 		    	;change register bank (page)
clrf 	      	PORTD 		    	; make PORTD an output port
banksel	    	PORTD		      	; change back to original bank
;************************************MAIN**************************
start 	
loop		movlw 	      0 		; move 'literal' value 0 into the W register
		movwf 	      count_up		; move 0 into the variable count_up
		movlw	      H'000A'		; w = 10
		movwf	      count_down	; moves the value 10 into the varible count_down
disp_count	movf	      count_up, W	; set w to count_up
call		hex_tab		                ; call the hex table
movwf		PORTD		                ; outputting to port D
call		delay		                ; call the delay function
incf		count_up,    F			; increment the count_up file
decfsz		count_down,  F			; decrease the count_down value until zero
goto		disp_count
goto		loop				; jump to the label loop 
;******************************DELAY SUBROUTINE****************
delay		movlw		delval 		; load w with delay time value
		movwf		OUTER		; and put it into register for OUTER
delay1		movlw		delval		; load the working register with the delay value
		movwf		INNER		; put it into the register for INNER
delay2		decfsz		INNER, F	; count down one and skip if the number is 0
		goto		delay2		; go back and count down one until 0
		decfsz		OUTER, F	; count down one and skip if at 0
		goto		delay1		
		return				      ; return to call point
						
; ****************************Hex table for 0 - 9 in HEX************
hex_tab		ddwf	PCL,   F			  ; Add the W contents to the program counter to the program counter. Point to the first item in the table
			    retlw	h'88'		  ; Hex code to display 0
			    retlw	h'ED'		  ; Hex code to display 1
			    retlw	h'94'		  ; Hex code to display 2
			    retlw	h'A4'		  ; Hex code to display 3
			    retlw	h'E1'		  ; Hex code to display 4
			    retlw	h'A2'		  ; Hex code to display 5
			    retlw	h'82'		  ; Hex code to display 6
			    retlw	h'EC'		  ; Hex code to display 7
			    retlw	h'80'		  ; Hex code to display 8
			    retlw	h'E0'		  ; Hex code to display 9
			    return
			    end
