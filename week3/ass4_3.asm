#ass4.3
#i+j <= 0

.text
 add $s3, $s1, $s2

start:
   slt $t0, $zero, $s3 #t0 = 1
   bne $t0, $zero, else #t0 = 1 => 0 < i + j => else
   addi $t1, $t1, 1
   addi $t3, $zero, 1
   j    endif
   
else: addi $t2, $t2, -1
      add  $t3, $t3, $t3

endif:
