#Grupo: Caio Godoy, Felipe Le�o, Jo�o Guilherme Lima, Rafael Abreu
#Quest�o 9 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Per�odo

.data
	#Declara��o das variaveis que iram ser impressas e lidas
	string: .space 20
	fimStr: .asciiz "\n"
	null: .asciiz "\0"
.text
	main:
		#Leitura da string
		addi $v0, $0, 8
		#Registrando a variavel em $a0
		la $a0, string
		#Registrando o tamanho max da string em $a1
		li $a1, 20
		syscall
		#Colocando o valor 0 em $v0
		addi $v0, $0, 0
		#Pulando para a fun��o calcular tamanho e registrando o return adress em $ra
		jal calcularTam
		#Passando o valor de $v0, resultado da fun��o, para $a0
		add $a0, $0, $v0
		#Imprimindo o resultado
		addi $v0, $0, 1
		syscall
		#Pulando para o exit que encerra o programa
		j exit
	
	calcularTam:
		#Loop que tem como condi��o de parada $t0(a letra atual) ser igual a $t1(\n)
		while:
			#Passando o caracter da casa $v0 para $t0
			lb $t0, string($v0)
			#Passando a variavel "\n" para $t1
			lb $t1, fimStr
			#Condi��o de parada do loop, que sendo verdade, pula para o end
			beq $t0, $t1, end
			#Aumenta o $v0 em 1
			addi $v0, $v0, 1
			#Volta para o inicio do loop
			j while
		end:
			#Aumenta o $v0 em 1
			addi $v0, $v0, 1
			#Passando a variavel "\0" para $t0
			lb $t0, null
			#Carregando $t0 na casa $v0 da string, dessa forma, trocando o "/n" por "/0"
			sb $t0, string($v0)
			#Diminuit o $v0 em 1
			subi $v0, $v0, 1
			#Pula para o return adress
			jr $ra
		
	exit:
		addi $v0, $0, 10
		syscall
