.data
	RNumIn:	 .asciiz "\n Enter the number of rows in the array:    "
	CNumIn:  .asciiz "\n Enter the number of coloumns in the array:    "
	ArrIn:   .asciiz "\n Enter an array of "
	X:       .asciiz "x"
	X1:      .asciiz " characters:\n "
	ArrOut:  .asciiz "\n The entered "
	X2:      .asciiz " array is:    \n"
	Row1:    .asciiz "\n Enter a row number:    "
	Row2:    .asciiz "\n Enter another row number:    "
	ArrEx:   .asciiz "\n The array after exchanging Row "
	X3:      .asciiz " and Row "
	X4:      .asciiz " is    \n "
	NLine:   .asciiz "\n"
	Space:   .asciiz " "
	.align 4
	Array:   .space 1024
	
	
.globl main
.text 

main:
	li $v0, 4
 	la $a0, RNumIn
 	syscall 
 	
 	li $v0, 5
 	syscall 
 	add $s0, $v0, 0
 	
 	li $v0, 4
 	la $a0, CNumIn
 	syscall 
 	
 	li $v0, 5
 	syscall 
	add  $s2, $v0, 0
	
	li $v0, 4
 	la $a0, ArrIn
 	syscall
 	
 	li $v0, 1
 	addi $a0, $s0, 0
	syscall 
 	
 	li $v0, 4
 	la $a0, X
 	syscall 
 	
 	li $v0, 1
 	addi $a0, $s2, 0
	syscall
	
 	li $v0, 4
 	la $a0, X1
 	syscall 
 	
 	sub $t0, $t0, $t0
 	sub $t3, $t3, $t3
 	
loop:
	li $v0, 5
 	syscall
 	
 	move $s1, $v0
 	sw $s1, Array($t0)
 	
 	addi $t0, $t0, 4
 	addi $t3, $t3, 1
 	
 	beq $t3, $s2, newline
 	
 	j loop
 	
 	
 newline: 
 	li $v0, 4
 	la $a0, NLine
 	syscall
 	
 	mulo $s3,$s0,$s2
 	mul $s3,$s3,4
 	bge  $t0, $s3, print
 	
 	sub $t3, $t3, $t3
 	j loop
 	
 	
print:
	li $v0, 4
 	la $a0, ArrOut
 	syscall
 	
 	li $v0, 1
 	addi $a0, $s0, 0
	syscall 
 	
 	li $v0, 4
 	la $a0, X
 	syscall 
 	
 	li $v0, 1
 	addi $a0, $s2, 0
	syscall
	
	li $v0, 4
 	la $a0, X2
 	syscall
 	
 	sub $t0, $t0, $t0 
 	sub $t3, $t3, $t3
 	
loop1:
	lw $s4,  Array($t0)
	
	li $v0, 1
	move $a0, $s4
	syscall  
	
	li $v0, 4
 	la $a0, Space
 	syscall
		
	addi $t0, $t0, 4
	addi $t3, $t3, 1
	
 	beq $t3, $s2, newline1
 	
 	j loop1
 	
newline1: 
 	li $v0, 4
 	la $a0, NLine
 	syscall
 	
 	mulo $s3,$s0,$s2
 	mul $s3,$s3,4
 	bge  $t0, $s3, exchange_rows
 	
 	sub $t3, $t3, $t3
 	j loop1
 	
exchange_rows:
	
	sub $s1, $s1, $s1
	sub $s4, $s4, $s4
	 
	li $v0, 4
 	la $a0, Row1
 	syscall
 	
 	li $v0, 5
 	syscall 
 	add $s1, $v0, 0
 	
 	li $v0, 4
 	la $a0, Row2
 	syscall 
 	
 	li $v0, 5
	syscall
	addi $s4, $v0, 0
	
	li $v0, 4
 	la $a0, ArrEx
 	syscall
 	
 	li $v0, 1
 	addi $a0, $s1, 0
	syscall
	
	li $v0, 4
 	la $a0, X3
 	syscall
	
	li $v0, 1
 	addi $a0, $s4, 0
	syscall
	
	li $v0, 4
 	la $a0, X4
 	syscall
 	
 	sub $t0,$t0, $t0
 	mulo $t0, $s1, $s2
 	mulo $t0, $t0, 4
 	
 	sub $t1, $t1, $t1
 	mulo $t1, $s4, $s2
 	mulo $t1, $t1, 4
 	
 	sub $t2, $t2, $t2
 	sub $t3, $t3, $t3
 	
loop2:
	lw $s5, Array($t0)
	lw $s6, Array($t1)
	
	sw $s5, Array($t1)
	sw $s6, Array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	addi $t2, $t2, 1
	
	bge $t2, $s2, prr
	
	j loop2
 	
prr:
	sub $t0,$t0, $t0
	sub $t3, $t3, $t3
	j loop3
	
loop3:
	lw $s4,  Array($t0)
	
	li $v0, 1
	move $a0, $s4
	syscall  
	
	li $v0, 4
 	la $a0, Space
 	syscall
		
	addi $t0, $t0, 4
	
	addi $t3, $t3, 1
 	beq $t3, $s2, newline2
 	
 	j loop3
 	
newline2: 
 	li $v0, 4
 	la $a0, NLine
 	syscall
 	
 	bge  $t0, $s3, exit
 	
 	sub $t3, $t3, $t3
 	j loop3
exit:
 	
 	li $v0, 10
 	syscall
