#exercise 1

.eqv SEVENSEG_LEFT    0xFFFF0010
.eqv SEVENSEG_RIGHT   0xFFFF0011

.text
main:
	li	$a0, 0x66
	jal	SHOW_7SEG_LEFT
	li	$a0, 0x7
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