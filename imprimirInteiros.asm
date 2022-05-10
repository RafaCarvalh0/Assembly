.data 
	idade: .word 56 #valor int na memoria ram
	
.text 
	li $v0, 1
	lw $a0, idade
	syscall 