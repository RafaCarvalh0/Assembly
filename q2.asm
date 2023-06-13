#Grupo: Caio Godoy, Felipe Le�o, Jo�o Guilherme Lima, Rafael Abreu
#Quest�o 2 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Per�odo

.data
	#Declarando a string e seu tamanho
	string: .space 20
	quebraLinha: .asciiz "\n"
.text
	#Leitura da string(S)
	addi $v0, $0, 8
	la $a0, string
	li $a1, 20
	syscall
	#Leitura do char(C1)
	addi $v0, $0, 12
	syscall
	#Movendo o conte�do(o char) de $v0 para $t0
	move $t0, $v0
	#Imprimindo uma quebra de linha, para a leitura ficar mais organizada
	addi $v0, $0, 4
	la $a0, quebraLinha
	syscall
	#Leitura do char(C2)
	addi $v0, $0, 12
	syscall
	#Movendo o conte�do(o char) de $v0 para $t1
	move $t1, $v0
	#Loop que tem como condi��o de parada o contador($t3) ser igual a o tamanho max da string ($a1)
	while:
		##Condi��o de parada do loop, que sendo verdade, pula para o end
		beq $t3, $a1, end
		#Carrega o char da string na posi��o do contador($t3) em $t2
		lb $t2, string($t3)
		#Comparando se o char(C1) � diferente do char atual em $t2, caso seja verdade, pula a troca, caso seja igual, segue o codigo
		bne $t0, $t2, jump
		#A troca � feita carregando o char(C2) na string, na posi��o do contador($t3)
		sb $t1, string($t3)
		jump:
		#Adiciona 1 ao contador $t3
		addi $t3, $t3, 1
		#Volta ao inicio do loop
		j while
	end:
	#Imprimindo uma quebra de linha, para organiza��o
	addi $v0, $0, 4
	la $a0, quebraLinha
	syscall
	#Imprime a nova string com as devidas mudan�as
	la $a0, string
	addi $v0, $0, 4
	syscall
