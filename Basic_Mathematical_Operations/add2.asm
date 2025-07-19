ORG 0000H
MOV A, #31H
MOV B, #29H
ADDC A, B ; Each memory location can have a maximum of 2 hexadecimal digits. This is why we're adding 8531 and 2927 in two steps
MOV 30H, A

MOV A, #85H
MOV B, #27H
ADDC A, B
MOV 31H, A
END
