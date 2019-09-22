.data
	Vector1: .word 1 2 3
	Vector2: .word 6 7 8
	Results: .word 0
.text
	li $s0, 3 #k
	li $s1, 0 #i
	li $s2, 0 #acc
	la $a0, Vector1
	la $a1, Vector2
	la $a2, Results
for:
	slt $t0,$s1,$s0
	beqz $t0,exit
	jal multAndAccumulate
	addi $s1,$s1,1
	j for
	 
multAndAccumulate:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	li $s4,0 #mulRes
	li $s5,0 #Resultado
	lw $t1,0($a0)#vector1[0]
	lw $t2,0($a1)#vector2[0]
	lw $t3,0($a2)#Results[0]
	mul $s4,$t1,$t2
	jal Acumulate
	add $s5,$s5,$s6
	sw  $s5,0($a2)
	addi $a2,$a2,4
	addi $a1,$a1,4
	addi $a0,$a0,4
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
Acumulate:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	li $s6,0 #suma
	add $s6,$s2,$s4
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
	
exit:
	j exit
