.data
A: .word -2, -6, -1, 3,-2
.text
main:
	la 	$a0,A
	li 	$a1,5
	li	$t0,0
	j	mspfx
	nop
continue:
lock:	addi	$t0,$t0,1 #initialize index i in $t0 to 0
        slt  	$t8,$t0,$a1# check i<n?
        beq    $t8,$zero,stop
end_of_main:
mspfx:  
	
	addi	$t1,$zero,0 #initialize index j in $t1 to 0
	sub     $a2,$a1,$t0
	subi    $a2,$a2,1
	
loop: 	add	$t2,$t1,$t1 #put 2i in $t2
	add	$t2,$t2,$t2 #put 4i in $t2
	add	$t3,$t2,$a0 #put 4i+A (address of A[j]) in $t3
	lw	$t4,0($t3)  #load A[j] from mem(t3) into $t4
	
	addi   $a3,$t1,1 #j=j+1
	add	$t5,$a3,$a3 #put 2i in $t2
	add	$t5,$t5,$t5 #put 4i in $t2
	add	$t6,$t5,$a0 #put 4i+A (address of A[j+1]) in $t3
	lw	$t7,0($t6)  #load A[j+1] from mem(t3) into $t4
	
	slt	$t8,$t4,$t7 #set $t5 to 1 if max sum < new sum
	bne	$t8,$zero,mdfy #if max sum is less, modify results
	j	swap 	#done?
swap:  sw $t7,0($t3)
       sw $t4,0($t6)

mdfy:	addi	$t1,$t1,1   #advance the index i
	slt	$t9,$t1,$a2 #set $t5 to 1 if j<n-i-1
	bne	$t9,$zero,loop #repeat if i<ndone:
	j	continue
stop: