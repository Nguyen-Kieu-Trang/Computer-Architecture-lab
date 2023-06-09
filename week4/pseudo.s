#Function: test switch...case structure

#include <iregdef.h>    // Thu vien dinh nghia ten goi nho cua thanh ghi, chang han s0 
.data					// Cho biet data segment (doan du lieu, bien) bat dau tu day
test: .word	1
.text					// Cho biet text segment (doan chuong trinh), cac lenh asm bat dau tu day
.set reorder            // Cho phep thay doi trat tu cac lenh, de toi uu hoa
.ent main               // Khai bao thu tuc main
ins_abs:               
   abs  s0, s1		    // Pseudo ins: s0 = |s1|
ins_move:
   move s0, s1   	    // Pseudo ins: s0 <= s1
ins_not:
   not s0, s1   	    // Pseudo ins: s0 <= bit invert (s1)
ins_ble:
   ble s0, s1,label     // Pseudo ins: if (s0 < s1) then jump to label;
label:
   
.end main               // Ket thuc thu tuc main