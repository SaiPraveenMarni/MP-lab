.model small
.data
a db 32
b db 67
c db ?
.code
    mov ax,@data
    mov ds,ax
    mov al,b
    sub al,a
    mov c,al
    mov ah,4ch
    int 21h
    end

