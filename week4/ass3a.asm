#abs

.text
	addi $s1, $zero, 8
        or   $s2, $zero, $s1      #copy s1 into s2
        slt  $s3, $s1, $zero      # s1 < 0, s3 = 1
        beq  $s3, $zero, exit     #s3 = 0, s1 > 0 
        sub  $s2, $zero, $s1      #s2 = 0 - s1, s1 < 0

exit:
