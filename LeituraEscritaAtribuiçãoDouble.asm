.data			#faz a leitura e o print de um double
	msg: .asciiz "Forne�a um n�mero decimal: "
	zero: .double 0.0
	
.text
	li $v0, 4 #print String
	la $a0, msg
	syscall
	
	#ler n�mero
	li $v0, 7
	syscall #valor lido estar� em $f0
	
	ldc1 $f2, zero
	add.d $f12, $f2, $f0
	
	li $v0, 3
	syscall