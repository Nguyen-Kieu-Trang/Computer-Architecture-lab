#ass4.2
#i >= j

start:
   slt $t0, $s1, $s2 # if i < j => t0 = 1
   bne $t0, $zero, else
   addi $t1, $t1, 1
   addi $t3, $zero, 1
   j    endif
   
else: addi $t2, $t2, -1
      add  $t3, $t3, $t3

endif:
