#------------------------------------------------------------------------------
##Function: test logic funtion (p90_Parhami)
#Param[in]: s0	value need to be changed
#Return	  : t0
#Return	  : t1
#------------------------------------------------------------------------------
#include <iregdef.h>
.text
.set reorder
.globl start
.ent start
start:
	li	 	s0,0x0563		#load test value for these function
	andi	t0,s0,0xff		#Extract the LSB of s0
	andi	t1,s0,0x0400	#Extract bit 10 of s0
.end start