.data

.text
	li $s0,0 #selector
	li $s1,5 #a
	li $s2,3 #b
	li $s4,0 #c
	
	beq $s0,1,suma
	beq $s0,2,resta
	beq $s0,3,multiplica
	j andBitwise
	
suma:
	add $s4,$s1,$s2
	j exit
resta:
	sub $s4,$s1,$s2
	j exit
multiplica:
	mul $s4,$s1,$s2
	j exit
andBitwise:
	and $s4,$s1,$s2
	j exit
exit:
	j exit
