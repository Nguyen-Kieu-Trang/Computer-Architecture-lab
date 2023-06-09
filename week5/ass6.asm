.data
string: .space 50
enter: .asciiz "\n"
Message1: .asciiz "Nhap vao xau: "
str: .space 20
.text
main:
#in thong bao nhap vao xau
    li $v0, 4
     la $a0, Message1
     la $s2,enter
     syscall

    add $s0,$zero,$zero         #$s0=i=0
    la $a3,string #a0 = address of var string
    li $s1,19     #max_string = 20, bat dau = 0.
loop:
    li $v0, 12
     syscall
     add $t3,$s0,$a3
     bge $s0,$s1,end_loop #length>20 thi endloop
     beq $v0,'\n',end_loop # is enter char?
     sb $v0,0($t3) # save entered char into string a0
    nop
        addi $s0,$s0,1 #index=length +=1
     j loop
end_loop: 

start:               
beq  $s0,$zero,end2
addi $s0,$s0,-1
add  $t4,$a3,$s0  
lbu $a0,0($t4)
li $v0, 11
syscall
j start
end2:


