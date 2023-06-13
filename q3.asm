#Grupo: Caio Godoy, Felipe Le�o, Jo�o Guilherme Lima, Rafael Abreu
#Quest�o 3 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Per�odo

.data
	#Cria��o das variaveis que iram ser impressas para organiza��o dos n�meros
	virgula: .asciiz ", "
	quebraLinha: .asciiz "\n"
.text
	#Leitura de N
	addi $v0, $0, 5
	syscall
	#Registrando o valor de N em $t0
	add $t0, $0, $v0
	
	#Loop que tem como condi��o de parada N($t0) ser igual a 0
	while:
		#Condi��o de parada do loop, que sendo verdade a condi��o, pula para a fun��o exit que encerra o programa
		beq $t0, 0, exit
		#Registrando o valor 1 em $t1
		addi $t1, $0, 1
		#Novo loop para impress�o dos n�meros na formata��o pedida, que tem como condi��o de parada N($t0) ser menor que $t1
		print:
			#Condi��o de parada do loop, que sendo verdade, pula para o end
			blt $t0, $t1, end
			#Impress�o do valor atual de $t1, que vai aumentando com o loop
			addi $v0, $0, 1
			add $a0, $0, $t1
			syscall
			#Comparando se $t0 � igual a $t1, caso seja verdade, chegou ao fim da impress�o, logo n�o pode conter virgula e ter uma quebra de linha, ent�o pula para a fun��o quebrarLinha
			beq $t0, $t1, quebrarLinha
			addi $v0, $0, 4
			la $a0, virgula
			syscall
			aux:
			#Aumenta o $t1 em 1
			addi $t1, $t1, 1
			#Volta para o inicio do loop
			j print
		end:
		#Diminui o N($t0) em 1
		subi $t0, $t0, 1
		j while
	#Fun��o que imprime uma quebra de linha
	quebrarLinha:
		addi $v0, $0, 4
		la $a0, quebraLinha
		syscall
		#Pula para o aux, voltando para o loop, sem passar pela impress�o da virgula
		j aux
	#Encerrar o programa
	exit:
		addi $v0, $0, 10
		syscall
