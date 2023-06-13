#Grupo: Caio Godoy, Felipe Le�o, Jo�o Guilherme Lima, Rafael Abreu
#Quest�o 4 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Per�odo

.data
	#Cria��o das variaveis que iram ser impressas para organiza��o dos n�meros
	anos: .asciiz " anos, "
	meses: .asciiz " meses, "
	dias: .asciiz " dias, "
	horas: .asciiz " horas, "
	minutos: .asciiz " minutos e "
	segundos: .asciiz " segundos"
.text
	#Leitura do n�mero de segundos
	addi $v0, $0, 5
	syscall
	#Registrando o valor dos segundos em $t0
	add $t0, $0, $v0
	
	#Registrando o n�mero de segundos em um ano, em $s0
	addi $s0, $0, 31104000
	#Registrando o n�mero de segundos em um m�s, em $s1
	addi $s1, $0, 2592000
	#Registrando o n�mero de segundos em um dia, em $s2
	addi $s2, $0, 86400
	#Registrando o n�mero de segundos em uma hora, em $s3
	addi $s3, $0, 3600
	#Registrando o n�mero de segundos em um minuto, em $s4
	addi $s4, $0, 60
	
	#Dividindo o n�mero de segundos lido pelo n�mero de segundos em um ano
	div $t0, $s0
	#Registrando o valor do resultado em $t1, que � o n�mero de anos
	mflo $t1
	#Registrando o valor do resto em $t0, que � o n�mero de segundos restantes
	mfhi $t0
	#Dividindo o n�mero de segundos restantes pelo n�mero de segundos em um m�s
	div $t0, $s1
	#Registrando o valor do resultado em $t2, que � o n�mero de meses
	mflo $t2
	#Registrando o valor do resto em $t0, que � o n�mero de segundos restantes
	mfhi $t0
	#Dividindo o n�mero de segundos restantes pelo n�mero de segundos em um dia
	div $t0, $s2
	#Registrando o valor do resultado em $t3, que � o n�mero de dias
	mflo $t3
	#Registrando o valor do resto em $t0, que � o n�mero de segundos restantes
	mfhi $t0
	#Dividindo o n�mero de segundos restantes pelo n�mero de segundos em uma hora
	div $t0, $s3
	#Registrando o valor do resultado em $t4, que � o n�mero de horas
	mflo $t4
	#Registrando o valor do resto em $t0, que � o n�mero de segundos restantes
	mfhi $t0
	#Dividindo o n�mero de segundos restantes pelo n�mero de segundos em um minuto
	div $t0, $s4
	#Registrando o valor do resultado em $t5, que � o n�mero de minutos
	mflo $t5
	#Registrando o valor do resto em $t0, que � o n�mero de segundos restantes
	mfhi $t0
	
	#Imprimindo o n�mero de anos encontrados, com a formata��o correta
	addi $v0, $0, 1
	add $a0, $0, $t1
	syscall
	addi $v0, $0, 4
	la $a0, anos
	syscall
	#Imprimindo o n�mero de meses encontrados, com a formata��o correta
	addi $v0, $0, 1
	add $a0, $0, $t2
	syscall
	addi $v0, $0, 4
	la $a0, meses
	syscall
	#Imprimindo o n�mero de dias encontrados, com a formata��o correta
	addi $v0, $0, 1
	add $a0, $0, $t3
	syscall
	addi $v0, $0, 4
	la $a0, dias
	syscall
	#Imprimindo o n�mero de horas encontradas, com a formata��o correta
	addi $v0, $0, 1
	add $a0, $0, $t4
	syscall
	addi $v0, $0, 4
	la $a0, horas
	syscall
	#Imprimindo o n�mero de minutos encontrados, com a formata��o correta
	addi $v0, $0, 1
	add $a0, $0, $t5
	syscall
	addi $v0, $0, 4
	la $a0, minutos
	syscall
	#Imprimindo o n�mero de segundos encontrados, com a formata��o correta
	addi $v0, $0, 1
	add $a0, $0, $t0
	syscall
	addi $v0, $0, 4
	la $a0, segundos
	syscall
