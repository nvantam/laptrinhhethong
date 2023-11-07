include lib1.asm  ;xac lap 2 marco xoa man hinh, hien sring
.model small
.stack 100h
.data
m1 db 13,10,'                     Chuc Nang Copy Tep ';
   db 13,10,'                     --------o0o-------';
   db 13,10,13,10,'              Vao ten tep can copy:$'
m2 db 13,10,'              Vao ten tep can copy den:$'
err_O db 13,10,'              khong mo duoc tep!$'
err_R db 13,10,'              khong doc duoc tep!$'
err_W db 13,10,'              khong ghi duoc tep!$'
err_C db 13,10,'              khong dong duoc tep!$'
success db 13,10,'              Copy thanh cong!$'  
theteps dw ?
thetepd dw ?
buff db 30
     db ?
file_name db 30 dup(?)
dem db 512 dup(?)
tieptuc db 13,10,13,10,'              Co tiep tuc CT(c/k)?$'
.code
PUBLIC @COPYTEP$qv
@COPYTEP$qv PROC
        mov ax,@data
        mov ds,ax
      L0:
        clrscr
        HienString m1
        lea dx, buff
        call GET_FILE_NAME
        lea dx,file_name      ;chuc nang mo tep da co de doc
        mov al,0              ;al=0 de doc
        mov ah,3dh            ;chuc nang mo tep da co de doc
        int 21h
        jnc L1                ;carry =0 -> L1, =1 --> kt
        HienString err_O
        jmp KT
      L1:
        mov theteps,ax        ;dua the tep vao theteps
        HienString m2         ;tao tep moican copy den
        lea dx,buff
        call GET_FILE_NAME
        lea dx,file_name
        mov cx,0              ;ko xac lap thuoc tinh nao
        mov ah,3ch
        int 21h
        jnc L2
        HienString err_O
        jmp DONGTEPS
      L2:
         mov thetepd,ax        ;cat tep vao thetepd
      L3:                     ;copy 512 byte den vung dem
        mov bx,theteps
        mov cx,512            ;so byte
        lea dx,dem            ;vung dem
        mov ah,3fh            ;chuc nang doc tep
        int 21h
        jnc L4
        HienString err_R
        jmp DONGTEPD
      L4:
        and ax,ax             ;so luong byte da doc nam o ax
        jz DONGTEPD
        mov bx,thetepd
        mov cx,ax             ;cx= so luong byte se ghi
        lea dx,dem            ;vung dem chua byte can ghi
        mov ah,40h           ;cn ghi tep
        int 21h
        jnc L5
        HienString err_W
        jmp DONGTEPD
      L5:
        jmp L3
  DONGTEPD:
        mov bx,thetepd
        mov ah,3eh              
        int 21h
        jnc DONGTEPS
        HienString err_C
  DONGTEPS:

        mov bx,theteps
        mov ah,3eh
        int 21h
        jnc KT
        HienString err_C
     KT: 
        HienString tieptuc
        mov ah,1
        int 21h
        cmp al,'c'              
        jne Thoat
        jmp L0
    Thoat:
        ret                                                                                                                                                                                                                                                                                                                      
@COPYTEP$qv ENDP
include lib4.asm
end
        





