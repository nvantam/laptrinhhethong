INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 M1     db 13,10,'                       Chuc Nang Kiem Tra O Mem'
        db 13,10,'                       -----------o0o-----------'; 
	db 13,10,13,10,'               May tinh dang dung co o mem khong?: $'
 co     db 'Co$'
 khong  db 'Khong$'
 M2  db 13,10,'               So luong o mem ma may tinh co la: $'
 tieptuc db 13,10,13,10,'               An phim bat ky de ve man hinh chuc nang! $'
.CODE
PUBLIC @KIEMTRAOMEM$qv
@KIEMTRAOMEM$qv PROC  
        clrscr
        HienString M1           ; Hien thong bao M1
        int 11h                 ; 0:410h -> AL va 0:411h -> AH
        shr al,1
        jc L1                   ; CF=1 (con o mem) thi nhay den L1, (debug gia tri 26h - 00100110b)
        HienString khong        ; con CF=0 (khong co) thi hien thong bao khong
        jmp Exit                ; Nhay ve Exit
     L1:
        HienString co           ; CF=0 (co o mem) thi hien thong bao co
        HienString M2           ; Hien thong bao M2
        shr al,5                ; AL=so o mem -1
        inc al                  ; AL=so o mem
        add al,30h              ; Bien so sang dang ASCII
        mov ah,0eh              ; Hien o luong o mem len man hinh
        int 10h
     Exit:
        HienString tieptuc
        mov ah,1
        int 21h
        ret
@KIEMTRAOMEM$qv ENDP
END
