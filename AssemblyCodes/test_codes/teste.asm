data segment
    max_length      db 100
    actual_length   db ?
    string          db 100 dup(?)
    change_row      db 0dh,0ah,'$'
data ends

stack segment
stack ends

code segment
        assume ds:data,ss:stack,cs:code
    main:
        mov ax,data
        mov ds,AX
        
        ; 输入字符串
        mov dx,offset max_length
        mov ah,10
        int 21h

        ; 大写转换小写
        mov bx,offset string
        mov ch,0
        mov cl,actual_length  ; 此处将actual_length赋值在cx的低8位，相当于手动执行了，cx=actual_length

    while:
        mov al,[bx]
        call TurnSmall
        mov [bx],al
        inc bx
        loop while
    
        ; 添加换行和字符串结尾
        mov bx,offset string
        mov dh,0
        mov dl,actual_length
        add bx,dx
        mov al,24h
        mov [bx],al

        ; 输出字符串
        mov dx,offset change_row
        mov ah,9
        int 21h
        mov dx,offset string
        mov ah,9
        int 21h

        mov ah,4ch
        int 21h

TurnSmall proc
    cmp al,'a'
    jge DONE
    add al,20h
DONE:
    ret
TurnSmall endp

code ends
end main