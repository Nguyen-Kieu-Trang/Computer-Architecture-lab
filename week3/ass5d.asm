# A[i] != 0 => loop

#5D
.data
 A: .word 1,2,3,-4,5
.text
 addi $s1, $zero, 0 #i = 0
 la   $s2, A 
 addi $s3, $zero, 5 #n = 5
 addi $s4, $zero, 1 #step = 1
 addi $s5, $zero, 0 #sum = 0
 li $t2, 3
loop:
 slt $t0, $s5, $zero  # sum < zero => t2 = 1
 beq $t0, $zero, endloop 
 
 add $t1,$s1,$s1 #$t1=2*$s1
 add $t1,$t1,$t1 #$t1=4*$s1
 add $t1,$t1,$s2 #$t1 store the address of A[i]
 
 lw  $t2, 0($t1)
 add $s5,$s5,$t2 #sum=sum+A[i]
 add $s1,$s1,$s4 #i=i+step
 j   loop        #goto loop
 
endloop:
 
 
 
 
  
 
 