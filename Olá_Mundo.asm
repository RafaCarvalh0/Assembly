.data #dados na memória principal
	msg: .asciiz "Olá, mundo!"
	
.text #área com instruções do programa
	li $v0, 4 #instrução de impressão de string
	la $a0, msg #indicar o endereço em que está a mensagem
	syscall #imprimir