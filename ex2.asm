.data
str1: .asciiz "Digite a temperatura: "
str2: .asciiz "Temperatura não permitida: "
str3: .asciiz "Temperatura permitida: "

.text
.globl main

main:
	#imprimir str1:
	li $v0, 4
	la $a0, str1
	syscall
	#receber temperatura:
	li $v0, 5
	syscall
	move $t0, $v0
	
	#vai para o label switch
	j verificarTemp
	
verificarTemp:
	j verificarTempMin
verificarTempMin:
	bge $t0,20, verificarTempMax
	j tempNPermitida
verificarTempMax:	
	ble $t0, 40, tempPermitida
	j tempNPermitida
tempPermitida:
	#imprimir str3
	li $v0, 4
	la $a0, str3
	syscall
	#setando $s1 em 1
	li $s1, 1
	j fim
tempNPermitida:
	#imprimir str2
	li $v0,4
	la $a0, str2
	syscall
	#setando $s1 em 0
	li $s1, 0
	
fim:
	#imprimir temperatura
	li $v0, 1
	move $a0, $t0
	syscall
	#encerra programa
	li $v0, 10
	syscall