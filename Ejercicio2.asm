.data

.text
	li $s0,0 #inicializamos la variable selector
	li $s1,5 #inicializamos la variable a
	li $s2,3 #inicializamos la variable b
	li $s4,0 #inicializamos la variable c
	
	beq $s0,1,suma #brincamos a suma si el selector es 1
	beq $s0,2,resta #brincamos a resta si el selector es 2
	beq $s0,3,multiplica #brincamos a multiplica si el selectoe es 3
	j andBitwise #por default brincamos a andBitwise si ninguna de las anteriores opciones
	
suma:
	add $s4,$s1,$s2 #suma los dos operandos
	j exit
resta:
	sub $s4,$s1,$s2 #resta los dos operandos
	j exit
multiplica:
	mul $s4,$s1,$s2 #multiplica los dos operandos
	j exit
andBitwise:
	and $s4,$s1,$s2 #aplica un AND a los dos operandos
	j exit
exit:
	j exit
