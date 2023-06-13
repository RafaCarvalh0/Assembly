#Grupo: Caio Godoy, Felipe Leão, João Guilherme Lima, Rafael Abreu
#Questão 1 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Período

.data
	#Criação das variaveis que vão ser impressas
	true: .asciiz "TRUE"
	false: .asciiz "FALSE"
.text
	#Leitura de A
	addi $v0, $0, 5
	syscall
	#Registrando o valor de A em $t0
	add $t0, $0, $v0
	#Leitura de B
	addi $v0, $0, 5
	syscall
	#Registrando o valor de B em $t1
	add $t1, $0, $v0
	#Leitura de C
	addi $v0, $0, 5
	syscall
	#Registrando o valor de C em $t2
	add $t2, $0, $v0
	#Leitura de D
	addi $v0, $0, 5
	syscall
	#Registrando o valor de D em $t3
	add $t3, $0, $v0
	#Soma dos valores de A e D, registrando em $s0
	add $s0, $t0, $t3
	#Comando condicional (==), comparando A+D com 7. Caso seja verdade, pula para o caso1, caso contrário, segue o código normalmente
	beq $s0, 7, caso1
	#Comando condicional (==), comparando B com 2. Caso seja verdade, pula para o caso1, caso contrário, segue o código normalmente
	beq $t1, 2, caso1
	#Imprimindo FALSE, caso ambas condições anteriores sejam falsas
	addi $v0, $0, 4
	la $a0, false
	syscall
	#Pulando para o exit que encerra o programa
	j exit
	
	caso1:
		#Comando condicional (!=), comparando C com 5. Caso seja verdade, pula para o caso2, caso contrário, segue o código normalmente
		bne $t2, 5, caso2
		#Imprimindo FALSE, caso condição anterior seja falsa
		addi $v0, $0, 4
		la $a0, false
		syscall
		#Pulando para o exit que encerra o programa
		j exit
	
	caso2:
		#Imprimindo TRUE
		addi $v0, $0, 4
		la $a0, true
		syscall
		
	exit:
		addi $v0, $0, 10
		syscall
		
