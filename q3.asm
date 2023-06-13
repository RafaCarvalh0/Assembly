#Grupo: Caio Godoy, Felipe Leão, João Guilherme Lima, Rafael Abreu
#Questão 3 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Período

.data
	#Criação das variaveis que iram ser impressas para organização dos números
	virgula: .asciiz ", "
	quebraLinha: .asciiz "\n"
.text
	#Leitura de N
	addi $v0, $0, 5
	syscall
	#Registrando o valor de N em $t0
	add $t0, $0, $v0
	
	#Loop que tem como condição de parada N($t0) ser igual a 0
	while:
		#Condição de parada do loop, que sendo verdade a condição, pula para a função exit que encerra o programa
		beq $t0, 0, exit
		#Registrando o valor 1 em $t1
		addi $t1, $0, 1
		#Novo loop para impressão dos números na formatação pedida, que tem como condição de parada N($t0) ser menor que $t1
		print:
			#Condição de parada do loop, que sendo verdade, pula para o end
			blt $t0, $t1, end
			#Impressão do valor atual de $t1, que vai aumentando com o loop
			addi $v0, $0, 1
			add $a0, $0, $t1
			syscall
			#Comparando se $t0 é igual a $t1, caso seja verdade, chegou ao fim da impressão, logo não pode conter virgula e ter uma quebra de linha, então pula para a função quebrarLinha
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
	#Função que imprime uma quebra de linha
	quebrarLinha:
		addi $v0, $0, 4
		la $a0, quebraLinha
		syscall
		#Pula para o aux, voltando para o loop, sem passar pela impressão da virgula
		j aux
	#Encerrar o programa
	exit:
		addi $v0, $0, 10
		syscall
