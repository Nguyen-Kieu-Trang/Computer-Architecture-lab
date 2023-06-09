.eqv SEVENSEG_LEFT    0xFFFF0010
.eqv SEVENSEG_RIGHT   0xFFFF0011
.data
input: .asciiz "Input C: "
print: .asciiz "\nAscii: "
X: .word 0x3f,0x6,0x5b,0x4f,0x66,0x6d,0x7d,0x7,0xff,0x6f
.align 0
res: .space 80
.text
Nhapso:
#Input N
	la 	$a0, input #address of input integer
	li 	$v0, 4 #system call for string display
	syscall
	li 	$v0, 12 #read character system call
	syscall
	move 	$a3, $v0 
	#chuyen ki tu qua so nguyen
	la 	$a0, print #address of input integer
	li 	$v0, 4 #system call for string display
	syscall
	
	li 	$v0,1
	move	$a0,$a3
	syscall
	move 	$s0, $a0	
Chia:
	#lay hang don vi
	li	$t3, 10
	div 	$s0,$t3
	mflo	$s0
	mfhi	$t1 #chu so hang don vi
	#lay hang chuc
	div	$s0,$t3
	mfhi	$t2 #chu so hang chuc

main: 
	#lay dia chi mang X
	la	$s1, X
	
	mul 	$t5, $t1, 4
	add	$t0, $s1, $t5
	lw	$a0, 0($t0)
	jal	SHOW_7SEG_LEFT
	
	mul 	$t5, $t2, 4
	add	$t0, $s1, $t5
	lw	$a0, 0($t0)
	jal	SHOW_7SEG_RIGHT
exit:	li	$v0, 10
	syscall
endmain:

SHOW_7SEG_LEFT:	li   $t0,  SEVENSEG_LEFT
		sb   $a0,  0($t0)
		jr   $ra
		
SHOW_7SEG_RIGHT:	li   $t0,  SEVENSEG_RIGHT
		sb   $a0,  0($t0)
		jr   $ra
	