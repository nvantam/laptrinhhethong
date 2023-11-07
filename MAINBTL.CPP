#include<iostream.h>
#include<conio.h>
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
//bien cho cn1
extern COPYTEP();

//bien cho cn2
extern TONGCSC();

//bien cho cn3
extern KIEMTRAOMEM();

void main() {
    clrscr();
    char t1;
    int chon;
    cout << "\n\t          Truong Dai hoc Mo Ha Noi";
    cout << "\n\t          KHOA CONG NGHE THONG TIN";
    cout << "\n\t          -----------o0o----------";
    cout << "\n\n\n\t           BAI TAP LON MON LTHT";
    cout << "\n\n\n\t     Cac SV thuc hien:";
    cout << "\n\t      1. Ngo Xuan Quy     Lop: 2010A02";
    cout << "\n\t      2. Nguyen Van Tam   Lop: 2010A02";
    cout << "\n\t      3. Tran Cong Tu     Lop: 2010A02";
    cout << "\n\t      4. Nguyen Duc Canh  Lop: 2010A01";
    cout << "\n\n\n\t     Co tiep tuc CT (c/k)?";                                                                                                                                                                               
    t1=getch();
    if(t1=='c'){
    do{
        clrscr(); 
        cout<<"\n\t     CAC CHUONG TRINH COPY TEP, CONG CAP SO CONG, O MEM       ";
        cout<<"\n\t     ------------------------o0o-----------------------       ";
        cout<<"\n\n\t      1. Chuc Nang Copy Tep                                 ";
        cout<<"\n\t      2. Chuc Nang Tinh Tong Cap So Cong Khi Biet n,d,u1      ";
        cout<<"\n\t      3. Chuc Nang Kiem Tra So Luong O Mem                    ";
        cout<<"\n\t      4. Thoat Ve Dos                                         ";
        cout<<"\n\n\t      Moi ban nhap lua chon:"; cin>> chon;
        switch(chon){
            case 1:{
                cout<<COPYTEP();
                break;
            }
            case 2:{
                cout<<TONGCSC();
                break;
            }
            case 3:{
                cout<<KIEMTRAOMEM();
                break;
            }
            case 4:{
                clrscr();
                exit (1);  break;
            }
        }
         if(cin.fail()){
                cin.clear();
                cin.ignore(32767, '\n');
         }
    }while (chon!=0);
    }
return;    
}



