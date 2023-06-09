.data
string: .space 100
result: .asciiz "So phan tu C trong chuoi la: "

.text
#get_string
get_sting:
	li $v0, 8
 	la $a0, string
 	li $a1, 100
 	syscall
#lay do dai xau da nhap
get_length:
	add $t1,$t0,$a3
	lb $t2,0($t1)
	beq $t2, $zero, end_of_str # is null char? 
 	addi $t0, $t0, 1 # $t0 = $t0 + 1 -> i = i + 1
 	j get_length
#xu li do dai xau, de thuc hien vong lap
end_of_str:
	sub $t0,$t0,1 #do xau nhap vao tinh ki tu \n nen -1
	div $s0,$t0,2  #s0 = length /2
	add $s1,$t0,-1 #s1 = length -1
	li $t0,0 #gan lai t0 = 0 index cho loop