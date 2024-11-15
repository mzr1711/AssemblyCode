DATA SEGMENT
    x dw 1234h
    y dw 2345h
    z dw -1234h
    w dw ?
DATA ENDS

STACK SEGMENT
    nums dw 100h dup(?)
    top dw length nums
STACK ENDS

CODE SEGMENT
        ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
        mov ax,DATA
        mov DS,ax
        mov ax,STACK
        mov SS,ax
        mov ax,top
        mov sp,ax

        mov ax,x
        push ax
        mov ax,y
        push ax
        mov ax,z
        push ax

        call MAXIMUM
        mov w,ax

        mov ah,4ch
        int 21h

MAXIMUM PROC
        mov bp,sp
        mov ax,[bp+2]
        cmp ax,[bp+4]
        jge DONE
        mov ax,[bp+4]
    DONE:
        cmp ax,[bp+6]
        jge DONE2
        mov ax,[bp+6]
    DONE2:
        RET

MAXIMUM ENDP

CODE ENDS
END MAIN