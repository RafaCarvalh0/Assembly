.data #dados na mem�ria principal
	msg: .asciiz "Ol�, mundo!"
	
.text #�rea com instru��es do programa
	li $v0, 4 #instru��o de impress�o de string
	la $a0, msg #indicar o endere�o em que est� a mensagem
	syscall #imprimir