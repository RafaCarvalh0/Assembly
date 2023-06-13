#Grupo: Caio Godoy, Felipe Leão, João Guilherme Lima, Rafael Abreu
#Questão 10 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Período

.data
	zero: .float 0.0
	maiorQue: .asciiz " maior do que "
	menorQue: .asciiz " menor do que "
	igual: .asciiz " igual a "
.text
	lwc1 $f2, zero
	
	addi $v0, $0, 6
	syscall
	add.s $f1, $f0, $f2
	
	addi $v0, $0, 6
	syscall
	
	c.eq.s $f1, $f0
	bc1t equal
	c.lt.s $f1, $f0
	bc1t less
	
	addi $v0, $0, 2
	add.s $f12, $f1, $f2
	syscall
		
	addi $v0, $0, 4
	la $a0, maiorQue
	syscall
		
	addi $v0, $0, 2
	add.s $f12, $f0, $f2
	syscall
	j exit
	
	equal:
		addi $v0, $0, 2
		add.s $f12, $f1, $f2
		syscall
		
		addi $v0, $0, 4
		la $a0, igual
		syscall
		
		addi $v0, $0, 2
		add.s $f12, $f0, $f2
		syscall
		j exit
		
	less:
		addi $v0, $0, 2
		add.s $f12, $f1, $f2
		syscall
		
		addi $v0, $0, 4
		la $a0, menorQue
		syscall
		
		addi $v0, $0, 2
		add.s $f12, $f0, $f2
		syscall
		j exit
		
	exit:
		addi $v0, $0, 10
		syscall
