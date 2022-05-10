.text
	li $t0, 12
	addi $t1, $zero, 10
	
	sll $s1, $t1, 10 #multiplicação por 10^2 = 1024
	
	#$s0 terá o resultado da multiplicação 
	mul $s0, $t0, $t1
	
	li $v0, 1
	move $a0, $s0
	syscall