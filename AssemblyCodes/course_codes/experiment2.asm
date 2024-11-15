crlf    macro  ; 宏定义换行回车符
        mov ah,2
        mov dl,0dh
        int 21h
        mov ah,2
        mov dl,0ah
        int 21H
        endm

data segment
    data1   db 5 dup(0)  ; 存放被加数
            db '+','$'
    data2   db 5 dup(0)  ; 存放加数
            db '=','$'
    data3   db 5 dup(0)  ; 存放相加的结果
            db '$'
    mess1   db 'input data1:$'
    mess2   db 'input data2:$'
data ends

stack segment
stack ends

code segment
    assume ds:data,ss:stack,cs:code
    main:
        mov ax,data
        mov ds,ax

        ; 提示并输入data1
        mov ah,9
        mov dx,offset mess1
        int 21h
        mov di,offset data1
        mov cx,5
    n1:
        mov ah,1
        int 21h
        mov [di],al
        inc di
        loop n1
        crlf
        
        ; 提示并输入data2
        mov ah,9
        mov dx,offset mess2
        int 21h
        mov di,offset data2
        mov cx,5
    n2:
        mov ah,1
        int 21h
        mov [di],al
        inc di
        loop n2
        crlf
    
        
        mov ah,9
        mov dx,offset data1
        int 21h
        mov ah,9
        mov dx,offset data2
        int 21h

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
        jnc show
        mov ah,2
        mov dl,31h
        int 21h
    show:
        mov ah,9
        mov dx,offset data3
        int 21h
        crlf

        mov ah,4ch
        int 21h
code ends
end main