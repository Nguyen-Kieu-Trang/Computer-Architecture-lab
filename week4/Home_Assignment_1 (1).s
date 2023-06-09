#------------------------------------------------------------------------------
#Function: test overflow in addition (p100_Parhami)
#Param[in]: s1	first operand
#Param[in]: s2  second operand
#Return	  : t0  =0 if not overflow
#               =1 if overflow
#Details  : - compare the sign of s1, s2
#           - check s1 + s2 > s1 or s1 + s2 < s1
#------------------------------------------------------------------------------
#include <iregdef.h>
.text
.set reorder				#Can reoder code for pipeline
.globl start
.ent start
start:
	li 	t0,0				#No Overflow is default status
	add s3,s1,s2            // s3 = sum = s1 + s2
	xor t1,s1,s2			//Phep xor quan trong nhat la xor MSb cua s1 va s2.
	bltz t1,EXIT			//Neu t1 < 0 --> MSb t1 = 1 --> s1 va s2 khac dau --> khong bi overflow
	slt t2,s3,s1	  		//t2 = (sum=s3 < s1)
	bltz s1,NEGATIVE		#Test if s1 and s2 is negative?
	beq	t2,zero,EXIT		#s1 and s2 are positive, if s3 > s1 then the result is not overflow
	b	OVERFLOW					
NEGATIVE:							
	bne	t2,zero,EXIT		#s1 and s2 are negative, if s3 < s1 then the result is not overflow	
OVERFLOW:
	li	t0,1				#the result is overflow
EXIT:
.end start