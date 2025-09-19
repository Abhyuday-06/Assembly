; First array
MOV [1000], 01H
MOV [1001], 02H
MOV [1002], 03H
MOV [1003], 04H
MOV [1004], 05H
; Second array
MOV [2000], 06H
MOV [2001], 07H
MOV [2002], 08H
MOV [2003], 09H
MOV [2004], 0AH

; Main code
MOV BX, 5000H      ; Load the starting address (5000H) into BX register
MOV SI, 2000H      ; Load the starting address (2000H) into SI register (source index)
MOV DI, 3000H      ; Load the starting address (3000H) into DI register (destination index)
MOV CX, 0005H      ; Load the counter value (5) into GX register (Note: GX seems unused in this code and might be a typo; CX should be used instead)
L1: 
MOV AL, [SI]       ; Move the byte from the address in SI into AL (load from source)
ADD AL, [DI]       ; Add the byte from the address in DI to AL (add corresponding bytes)
MOV [BX], AL       ; Store the result from AL into the address in BX (write to destination)
INC SI             ; Increment the source index (SI) to move to the next byte
INC DI             ; Increment the destination index (DI) to move to the next byte
INC BX             ; Increment the destination address (BX) to move to the next location
DEC CX             ; Decrement the counter (CX)
JNZ L1             ; (instead of L1 put the address where L1 begins eg: JNZ 3042) Jump to L1 if CX is not zero (repeat loop until CX = 0)
HLT                ; Halt the program execution
