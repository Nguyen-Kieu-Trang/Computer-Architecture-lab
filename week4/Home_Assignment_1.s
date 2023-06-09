#------------------------------------------------------------------------------
# @brief       Call procedure with passing params via register 
# @details	   1. Gia tri trong thanh ghi Ra sau khi thuc hien lenh jal la gi
#              2. Theo cach viet trong c.tr nay, sau khi thuc hien xong ctrinh
#                 chinh, thi se MIPS se lam gi? 
#------------------------------------------------------------------------------
#include <iregdef.h>
.text
.set noreorder
.globl start
.ent start
start:
	li		a0,9			#load input parameter
	jal		abs				#jum and link to abs procedure
	nop	
.end start

.ent abs
abs:	
	sub 	v0,zero,a0		#put -(a0) in v0; in case (a0)<0		
	bltz	a0,done			#if (a0)<0 then done
	nop
	add		v0,a0,zero		#else put (a0) in v0
done:	
	jr		ra
.end abs	