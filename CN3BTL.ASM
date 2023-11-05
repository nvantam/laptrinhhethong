INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 M1 db 13,10,'              May tinh dang dung co o mem khong? $'
 co db 'co$'
 ko db 'khong$'
 M2 db 13,10,'             So luong o mem ma may tinh co la: $'
 M3 db 13,10,13,10,'              An phim bat ki de tro ve menu$'
.CODE
PUBLIC @KIEMTRAOMEM$qv
@KIEMTRAOMEM$qv PROC  
     PS:
        mov ax,@data
        mov ds,ax
     
        HienString M1
        int 11h        
        shr al,1
        jc L1
        HienString ko
        jmp Exit
     L1:
        HienString co   
        HienString M2
        mov cl,5           
        shr al,cl
        inc al              
        add al,30h            
        mov ah,0eh          
        int 10h
    Exit:
        HienString M3
        mov ah,1
        int 21h
        ret
@KIEMTRAOMEM$qv ENDP
END
