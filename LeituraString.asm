.data				#Programa que faz a leitura de um nome e printa
	pergunta: .asciiz "Olá, qual seu nome? "
	saudacao: .asciiz "Olá, "
	nome: .space 25
	
.text
	#pergunta
	li $v0, 4 #print String
	la $a0, pergunta
	syscall
	
	#leitura do nome
	li $v0, 8
	la $a0, nome
	la $a1, 25
	syscall
	
	#print a saudação
	li $v0, 4 
	la $a0, saudacao
	syscall
	
	#print nome
	li $v0, 4 
	la $a0, nome
	syscall
	