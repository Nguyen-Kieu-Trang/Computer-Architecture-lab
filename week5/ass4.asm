.data
string: 	.space 50
Mess1: 		.asciiz "Nhap xau: "
Mess2:		.asciiz "Do dai xau la: "

.text
main:
get_string: 	#todo
		li 	$v0, 54
		la	$a0,Mess1
		la	$a1, string
		la	$a2, 50
		syscall
get_length:	
		la	$a0,string
		add	$t0, $zero,$zero
check_char:	add 	$t1, $a0, $t0
		lb  	$t2, 0($t1)
		beq     $t2, $zero,end_of_str  
		addi	$t0, $t0, 1
		j    	check_char
		
end_of_str:                            
end_of_get_length:
print_length:
		addi	$t0, $t0, -1
		li	$v0, 56
		la	$a0, Mess2
		la	$a1, 0($t0)
		syscall