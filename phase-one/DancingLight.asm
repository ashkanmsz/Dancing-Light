 
 
 .include "m32def.inc"
 .org 0
  RJMP main
 .org $100


 main:
		ldi R17, $FF
		out DDRA, R17
		out DDRC, R17

;---------- turn off 7seg ------------

		sbi PortC, 0 
		sbi PortC, 1 
    	sbi PortC, 2 
		sbi PortC, 3 
		sbi PortC, 4 
    	sbi PortC, 5 
		sbi PortC, 6 
		sbi PortC, 7 

loop:   
	
;----------- Even 7seg ----------------

		LDI R16,$01			; 0
		out PortA, R16

		CBI PortC, 0		; turn on 7seg
		CBI PortC, 2
		CBI PortC, 4
		CBI PortC, 6
	
		LDI R20,249			; set timer
		OUT OCR0,R20
		LDI R21,$1D
		OUT TCCR0,R21
		LDI R22,$FF

L1:		IN R21,TIFR
		SBRS R21,1
		RJMP L1
		OUT TIFR,R22
		
		;-----------
		LDI R16,$21			; 0,5
		out PortA, R16

L2:		IN R21,TIFR
		SBRS R21,1
		RJMP L2
		OUT TIFR,R22

		;-----------
		LDI R16,$31			; 0,5,4
		out PortA, R16

L3:		IN R21,TIFR
		SBRS R21,1
		RJMP L3
		OUT TIFR,R22


		;-----------
		LDI R16,$39			; 0,5,4,3
		out PortA, R16

L4:		IN R21,TIFR
		SBRS R21,1
		RJMP L4
		OUT TIFR,R22


		;-----------
		LDI R16,$3D			; 0,5,4,3,2
		out PortA, R16

L5:		IN R21,TIFR
		SBRS R21,1
		RJMP L5
		OUT TIFR,R22


		;------------
		LDI R16,$3F			; 0,5,4,3,2,1
		out PortA, R16

L6:		IN R21,TIFR
		SBRS R21,1
		RJMP L6
		OUT TIFR,R22

;------- turn off Even 7seg ------------

		SBI PortC, 0
		SBI PortC, 2
		SBI PortC, 4
		SBI PortC, 6

;----------- Odd 7seg ------------------

		LDI R17,$01 ; 0
		OUT PORTA, R17

		CBI PORTC, 1		; turn on 7seg
		CBI PortC, 3
		CBI PortC, 5
		CBI PortC, 7

L7:		IN R21,TIFR
		SBRS R21,1
		RJMP L7
		OUT TIFR,R22
		;-----------

		LDI R17,$03			; 0,1
		OUT PORTA, R17

L8:		IN R21,TIFR
		SBRS R21,1
		RJMP L8
		OUT TIFR,R22	
		;-----------

		LDI R17,$07			; 0,1,2
		OUT PORTA, R17

L9:		IN R21,TIFR
		SBRS R21,1
		RJMP L9
		OUT TIFR,R22	
		;-----------

		LDI R17,$0F			; 0,1,2,3
		OUT PORTA, R17

L10:	IN R21,TIFR
		SBRS R21,1
		RJMP L10
		OUT TIFR,R22	
		;-----------

		LDI R17,$1F			; 0,1,2,3,4
		OUT PORTA, R17

L11:	IN R21,TIFR
		SBRS R21,1
		RJMP L11
		OUT TIFR,R22	
		;-----------


		LDI R17,$3F			; 0,1,2,3,4,5
		OUT PORTA, R17

L12:	IN R21,TIFR
		SBRS R21,1
		RJMP L12
		OUT TIFR,R22	

;------- turn off Even 7seg ------------

		SBI PORTC, 1
		SBI PortC, 3
		SBI PortC, 5
		SBI PortC, 7

		RJMP loop;
