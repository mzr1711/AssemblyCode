DATA SEGMENT
    x dw 1234h
    y dw 2345h
    z dw -1234h
    w dw ?
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
    ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
    MOV AX,DATA
    MOV DS,AX

    mov ax,x
    cmp ax,y  ; 让ax中一直存储最大值
    jge DONE
    mov ax,y
DONE:
    cmp ax,z
    jge DONE2
    mov ax,z
DONE2:
    mov w,ax
    
    MOV AH,4CH
    INT 21H

CODE ENDS
END MAIN