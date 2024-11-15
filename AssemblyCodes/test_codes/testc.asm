DATA SEGMENT
    array db 100 dup(?)
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
        ASSUME DS:DATA,SS:STACK,CS:CODE
    START:
        MOV AX,DATA
        MOV DS,AX

        mov si,offset array
        mov cx,100  ; 计数器
        mov dl,0
    WHILE:
        mov [si],dl
        inc si
        inc dl
        loop WHILE

        MOV AH,4CH
        INT 21H
CODE ENDS
    END START