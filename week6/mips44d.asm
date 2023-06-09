.data
A: .word -2, -6, -5, -7,1
.text
main:
	la 	$a0,A
	li 	$a1,5
	li	$t0,1
	j	mspfx
	nop
continue:
lock:	addi	$t0,$t0,1 #initialize index i=i+1
        slt  	$t8,$t0,$a1# check i<n?
        beq    $t8,$zero,stop
end_of_main:

mspfx:  
	
	addi	$t1,$t0,-1 #initialize index j=i-1
	#key=a[i]=$t4
        add	$t2,$t0,$t0 #put 2i in $t2
	add	$t2,$t2,$t2 #put 4i in $t2
	add	$t3,$t2,$a0 #put 4i+A (address of A[i]) in $t3
	lw	$t4,0($t3)  #load A[i] from mem(t3) into $t4
check:	#check j>=0
	slti  	$t8,$t1,0 #set $t8 to 1 if j<=0
	beq	$t8,$zero,key #if max sum is less, modify results
	j swap
loop: 	
       add	$t5,$t1,$t1 #put 2i in $t2
       add	$t5,$t5,$t5 #put 4i in $t2
	add	$t6,$t5,$a0 #put 4i+A (address of A[j]) in $t3
	lw	$t7,0($t6)  #load A[j] from mem(t3) into $t7
	
	addi   $a3,$t1,1 #j=j+1
	add	$t5,$a3,$a3 #put 2i in $t2
	add	$t5,$t5,$t5 #put 4i in $t2
	add	$t6,$t5,$a0 #put 4i+A (address of A[j+1]) in $t3
	sw	$t7,0($t6)  #load A[j+1] =A[j]
	
	addi $t1,$t1,-1 #j-=1

	j	check 	#done?
key:	#check key<A[j] ( t4<A[j])
        slt  	$t8,$t4,$t7
	bne     $t8,$zero,loop
	j swap
swap:  #A[j+1]=key
       addi   $a3,$t1,1
       add	$t5,$a3,$a3 #put 2i in $t2
       add	$t5,$t5,$t5 #put 4i in $t2
       add	$t6,$t5,$a0 #put 4i+A (address of A[j+1]) in $t3
       sw $t4,0($t6)
       j continue
stop: