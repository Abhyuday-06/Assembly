; Use 11.0592 MHz and 9600 baud interface


org 0000h

start:
    mov a, #38h       ; dictate LCD function set
    acall command
    acall delay

    mov a, #0Eh       ; cursor on
    acall command
    acall delay

    mov a, #01h       ; clear display
    acall command
    acall delay

    mov a, #06h       ; entry mode set (increment cursor)
    acall command
    acall delay

    mov a, #0C0h      ; set DDRAM address (start of second line)
    acall command
    acall delay

    ; display letters "VITCC"
    mov a, #'V'
    acall display
    acall delay

    mov a, #'I'
    acall display
    acall delay

    mov a, #'T'
    acall display
    acall delay

    mov a, #'C'
    acall display
    acall delay

    mov a, #'C'
    acall display
    acall delay

again:
    sjmp again        ; infinite loop

;------------------------------------
; Send command to LCD
command:
    mov p2, a         ; move command to port 2
    clr p3.7          ; RS = 0 for command
    clr p3.6          ; RW = 0 for write
    setb p3.5         ; Enable = 1
    acall delay
    clr p3.5          ; Enable = 0
    ret

;------------------------------------
; Display character on LCD
display:
    mov p2, a         ; move data to port 2
    setb p3.7         ; RS = 1 for data
    clr p3.6          ; RW = 0 for write
    setb p3.5         ; Enable = 1
    acall delay
    clr p3.5          ; Enable = 0
    ret

;------------------------------------
; Simple delay routine
delay:
    mov r3, #50
here2:
    mov r4, #255
here:
    djnz r4, here
    djnz r3, here2
    ret

end
