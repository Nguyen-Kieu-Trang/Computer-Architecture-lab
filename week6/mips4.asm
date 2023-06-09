#bubble sort
#int n = 11, swap = 0,i,j,temp;
#int arr[11] = {2,3,1,0,5,7,6,4,2,9,8};
#for(i = 0; i < n-1; i++){
#	for(j = 0; j < n-i-1; j++){
#		if(arr[j] > arr[j+1]){
#			temp = arr[j];
#			arr[j] = arr[j+1];
#			arr[j+1] = temp;
#			swap = 1;
#			}
#		}
#		if(!=swap)	break;
#	}
#	for(i = 0; i < n; i++){
#		printf("%d", arr[i]);
#	}
#	return 0;
#}

.data
arr:	.word 2,3,1,0,5,7,6,4,2,9,8 #array
n:	.word 11 #array length
.text

main:
	la	$t1, arr
	lw	$s0, n
	subu	$s0, $s0, 1 #n-1
	
	addu	$s5, $zero, $zero #swap = 0
	addu 	$s1, $zero, $zero # i = 0
for:
	
	addu 	$s2, $zero, $zero #j=0
	#lw	$t4, ($t1) #arr[i]
	#n - i - 1
	subu	$t9, $s0, $s1
	
	#and	$t2, $zero, $zero
	#addu	$t2, $t1, 4 #dia chi phan tu tiep theo
	internalFor:
		addu	$t2, $t1, 4 #dia chi phan tu tiep theo
		lw	$t4, ($t1) #arr[i]
		lw	$t5, ($t2) #arr[j+1]
		
		bleu 	$t4, $t5, dontSwap  # arr[j] <= arr[j+1] goto donSwap
	
		sw	$t4, ($t2) #arr[j] = arr[j+1]
		sw	$t5, ($t1) #arr[j+1] = arr[j]
	
		addu	$s5, $zero, 1 #swap = 1
		
		dontSwap:
		
		beq	$s2, $t9, endInternalFor #j = n-i-1 goto endInternalFor
		addu	$s2, $s2, 1 #j++
		addu	$t1, $t1, 4 #dia chi phan tu tiep theo cho j
		addu	$t2, $t2, 4 #dia chi phan tu tiep theo cho j + 1
		b	internalFor # j < n-i-1 goto interFor
		
	endInternalFor:
	beqz	$s5, endFor #if(!=swap) break; goto endFor
	beq	$s1, $s0, endFor #i = n-1 endFor
	addu	$s1, $s1, 1 #i++
	la	$t1, arr
	b	for	# i < n -1 goto For
	
endFor:
	
la	$t1, arr #dia chi phan tu dau
add	$s1, $zero, $zero #i = 0


print:	
	lw 	$a0, ($t1) #arr[i]  t1= arr, s0 = n, s1 = i
	addu	$v0, $zero, 1
	syscall
	
	beq	$s1, $s0, endPrint  #s1 = i
	addu	$s1, $s1, 1
	addu	$t1, $t1, 4 #dia chi phan tu tiep
	b	print
endPrint:
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
