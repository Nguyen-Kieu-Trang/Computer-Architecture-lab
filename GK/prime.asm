.data
lowerBound: 	.asciiz "Enter A: "
upperBound: 	.asciiz "Enter B: "
result:		.asciiz "Prime number are: \n"
Error:		.asciiz "Interger should be positive! Please enter try again.\n"
BoundCheckError:.asciiz "B should be greater or equal than A! Please try again\n"
noPrime:	.asciiz "No prime number between A and B\n"
OneDisplay:	.asciiz "1 is neither a prime nor a composite number.\n"
space: 		.asciiz " "

#main program
.text
main:
	#Prompt for first interger
	la	$a0, lowerBound		#address of first input prompt
	li	$v0, 4			#system call for string display
	syscall
	li	$v0, 5			#read interger system call
	syscall
	move	$s0, $v0		#store first integer in s0
	
	#Check negative value
	ble	$s0, 0, error1
	
second:
	#Prompt for first integer
	la	$a0, upperBound	#address of first input prompt
	li	$v0, 4		#systemcall for string display
	syscall
	li	$v0, 5		#read integer system call
	syscall
	move	$s1, $v0	#store second integer in s1
	#check negative value
	ble	$s1, 0, error2
#check s0 < s1
	ble $s1, $s0, boundError
	#result prompt
	la 	$a0, result	#error messager
	li	$v0, 4		#syscall for string display
	syscall
	li 	$a1, 0		#couter for prime number
#check prime
check:
	bgt	$s0, $s1, Exit
	move 	$a0, $s0
	jal	checkPrime
	addi	$s0, $s0, 1
	j	check
#end of the program

Exit:
	bne	$a1, 0, end
	la 	$a0, noPrime	#address of no primr mess
	li 	$v0, 4		#syscall for string
	syscall
end:
	li 	$v0, 10		#program end system call
	syscall
#negative error message
error1:
	la	$a0, Error	#address of error mess
	li	$v0, 4
	syscall
	j 	main
error2:
	la	$a0, Error
	li	$v0, 4
	syscall
	j	second
#display bound error
boundError:
	la	$a0, BoundCheckError	#address error
	li	$v0, 4
	syscall
	j	second
#didplay primes prompt
	la	$a0, result	
	li	$v0, 4
	syscall
#prime check function
checkPrime:
	li 	$t0, 0 		#Flag for prime check
	li	$t1, 2		#for loop
	beq	$a0, 1, print1 	#compare interger = 1
	div	$t2, $a0, 2 	#n/2
#loop for prime check
loop:
	bgt	$t1, $t2, print	# for(i = 2, i < n/2; i++)
	div	$a0, $t1	#mode finding
	mfhi	$t4		#mode value
	beq	$t4, 0 , return	#if mode = 0, no prime
	addi	$t1, $t1, 1	#increment counter
	j	loop		#repeat
print:
	li	$v0, 1		#if prime print value system call
	syscall
	la	$a0, space	#address of space
	li	$v0, 4		#print string
	syscall
	addi	$a1, $a1, 1 	#counter for pime numbers
	jr	$ra		#return to main method
#if not prime return to main without display
return:
	jr	$ra
#if integer = 1
print1:
	la 	$a0,OneDisplay	#addess of 1 value display
	li	$v0, 4
	syscall
	jr	$ra	#return to main
	
	
	
	

	
		
			
				
					
						
							
								
									
										
											
												
													
														
															
																
																		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
