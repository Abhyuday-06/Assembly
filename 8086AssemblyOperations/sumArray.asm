; Initialize the array with values 01H, 02H, 03H, 04H, 05H
MOV [1000], 01H     ; Store 01H at memory address 1000H
MOV [1001], 02H     ; Store 02H at memory address 1001H
MOV [1002], 03H     ; Store 03H at memory address 1002H
MOV [1003], 04H     ; Store 04H at memory address 1003H
MOV [1004], 05H     ; Store 05H at memory address 1004H

MAIN: 
MOV CX, 05H         ; Set loop counter (CX) to 5 (for 5 iterations)
MOV AX, 0000H       ; Clear AX register (AX will hold the sum of values)
MOV BX, 0000H       ; Clear BX register (BX will temporarily hold values from the array)
MOV SI, 1000H       ; Load the starting address of the array (1000H) into SI

; Start of loop to sum the values from the array
LOOP_START: 
MOV BL, [SI]        ; Load the byte value at the address pointed by SI into BL (from the array)
ADD AX, BX          ; Add the value in BL (from the array) to AX (sum)
INC SI              ; Increment the source index (SI) to point to the next element in the array
DEC CX              ; Decrement the loop counter (CX)
JNZ LOOP_START      ; Jump to LOOP_START if CX is not zero (repeat until CX=0)

; Store the sum at memory address 3000H
MOV DI, 3000H       ; Load the address 3000H into DI
MOV [DI], AX        ; Store the sum in AX to the address 3000H
HLT                 ; Halt the program execution
