.data
input: .asciiz "Input N: "
Error:	.asciiz "Interger should be positive! Please enter try again.\n"
result: .asciiz "The integer in octal system is: "
.align 0
res: .space 80
.text
main:	
	#Input N
	la	$a0, input		#address of input integer
	li	$v0, 4			#system call for string display
	syscall
	li	$v0, 5			#read interger system call
	syscall
	move 	$s0, $v0		#store first integer in s0
	
	#check positive
	blez 	$s0, error
	#print result messenger
	la	$a0, result		#address of result mess
	li	$v0, 4
	syscall
	# Change
	li 	$t0, 8
	la 	$s1, res 	# $s1 luu dia chi co so cua res
	li 	$t2, 0 		# bien dem index i
	Solv:
		div 	$s0,$t0
		mflo 	$s0 	# thuong cap nhat vao $s0
		mfhi 	$a0 	# phan du = $t1
		pushStack:
			sb 	$a0,0($s1)
			beqz 	$s0,Exit
			addi 	$t2,$t2,1
			add 	$s1,$s1,1
		
		jal 	Solv
error:
	la	$a0, Error	#address of error mess
	li	$v0, 4
	syscall
	j 	main
Exit:
	li 	$v0,1
	Loop:
		bltz 	$t2,ExitLoop
		lb 	$a0,0($s1)
		syscall
		addi 	$t2,$t2,-1
		add 	$s1,$s1,-1
		jal 	Loop
	ExitLoop: