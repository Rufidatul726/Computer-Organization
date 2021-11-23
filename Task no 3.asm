.data
	Input1: .asciiz "Enter the dividend: "
	Input2: .asciiz "Enter the divisor: "
	Output: .asciiz "Result of division: Quotient = "
	OutR:	.asciiz "	Remainder = "
	
.globl main
.text
main:
	li $v0, 4
	la $a0, Input1
	syscall 
	
	li, $v0, 5
	syscall 
	add $s0, $v0, 0

	li $v0, 4
	la $a0, Input2
	syscall 
	
	li, $v0, 5
	syscall 
	add $s1, $v0,0
	
	div $s0, $s1
	
	li $v0, 4
	la $a0, Output
	syscall
	
	li, $v0, 1
	mflo $a0
	syscall 
	
	li $v0, 4
	la $a0, OutR
	syscall 
	
	li, $v0, 1
	mfhi $a0
	syscall 
	
End:

     li $v0, 10
     syscall