#Grupo: Caio Godoy, Felipe Leão, João Guilherme Lima, Rafael Abreu
#Questão 4 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Período

.data
	#Criação das variaveis que iram ser impressas para organização dos números
	anos: .asciiz " anos, "
	meses: .asciiz " meses, "
	dias: .asciiz " dias, "
	horas: .asciiz " horas, "
	minutos: .asciiz " minutos e "
	segundos: .asciiz " segundos"
.text
	#Leitura do número de segundos
	addi $v0, $0, 5
	syscall
	#Registrando o valor dos segundos em $t0
	add $t0, $0, $v0
	
	#Registrando o número de segundos em um ano, em $s0
	addi $s0, $0, 31104000
	#Registrando o número de segundos em um mês, em $s1
	addi $s1, $0, 2592000
	#Registrando o número de segundos em um dia, em $s2
	addi $s2, $0, 86400
	#Registrando o número de segundos em uma hora, em $s3
	addi $s3, $0, 3600
	#Registrando o número de segundos em um minuto, em $s4
	addi $s4, $0, 60
	
	#Dividindo o número de segundos lido pelo número de segundos em um ano
	div $t0, $s0
	#Registrando o valor do resultado em $t1, que é o número de anos
	mflo $t1
	#Registrando o valor do resto em $t0, que é o número de segundos restantes
	mfhi $t0
	#Dividindo o número de segundos restantes pelo número de segundos em um mês
	div $t0, $s1
	#Registrando o valor do resultado em $t2, que é o número de meses
	mflo $t2
	#Registrando o valor do resto em $t0, que é o número de segundos restantes
	mfhi $t0
	#Dividindo o número de segundos restantes pelo número de segundos em um dia
	div $t0, $s2
	#Registrando o valor do resultado em $t3, que é o número de dias
	mflo $t3
	#Registrando o valor do resto em $t0, que é o número de segundos restantes
	mfhi $t0
	#Dividindo o número de segundos restantes pelo número de segundos em uma hora
	div $t0, $s3
	#Registrando o valor do resultado em $t4, que é o número de horas
	mflo $t4
	#Registrando o valor do resto em $t0, que é o número de segundos restantes
	mfhi $t0
	#Dividindo o número de segundos restantes pelo número de segundos em um minuto
	div $t0, $s4
	#Registrando o valor do resultado em $t5, que é o número de minutos
	mflo $t5
	#Registrando o valor do resto em $t0, que é o número de segundos restantes
	mfhi $t0
	
	#Imprimindo o número de anos encontrados, com a formatação correta
	addi $v0, $0, 1
	add $a0, $0, $t1
	syscall
	addi $v0, $0, 4
	la $a0, anos
	syscall
	#Imprimindo o número de meses encontrados, com a formatação correta
	addi $v0, $0, 1
	add $a0, $0, $t2
	syscall
	addi $v0, $0, 4
	la $a0, meses
	syscall
	#Imprimindo o número de dias encontrados, com a formatação correta
	addi $v0, $0, 1
	add $a0, $0, $t3
	syscall
	addi $v0, $0, 4
	la $a0, dias
	syscall
	#Imprimindo o número de horas encontradas, com a formatação correta
	addi $v0, $0, 1
	add $a0, $0, $t4
	syscall
	addi $v0, $0, 4
	la $a0, horas
	syscall
	#Imprimindo o número de minutos encontrados, com a formatação correta
	addi $v0, $0, 1
	add $a0, $0, $t5
	syscall
	addi $v0, $0, 4
	la $a0, minutos
	syscall
	#Imprimindo o número de segundos encontrados, com a formatação correta
	addi $v0, $0, 1
	add $a0, $0, $t0
	syscall
	addi $v0, $0, 4
	la $a0, segundos
	syscall
