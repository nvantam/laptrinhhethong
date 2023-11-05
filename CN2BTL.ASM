include lib1.asm
.model small
.stack 100h
.data
extrn _n:word,_d:word,_u1:word
incorrectn db 13,10,'         Hay vao lai n!$'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
.code
PUBLIC @TONGCSC$qv
@TONGCSC$qv PROC
        mov ax,@data
        mov ds,ax       

        mov cx,_n
        mov bx,_d
        mov dx,_u1
        mov ax,_u1
        dec cx                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
     L1:
        add dx,bx
        add ax,dx
        loop L1
        ret
@TONGCSC$qv ENDP
include lib2.asm
END
