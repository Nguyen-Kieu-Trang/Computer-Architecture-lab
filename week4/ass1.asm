.text
start:
	li $s1, -0x00000001
	li $s2, -0x10000000
	li $t0, 0
	addu $s3, $s1, $s2
	xor  $t1, $s1,$s2
	
	bltz $t1, EXIT
	slt  $t2,$s3,$s1
	bltz $s1,NEGATIVE
	beq  $t2,$zero,EXIT
	j    OVERFLOW
NEGATIVE:
	bne  $t2,$zero,EXIT
OVERFLOW:
	li   $t0,1  #the result is overflow
EXIT: