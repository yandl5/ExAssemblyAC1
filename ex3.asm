.data
str1: .asciiz "Raiz: "
str2: .asciiz "Digite o número que você deseja obter a raiz: "

.text
.globl main

main:
	#r
	li $t0, 1
	#d
	li $t1, 2
	#s
	li $t2, 4
	#imprimir str2:
	li $v0, 4
	la $a0, str2
	syscall
	#receber x:
	li $v0, 5
	syscall
	move $t3, $v0
	#t
	li $t4, 1
	#calcular raiz
	beq $t4,1, calcularRaiz
	
calcularRaiz:
	addi $t0, $t0, 1
	addi $t1, $t1, 2
	add $t2, $t2, $t1
	addi $t2, $t2, 1
	bgt $t2, $t3, fim
	j calcularRaiz
	
fim:
	li $t4, 0
	#imprimir str1
	li $v0,4
	la $a0, str1
	syscall
	#imprimir raiz
	li $v0, 1
	move $a0, $t0
	syscall
	#encerra programa
	li $v0, 10
	syscall