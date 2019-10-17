.data
str1: .asciiz "Digite i: "
str2: .asciiz "Digite j: "
str3: .asciiz "Digite g: "
str4: .asciiz "Digite h: "
str5: .asciiz "Digite f: "
str6: .asciiz "Caso: "

.text
.globl main

main:
	#imprimir str1:
	li $v0, 4
	la $a0, str1
	syscall
	#receber i:
	li $v0, 5
	syscall
	move $t0, $v0
	#imprimir str2:
	li $v0, 4
	la $a0, str2
	syscall
	#receber j:
	li $v0, 5
	syscall
	move $t1, $v0
	#imprimir str3:
	li $v0, 4
	la $a0, str3
	syscall
	#receber g:
	li $v0, 5
	syscall
	move $t2, $v0
	#imprimir str4:
	li $v0, 4
	la $a0, str4
	syscall
	#receber h:
	li $v0, 5
	syscall
	move $t3, $v0
	#imprimir str5:
	li $v0, 4
	la $a0, str5
	syscall
	#receber f:
	li $v0, 5
	syscall
	move $t4, $v0
	
	#vai para o label switch
	j switch
	
switch:
	#verifica o caso zero
	add $s0, $t0, $t1
	beq $s0, $t4, caseZero
	#verifica o caso um
	add $s0, $t2, $t3
	beq $s0 ,$t4, caseUm
	#verifica o caso dois
	sub $s0, $t2, $t3
	beq $s0, $t4, caseDois
	#verifica o caso tres
	sub $s0, $t0, $t3
	beq $s0, $t4, caseTres
	#error
	li $s1,-1
	j fim
	
caseZero:
	li $s1, 0
	j fim

caseUm:
	li $s1, 1
	j fim
caseDois:
	li $s1, 2
	j fim
caseTres:
	li $s1, 3
	j fim
fim:
	#imprimir str6
	li $v0, 4
	la $a0, str6
	syscall
	#imprimir $s1
	li $v0, 1
	move $a0, $s1
	syscall
	#encerra programa
	li $v0, 10
	syscall