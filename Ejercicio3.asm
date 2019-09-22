.data
.text
	li $s0,1 #inicializa la variable counter
	li $s1,0 #inicializamos la variable con nombre variable
do_while:
	jal suma #saltamos a suma
	div $s1,$s0,4 #dividimos counter entre cuatro y lo asignamos a variable
	slti $t1,$s1,20 #comparamos si variable es menor que 20
	beqz $t1,exit #rompemos el ciclo si se cumple la condicion
	j do_while #volvemos a empezar el ciclo
suma:
	addi $sp,$sp,-4 #disminuimos en 4 el stack pointer
	sw $ra,0($sp) #almacenamos la direccion de retorno en el stack
	add $s0,$s0,$s0 #sumamos 
	lw $ra,0($sp) #cargamos en ra lo que hay en el stack
	addi $sp,$sp,4 #lo regresamos a su direccion original
	jr $ra #saltamos a ra
exit:
	j exit #fin del programa