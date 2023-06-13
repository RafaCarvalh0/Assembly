#Grupo: Caio Godoy, Felipe Leão, João Guilherme Lima, Rafael Abreu
#Questão 7 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Período

.data

.text
	
	#Receber o inteiro "q" da PG 	
	addi $v0, $0, 5 
	syscall 
	#Colocar o v0 que possui "q" em t0
	move $t0, $v0 
	#Receber o inteiro "n" da PG
	addi $v0, $0, 5  
	syscall
	#Colocar o v0 que possui "n" em t1
	move $t1, $v0 
	#Colocar o t0 que possui "q" em t2 para não perder a número quando multiplicado 
	move $t2, $t0 
	#Atribuir a t4 o inteiro 1 para poder usar o t4 de contador
	addi $t4, $0, 1 
	
	#Se o "q" for igual a 0, pula para a função que printa o resultado
	beq $t0, 0, exit  
	#Se o "n" for igual a 0, pula para a função que printa o resultado
	beq $t1, 0, exit
	
	#Chamando a função para calcular a PG
	jal calcularAn 
	
	calcularAn:
		
		#Multiplica o "q" por "n" 
		mul $t3, $t0, $t2
		#Move o resultado da multiplicação para t0 para que o resultado de t0 aumente com o passar do tempo
		move $t0, $t3
		#Adiciona +1 no contador t4
		add $t4, $t4, 1
		#Condição para sair da função (se t4 for igual a t1)
		beq $t4, $t1, exit
		j calcularAn 	
 	
 	exit:
 		#Move o resultado da PG para a0 para poder printar
 		move $a0, $t0
 		#Printa o resultado
 		addi $v0, $0, 1
 		syscall
