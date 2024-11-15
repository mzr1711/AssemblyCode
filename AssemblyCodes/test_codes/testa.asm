DATA SEGMENT
    x dw 1234h
    y dw 2345h
    z dw ?
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
    ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
    MOV AX,DATA
    MOV DS,AX

    mov ax,x
    add ax,y
    mov z,ax

    MOV AH,4CH
    INT 21H
CODE ENDS
END MAIN
