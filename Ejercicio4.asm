.data

.text

    li $a0,2
    jal exponencial	
    j exit
    
exponencial:
    addi $sp, $sp, -8
    sw $ra, 0($sp) #direccion de retorno
    sw $s0, 4($sp) #2
    
    slti $t0, $a0, 1	
    beq $t0, $zero, recursividad
    addi $v0, $zero, 1 
    j exitE
recursividad:
    li $s0, 2
    addi $a0, $a0, -1
    jal exponencial
    mul $v0, $s0, $v0
exitE:  
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    addi $sp, $sp, 8
    jr $ra    
    
exit:
