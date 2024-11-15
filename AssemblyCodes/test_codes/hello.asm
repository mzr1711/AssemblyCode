data segment
    mess db 'Hello world!',0dh,0ah,24h
data ends

stack segment
stack ends

code segment
    assume ds:data,ss:stack,cs:code
    main:
        mov ax,data
        mov ds,ax

        mov dx,offset mess
        mov ah,9
        int 21h

        mov ah,4ch
        int 21h
code ends
end main