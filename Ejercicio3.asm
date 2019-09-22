.data
.text
	li $s0,1 #counter
	li $s1,0 #variable
do_while:
	add $s0,$s0,$s0
	div $s1,$s0,4
	slti $t1,$s1,20
	beqz $t1,exit
	j do_while
exit:
	j exit