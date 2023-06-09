.data
x: .space 32
y: .asciiz "Hello World 123"

.text
strcpy:
	add $s0, $zero, $zero
	la  $a1, y #Dia chi y
	la  $a0, x #Dia chi x
	
Li:
	add	$t1, $s0, $a1
	lb	$t2, 0($t1)
	add	$t3, $s0, $a0
	sb 	$t2, 0($t3)
	beq	$t2, $zero, end
	nop
	addi	$s0, $s0, 1 
	j	Li
	nop
	end:
#in
	li	$v0, 4
	la	$a0, x
	syscall