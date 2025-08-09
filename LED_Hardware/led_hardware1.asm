; always press reset button before and after debugging/undebugging
; set XTAL = 33 MHz. In the same window(right side) -> Target option -> select on chip xram, on chip rom, multiple dptr
; same window, there will be output option, create hex file

; there will be one debug option in the same window -> by default software option is selected -> select simulator for software project
; on the right side on debug -> in Use -> Keil Monitor 51
; now go to settings option -> select Port (check COM from Device Manager). 
; USB Serial port will show up when hardware is connected. COM will also be mentioned there
; Baud rate=38400
; after saving file -> click only rebuild

	ORG 0000H
	MOV P1, #00H
BACK: SETB P1.1
	ACALL DELAY
	CLR P1.1
	ACALL DELAY

	SJMP BACK

DELAY: MOV R2, #10
AGAIN1: MOV R3, #255
AGAIN: MOV R4, #255
HERE: DJNZ R4, HERE
      DJNZ P3, AGAIN
	  DJNZ R2, AGAIN1
	  RET 
	  END
