.data			#faz a leitura e o print de um float
	msg: .asciiz "Forne�a um n�mero decimal: "
	zero: .float 0.0
	
.text
	li $v0, 4 #print String
	la $a0, msg
	syscall
	
	#ler n�mero
	li $v0, 6
	syscall #valor lido estar� em $f0
	
	lwc1 $f1, zero
	add.s $f12, $f1, $f0
	
	li $v0, 2
	syscall