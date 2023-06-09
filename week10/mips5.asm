.eqv MONITOR_SCREEN 0x10010000
.eqv GREEN 0x0000FF00
.eqv RED 0x00FF0000
.eqv WHITE 0x00FFFFFF
.text
li $k0, MONITOR_SCREEN
add $t1,$k0,$zero
li $t2,64
li $a3,0
li $v0,5
syscall
add $s1,$v0,$zero  #x1
li $v0,5
syscall
add $s2,$v0,$zero   #y1
li $v0,5
syscall
add $s3,$v0,$zero  #x2
li $v0,5
syscall
add $s4,$v0,$zero  #y2

 

add $s5, $s2,$zero #copy y1
mul $t5,$s2,8
add $t5,$t5,$s1  #Toa do (x1,y1)
mul $t5,$t5,4
add $t5,$t5,$k0 

mul $t4,$s4,8     #Toa do (x2,y2)
add $t4,$t4,$s3
mul $t4,$t4,4
add $t4,$t4,$k0

 

## set the theme color
loop:

     slt $t3,$a3,$t2
     beq $t3,$zero,rectangle1
     li $t0, WHITE
     sw $t0, 0($t1)
     addi $t1,$t1,4
     addi $a3,$a3,1
     j loop
#edge
rectangle1:
    slt $t3,$t5,$t4
    beq $t3,$zero, newcoords

    mul $t6,$s5,8
    add $t6,$t6,$s3  #Toa do (x1,y1)
    mul $t6,$t6,4
    add $t6,$t6,$k0 

    slt $t0,$t5,$t6
    beq $t0,$zero,newrow

    li $t0, RED
     sw $t0, 0($t5)
     addi $t5,$t5,4
     j rectangle1
newrow:
     addi $s5,$s5,1
     mul $t5,$s5,8
    add $t5,$t5,$s1  #Toa do (x1,y1)
    mul $t5,$t5,4
    add $t5,$t5,$k0 
    j rectangle1
newcoords:
     addi $s1,$s1,1
     addi $s2,$s2,1
    addi $s3,$s3,-1
     addi $s4,$s4,-1
     add $s5, $s2,$zero

     mul $t5,$s2,8
    add $t5,$t5,$s1  #Toa do (x1,y1)
    mul $t5,$t5,4
    add $t5,$t5,$k0 

    mul $t4,$s4,8     #Toa do (x2,y2)
    add $t4,$t4,$s3
    mul $t4,$t4,4
    add $t4,$t4,$k0
     j rectangle2

#backfround
rectangle2:
    slt $t3,$t5,$t4
    beq $t3,$zero, exit

    mul $t6,$s5,8
    add $t6,$t6,$s3  #Toa do (x1,y1)
    mul $t6,$t6,4
    add $t6,$t6,$k0 

    slt $t0,$t5,$t6
    beq $t0,$zero,newrow2

    li $t0, GREEN
     sw $t0, 0($t5)
     addi $t5,$t5,4
     j rectangle2
newrow2:
     addi $s5,$s5,1
     mul $t5,$s5,8
    add $t5,$t5,$s1  #Toa do (x1,y1)
    mul $t5,$t5,4
    add $t5,$t5,$k0 
    j rectangle2
exit:.