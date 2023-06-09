#sum < 0 => loop
.data
 A: .word 1,2,3,4,5
.text
 addi $s1, $zero, 0 #i = 0
 la   $s2, A 
 addi $s3, $zero, 5 #n = 5
 addi $s4, $zero, 1 #step = 1
 addi $s5, $zero, 0 #sum = 0
 
loop:
 slt $t2, $s5, $zero  # sum < zero => t2 = 1
 beq $t2, $zero, endloop 
 add $t1,$s1,$s1 #$t1=2*$s1
 add $t1,$t1,$t1 #$t1=4*$s1
 add $t1,$t1,$s2 #$t1 store the address of A[i]
 lw  $t0, 0($t1)
 add $s5,$s5,$t0 #sum=sum+A[i]
 add $s1,$s1,$s4 #i=i+step
 j   loop        #goto loop
 
endloop:
 
 
 
 
  
 
 