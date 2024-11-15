crlf    macro
        mov dl,0dh
        mov ah,2
        int 21h
        mov dl,0ah
        mov ah,2
        int 21h
        endm

data segment
    str1        db 20,?,21 dup(0)  ; 字符串1数据缓冲区
    str2        db 20,?,21 dup(0)  ; 字符串2数据缓冲区
    mess1       db 'MATCH',0dh,0ah,24h
    mess2       db 'NO MATCH',0dh,0ah,24h
    input_mess1 db 'Please input str1:$'
    input_mess2 db 'Please input str2:$'
    stu_info    db 'Name:Ma Zhenrong, Id:202204378, Class:Software Engineering 221',0dh,0ah,24h
data ends

stack segment
stack ends

code segment
    assume ds:data,ss:stack,cs:code
    main:
    mov ax,data
    mov ds,ax

    ; 学生信息
    mov dx,offset stu_info
    mov ah,9
    int 21h
    crlf

    ; 输入第一个字符串
    mov dx,offset input_mess1
    mov ah,9
    int 21h
    mov dx,offset str1
    mov ah,0ah
    int 21h
    crlf

    ; 输入第二个字符串
    mov dx,offset input_mess2
    mov ah,9
    int 21h
    mov dx,offset str2
    mov ah,0ah
    int 21h
    crlf

    mov cl,str1+1
    cmp cl,str2+1
    jnz noequ  ; 判断两个字符串实际长度是否相等，不相等则跳转输出NO MATCH
    mov ch,0
    mov si,offset str1+2
    mov di,offset str2+2
    ; 循环判断每个字符是否相同
next:
    mov al,[si]
    cmp al,[di]
    jnz noequ
    inc si
    inc di
    loop next
    mov dx,offset mess1
    mov ah,9
    int 21h
    jmp exit
noequ:
    mov dx,offset mess2
    mov ah,9
    int 21h
exit:
    mov ah,4ch
    int 21h
code ends
end main