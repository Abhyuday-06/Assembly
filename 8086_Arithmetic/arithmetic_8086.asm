;Connect the power cord and keyboard with the kit
;Switch on the power supply
;press reset in the kit
;type A in the keyboard and press ener "Line assembler" will be displayed
;Starting address will be displayed in the kit. Type "1000" as starting address
;Type the program and note address of each line of the code till HLT(halt-similar to END in 8051)
;Press reset in the kit
;Type Go[space] starting address [eg: 1000]
;Press enter in keyboard
;"executing" message will be displayed.
; Press reset in kit
; Give SB(substitute byte) [space] memory location [eg: 2000]
; Output will be displayed


; ADD

MOV AX, 1111H
MOV BX, 2222H
ADD AX, BX
MOV [2000], AX
HLT

; SUB
MOV AX, 2222H
MOV BX, 1111H
ADD AX, BX
MOV [3000], AX
HLT

; MUL 1
MOV AX, 3H
MOV BL, 2H; This is 8 bit so output will be in AX
MUL BL
MOV [4000], AX
HLT

; MUL 2
MOV AX, 2222H
MOV BX, 3333H; This is 16 bit so half of the code will be saved in AX and the rest in DX
MUL BX
MOV [4000], AX
MOV [5000], DX
HLT
