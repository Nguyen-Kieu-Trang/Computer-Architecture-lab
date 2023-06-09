.text
	li   $s0,0x12345678
	
.EXTRACT_MSB
	andi $t0,$s0, 0xff000000
	
.CLEAR_LBS
        andi $t1, $s0, 0xffffff00
        
.SET_LSB
	ori $t2, $s0,  0x000000ff
	
.CLEAR
	andi $t3, $s0, 0x00000000
	