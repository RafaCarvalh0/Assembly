#Grupo: Caio Godoy, Felipe Le�o, Jo�o Guilherme Lima, Rafael Abreu
#Quest�o 7 - Atividade 02
#Infraestrutura de Hardware
#Terceiro Per�odo

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
    #Colocar o t0 que possui "q" em t2 para n�o perder a n�mero quando multiplicado 
    move $t2, $t0 
    #Atribuir a t4 o inteiro 1 para poder usar o t4 de contador
    addi $t4, $0, 1 
    addi $t6, $0, 0

    #Se o "q" for igual a 0, pula para a fun��o que printa o resultado
    beq $t0, 0, exit
    #Se o "n" for igual a 0, pula para a fun��o que printa o resultado
    beq $t1, 0, exit

    #Chamando a fun��o para calcular a PG
    jal calcularAn 

    calcularAn:

        #Multiplica o "q" por "n" 
        mul $t3, $t0, $t2 
        move $t0, $t3 #Move o resultado da multiplica��o para t0 para que o resultado de t0 aumente com o passar do tempo
        move $t5, $t3 #Move o resultado da multiplica��o para t5 para realizar a soma na linha seguinte
        add $t6, $t5, $t6 #Soma o valor de t5 com o t6 e armazena no t6
        #Adiciona +1 no contador t4
        add $t4, $t4, 1
        #Condi��o para sair da fun��o (se t4 for igual a t1)
        beq $t4, $t1, sobra #Faz um jump para a fun��o sobra caso t4 for igual a t1
        j calcularAn


     sobra: #Essa fun��o � um "auxiliar" para somar o valor inicial da PG que se perdia no c�digo
         add $t6, $t6, $t2
         j exit #Faz um jump para a sa�da do programa 
         
     exit:
         #Printa o resultado
         move $a0, $t6
         addi $v0, $0, 1
         syscall