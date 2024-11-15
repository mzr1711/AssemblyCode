crlf    macro
        mov dl,0dh
        mov ah,2  ; 2 output a char
        int 21h
        mov dl,0ah
        mov ah,2
        int 21h
        endm

data segment
    data1   db 5 dup(0)
            db '+','$'
    data2   db 5 dup(0)
            db '=','$'
    data3   db 5 dup(0)
            db '$'
    mess1   db 'input num1:$'
    mess2   db 'input num2:$'
    mess3   db 'Name:Ma Zhenrong, ID:202204378, Class:SoftwareEngineering221',0dh,0ah,'$'
data ends

stack segment
stack ends

code segment
    assume ds:data,ss:stack,cs:code
    main:
        mov ax,data
        mov ds,ax

        mov dx,offset mess3
        mov ah,9
        int 21h

        ; 提示并输入data1
        mov dx,offset mess1
        mov ah,9  ; 9 output string
        int 21h
        mov si,offset data1
        mov cx,5
    n1:
        mov ah,1  ; 1 read a char
        int 21h
        mov [si],al
        inc si
        loop n1
        crlf

        ; 提示并输入data2
        mov dx,offset mess2
        mov ah,9  ; 9 output string
        int 21h
        mov si,offset data2
        mov cx,5
    n2:
        mov ah,1  ; 1 read a char
        int 21h
        mov [si],al
        inc si
        loop n2
        crlf

        ; 执行计算
        mov cx,5
        mov si,5
    n3:
        mov al,data1[si-1]
        adc al,data2[si-1]
        aaa
        pushf
        add al,30h
        mov data3[si-1],al
        popf
        dec si
        loop n3

        ; 输出结果
        jnc output
        mov dl,'1'
        mov ah,2
        int 21h
    output:
        mov dx,offset data3
        mov ah,9
        int 21h

        mov ah,4ch
        int 21h
code ends
end main