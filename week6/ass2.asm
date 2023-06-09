.data
A: .word 8,7,6,9,-2,4
Aend: .word

.text
main:	la	$a2,A       #$a0 = Address(A[0])
	la	$a1,Aend
	addi	$a1,$a1,-4   #$a1 = Address(A[n-1])
	addi	$a3, $a1,0
	j	sort            #sort
	
after_sort:
	li	$v0, 10 	#exit
	syscall
end_main:

sort:	
	li	$v0, 6
	li	$a0, '\n'
	syscall
	beq	$a2,$a1,done #single element list is sorted
	j	max #call the max procedure
after_max:  	
	lw	$t0,0($a1) #load last element into $t0
	sw	$t0,0($v0) #copy last element to max location....
	sw	$v1,0($a1) #copy max value to last element
	addi	$a1,$a1,-4   #decrement pointer to last element
	
	addi 	$v0,$a2,0 #init max pointer to first element
    	lw 	$v1,0($v0) #init max value to first value
    	addi 	$t0,$a2,0 #init next pointer to first
    	j	print#j	sort#repeat sort for smaller list
print:
	li 	$v0, 1 # service 1 is print integer
     	lw 	$a0, 0($t0) # the interger to be printed is 0x307
     	syscall #execute
    
    	li 	$v0, 6
     	li 	$a0, ' '
     	syscall
    
    	beq 	$t0,$a3,sort#if next=last, return
    	addi 	$t0,$t0,4 #init next pointer to first
    	j print
	
done:   j	after_sort

max:	addi	$v0,$a2,0  #init max pointer to first element
	lw	$v1,0($v0)        #init max value to first value
	addi	$t0,$a2,0         #init next pointer to first
loop:	beq	$t0,$a1,ret       #if next=last, return
	addi	$t0,$t0,4     #advance to next element
	lw	$t1,0($t0)        #load next element into $t1
	slt	$t2,$t1,$v1       #(next)<(max) ?
	bne	$t2,$zero,loop	#if (next)<(max), repeat
	addi	$v0,$t0,0	#next element is new max element
	addi	$v1,$t1,0	#next value is new max value
	j	loop	#change completed; now repeat
ret:	j	after_max
