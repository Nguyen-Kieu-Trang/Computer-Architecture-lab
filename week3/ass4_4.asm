#ass4.4
#i+j > m+ n

.text
 add $s3, $s1, $s2 #s3 = i+j
 add $s6, $s4, $s5 #s6 = m + n

start:
   slt $t0, $6, $s3 #t0 = 1
   beq $t0, $zero, else #t0 = 0 => s6 > s3 => else
   addi $t1, $t1, 1 
   addi $t3, $zero, 1
   j    endif
   
else: addi $t2, $t2, -1
      add  $t3, $t3, $t3

endif:
