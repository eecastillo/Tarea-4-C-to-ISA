.data
	Vector1: .word 1 2 3
	Vector2: .word 6 7 8
	Results: .word 0
.text
	li $s0, 3 #asignamos k a s0
	li $s1, 0 #asignamos i a s1
	li $s2, 0 #asignamos acc a s2
	la $a0, Vector1 #cargamos la direccion de memoria de Vector1 a a0
	la $a1, Vector2 #cargamos la direccion de memoria de Vector2 a a1
	la $a2, Results #cargamos la direccion de memoria de Results a a2
for:
	slt $t0,$s1,$s0	#comparamos si i es menor a k
	beqz $t0,exit #rompemos el ciclo si la condicion no se cumple
	jal multAndAccumulate #saltamos a multandAccumulate
	addi $s1,$s1,1 #incrementamos el contador
	j for #reiniciamos el ciclo
	 
multAndAccumulate:
	addi $sp,$sp,-4 #movemos el stack pointer para poder almacenar la direccion de retorno
	sw $ra,0($sp) #guardamos la direccion de retorno en el stack
	li $s4,0 #mulRes
	li $s5,0 #Resultado
	lw $t1,0($a0)#vector1[0]
	lw $t2,0($a1)#vector2[0]
	lw $t3,0($a2)#Results[0]
	mul $s4,$t1,$t2 #se multiplican t1 y t2 para guardarse en s4
	jal Acumulate #brincamos a la funcion Acumulate
	add $s5,$s5,$s6 #sumamps s5 y s6
	sw  $s5,0($a2) #cargamos a la posicion 0 de Results s5
	addi $a2,$a2,4 #Nos desplazamos a la siguiente localidad de memoria en el arreglo
	addi $a1,$a1,4 #Nos desplazamos a la siguiente localidad de memoria en el arreglo
	addi $a0,$a0,4 #Nos desplazamos a la siguiente localidad de memoria en el arreglo
	lw $ra,0($sp) #cargamos la direccion de retorno del stack
	addi $sp,$sp,4 #regresamos el stack pointer a su posicion previa
	jr $ra #brincamos a la direccion recuperada del stack
Acumulate:
	addi $sp,$sp,-4 #decrementamos el stack pointer
	sw $ra,0($sp) #almacenamos la direccion de retorno
	li $s6,0 #inicializacion de variable suma
	add $s6,$s2,$s4 #suma de s2 y s4
	lw $ra,0($sp) #cargamos el valor del stack a ra
	addi $sp,$sp,4 #regresamos el stack pointer a su posicion inicial
	jr $ra #brincamos a la direccion de memoria almacenada
	
exit:
	j exit #termino el programa
