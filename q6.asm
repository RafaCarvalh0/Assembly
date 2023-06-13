#Grupo: Caio Godoy, Felipe Leão, João Guilherme Lima, Rafael Abreu
#Questão 6 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Período

.text
	#Leitura de N
	addi $v0, $0, 5
	syscall
	#Registrar N em $t2
	move $t2,$v0
	#Registra o valor de N em $a0 e $v0
	move $a0,$t2
	move $v0,$t2
	#Pula para a função fibonacci
	jal fibonacci
	#Registra o resultado em $a0
	move $a0,$v0
	#Imprime o resultado
	addi $v0, $0, 1
	syscall
	#Pulando para o exit que encerra o programa
	j exit

	fibonacci:
		#Comparando se $a0 é menor ou igual a 1, caso seja verdade, pula para a função n e retorna $a0(N)
		ble $a0, 1, n
		#Alocando espaço na pilha
		addi $sp, $sp, -4
		#Salvando o return adress na pilha
		sw $ra, 0($sp)
		#Diminui $a0 em 1
		addi $a0, $a0, -1
		#Chamada recursiva fibonacci(n-1)
		jal fibonacci
		#Aumenta $a0 em 1
		addi $a0, $a0, 1
		#Recupera o return adress da pilha
		lw $ra, 0($sp)
		#Limpa o espaço alocado na pilha
		add $sp, $sp, 4
		#Alocando espaço na pilha
		addi $sp, $sp, -4
		#Salvando o resultado na pilha
		sw $v0, 0($sp)
		#Alocando espaço na pilha
		addi $sp, $sp, -4
		#Salvando o return adress na pilha
		sw $ra, 0($sp)
		#Diminui $a0 em 2
		addi $a0, $a0, -2
		#Chamada recursiva fibonacci(n-2)
		jal fibonacci
		#Aumenta $a0 em 2
		addi $a0, $a0, 2
		#Recupera o return adress da pilha
		lw $ra, 0($sp)
		#Limpa o espaço alocado na pilha
		addi $sp, $sp, 4
		#Recupera o resultado da pilha e coloca no registrador $s0
		lw $s0, 0($sp)
		#Limpa o espaço alocado na pilha
		addi $sp, $sp, 4
		#Soma o resultado da recursão de n-2($v0) e n-1($s0) e registra em $v0
		add $v0, $v0, $s0
		#Pula para o return adress
		jr $ra

	n:
		#Passando o valor de $a0 para $v0
		add $v0, $0, $a0
		#Pula para o return adress
		jr $ra
	#Encerrar o programa
	exit:
		addi $v0, $0, 10
		syscall
