#Grupo: Caio Godoy, Felipe Leão, João Guilherme Lima, Rafael Abreu
#Questão 5 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Período

.data 
  ArrayX:
  	.space 24 	#aloca 6 espaços no array
  ArrayY:
  	.space 24	#aloca 6 espaços no array
  mensagemInvalido:
  	.asciiz "N inválido"
  	
  novaLinha:
  	.asciiz"\n"
  	
  	
.text 
  restart:
  
  	la $s7, ArrayX		#colocar o array x no registrador
  	la $s6, ArrayY		#colcoar o array y no registrador
  
  	li $v0, 5 	#leitura de inteiros (comprimento N)
  	syscall
  	add $t1, $0, $v0 	#colocar o comprimento N dentro do registrador $t1
  
  	bge $t1, 6, jump 	#caso o comprimento N seja maior que 6, o jump faz com que não printe uma mensagem de erro
  	la $a0, mensagemInvalido 	#caso o comprimento N seja menor que 6, é mostrada uma mensagem de inválido
  	addi $v0, $0, 4 	#printar mensagem inválida
  	syscall
  	j restart
  	jump:
  	
  	li $t0, 0
  	
  	while:
  		beq $t0, $t1, whileend	#compara se o contador é igual ao tamanho do array x
  		addi $sp, $sp, -4	#abrir lugar na memória 
  		sw $s7, 0($sp)		#alocar o array x ($s7) no espaço liberado na memória
  		addi $t0, $t0, 1	#adiciona 1 ao contador
  		j while
  	whileend:
  	
  	subi $t3, $t1, 5	#tamanho do meu array y (N-5)
  	
  	li $t0, 0
  	
  	while2:
  		beq $t0, $t3, whileend2 #compara se o contador é igual ao tamanho do array y
  		addi $sp, $sp, -4	#abrir lugar na memória 
  		sw $s6, 0($sp)		#alocar o array y ($s6) no espaço liberado na memória
  		addi $t0, $t0, 1	#incremento
  		j while2
  	whileend2:
 
  	li $t0, 0			#reseta o contador
  	
  	add $t6, $0, $t1		#coloca o array x no registrador $t6
  	
  	loop: 
  	
  		beq $t6, 0, skip	#compara se o comprimento N é igual a 0, se sim, pular os comandos abaixo
		
		li $v0, 5 		#leitura de inteiro (valores do array x)
		syscall
		
		add $t2, $0, $v0	#colocar os valores do array x no registrador $t2
		
		addi $sp, $sp, -4	#liberar mais espaço na memória 
		sw $t2, 0($sp)		#alocar o valor recebido na memória
		subi $t6, $t6, 1	#diminuir o valor de $t1 (comprimento) até zero para o loop terminar após acabarem os valores de dentro dele
		  		  		  		
  		j loop			#voltar ao loop
  		skip:
  		
  		li $t0, 0 	#resetar o contador	
  		
  		li $v0, 4			#lê uma string
  		la $a0, novaLinha		#nova linha (dar enter)
  		syscall
  		
  		printarX:
  			beq $t0, $t1, reset	#compara se o contador é igual ao array x
  			
  			sw $t2, 0($sp)		#retira o número último número alocado na pilha
  			
  			#printar os elementos do array
  			li $v0, 1
  			move $a0, $t2		#printa o número retirado da pilha
  			syscall
  			
  			li $v0, 4		#lê uma string
  			la $a0, novaLinha		#nova linha (dar enter)
  			syscall
				  		 
			addi $t0, $t0, 1	#adiciona 1 ao contador
			
			 j printarX 
		reset:
			li $t0, 0	 	#reseta o contador
		printarY: 
				
  	li $v0, 10 #encerra o programa
  	syscall
