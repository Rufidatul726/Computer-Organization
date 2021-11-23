.data
	Input1:	 .asciiz "\n Enter the multiplier: "
	Input2:  .asciiz "\n Enter the multiplicand:  "
	Result:  .asciiz "\n Result of multiplication = "
	OvFlow:  .asciiz "\n OverFlow"

.globl main
.text
main: 
	li $v0, 4
 	la $a0, Input1
 	syscall 
 	
 	li $v0, 5
 	syscall 
 	add $s0, $v0, 0
 	
 	li $v0, 4
 	la $a0, Input2
 	syscall 
 	
 	li $v0, 5
 	syscall 
	add  $s2, $v0, 0
	
	mult $s0, $s2
	mflo $s1
	mfhi $s3
	sra $s1, $s1, 31
	
	beq $s1, $s3, multiplication
	
	bne $s1, $s3, OverFlow
	
multiplication:
	
	li $v0, 4
 	la $a0, Result
 	syscall
 	
 	mulo  $t1, $s0, $s2
 	
 	li $v0, 1
 	move $a0, $t1
	syscall 
	
	li $v0, 10
	syscall 
 	
OverFlow:
	li $v0, 4
 	la $a0, OvFlow
 	syscall
 	
 	li $v0, 10
	syscall 