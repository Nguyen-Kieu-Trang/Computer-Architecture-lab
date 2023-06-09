.data
inputN: .asciiz "Nhap so phan tu trong mang: "
inputArr: .asciiz "Nhap mang:\n"
error: .asciiz "So phan tu phai la so duong. Vui long nhạp lai !!!!\n"
mess1: .asciiz "So nguyen am lon nhat la: "
endl: .asciiz "\n"
mess2: .asciiz "Vi tri cua so do <tinh tu vi tri so 0>: "
.align 2
A: .word #mangsonguyen
.text

	la 	$s0,A #địa chi cơ so cua mang A
	add 	$t0,$zero,$s0 #dia chi phan tu dau tien
	li 	$s2,-100000 	# max hien tai
	li 	$s3,0 		# vi tri tim thay max
get_num:
	#so luong phan tu
	la	$a0, inputN		# In dong inputN
	li	$v0, 4			
	syscall
	li 	$v0, 5
 	syscall
 	
 	blt 	$v0,0,error1
 	add 	$s1,$zero,$v0 	#s1 = n ( so luong phan tu cua mang)
 	li 	$t1,0 		#index i =0
 	la 	$t0,A	#dia chi co so mang A
 	
 # Nhap mang A
 	la	$a0, inputArr		#In dong inputArr
	li	$v0, 4			#system call for string display
	syscall
get_arr:
	beq 	$t1,$s1,end_get_arr  #neu i = N ket thuc nhap mang
	
	li 	$v0, 5
 	syscall
 	#check max am
 	bgez 	$v0, continue
 		check_max:
 			bgt 	$v0,$s2,update_max
 			jal 	continue
 			update_max:
 				move 	$s2,$v0	# gan gtri v0 vao s2
 				move 	$s3,$t1	# gan gtri t1 vao s3
 	continue:
 	sw 	$v0,0($t0)
 	addi 	$t0,$t0,4 	#nhay den dia chi tiep theo trong mang
 	addi 	$t1,$t1,1	#i++
 	j 	get_arr
 
 #In loi neu so phan tu trong mang be hon 0
 error1:
 	li 	$v0, 4
 	la 	$a0, error
 	syscall
 	j	get_num
 end_get_arr:
 # in mess1
 li 	$v0,4
 la 	$a0,mess1
 syscall
 #in so am lon nhat
 li 	$v0, 1
 move 	$a0,$s2
 syscall
 # in \n
 li 	$v0,4
 la 	$a0,endl
 syscall
 # in mess2
 li 	$v0,4
 la 	$a0,mess2
 syscall
 # in vi tri index
 li 	$v0, 1
 move 	$a0,$s3
 syscall
