#void insertSort (int [] a, int length)
#{
#	int i,j;
#	for(i = 1, i < length; i++){
#		int value = a[i];
#		for (j = i -1; j >= 0 && a[j]>value; j--){
#			a[j+1] = a[j];
#			}
#		a[j+1] = value;
#}
.data
myArray: .word 8, 5, 9 ,2, 6
.text
main:
	la 	$a0, myArray
	addi	$a1, $0, 5 #Length of array
	jal 	sort
	addi 	$a0, $v0, 0
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall
	
sort:
	#base = $a0
	#length = $a1
	addi  	$t0, $0, 1  #i = 1
	OuterLoop:
	slt	$t3, $t0, $a1
	beq	$t3, $0, Exit
	sll	$t4, $t0, 2 #Dich trai: i*4
	add	$t4, $t4, $a0 #base + offset
	lw	$t5, 0($t4) # t5 = a[i]
	add	$t1, $t0, -1 # j = i -1
    	InnerLoop:
	slt 	$t4, $t1, $0
	bne 	$t4, $0, ExitInnerLoop 
	sll	$t4, $t1, 2
	add	$t4, $t4, $a0 
	lw 	$t4, 0($t4) #a[j]
	slt	$t6, $t5, $t4
	beq	$t6, $0, ExitInnerLoop
	addi 	$t6, $t1, 1
	sll	$t6, $t6, 2
	add	$t6, $t6, $a0
	sw	$t4,0($t6)
	addi	$t1, $t1, -1
	j	InnerLoop
ExitInnerLoop:	
	addi	$t6, $t1, 1
	sll	$t7, $t6, 2
	add	$t7, $t7, $a0
	sw 	$t5, 0($t7)
	addi	$t0, $t0, 1
	j OuterLoop
	
Exit:	
	#	j Print
#Print:	
#	lw 	$s0, ($a0) #arr[i]  a0= arr, a1 = n, t0 = i
#	addu	$v0, $zero, 1
#	syscall
	
#	beq	$t0, $a1, endPrint  
#	addu	$t0, $t0, 1
#	addu	$a0, $a0, 4 #dia chi phan tu tiep
#	b	Print
#endPrint:



	
