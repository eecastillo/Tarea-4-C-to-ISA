.data

.text

    li $a0,2    #asignamos el valor de n
    jal exponencial	#saltamos hacia la funcion exponencial
    j exit #termino el codigo
exponencial:
    addi $sp, $sp, -8 #restamos 8 al tack pointer
    sw $ra, 0($sp) #direccion de retorno
    sw $s0, 4($sp) #2
    
    slti $t0, $a0, 1	#comparamos n con t0
    beq $t0, $zero, recursividad #si se cumple la condicion saltamos a recursividad
    addi $v0, $zero, 1  #cargamos v0 con un 1
    j exitE #saltamos a exitE
recursividad:
    li $s0, 2 #almacenamos un 2 en li
    addi $a0, $a0, -1 #restamos 1 a n
    jal exponencial #saltamos a exponencial
    mul $v0, $s0, $v0 #multiplicamos s0 y v0
exitE:  
    lw $ra, 0($sp) # cargamos ra
    lw $s0, 4($sp) #cargamos s0
    addi $sp, $sp, 8 #regresamos el stack pointer a su estado original
    jr $ra    #saltamos a ra
    
exit:
    j exit
