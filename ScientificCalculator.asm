.data
	num1: .asciiz "Enter the first number: "
	num2: .asciiz "Enter the second number: "
	sum: .asciiz "The sum is: "
	multiply: .asciiz "The multiplication is: "
	division: .asciiz "The division is: "
	
	# ----------------List--------------------------
	
	.align 4
	list: .space 20
	min: .word 0
	listMessage: .asciiz "Enter 5 numbers: "
	minMsg: .ascii "Min of the list is: "
	newLine: .asciiz "\n"
	
	# ----------------Triangle--------------------------
	side1: .asciiz "Enter the first side: "
	side2: .asciiz "Enter the second side: "
	side3: .asciiz "Enter the third side: "
	square: .asciiz "The square of the first side is: "
	validMess: .asciiz "Valid triangle"
	invalidMess: .asciiz "Invalid triangle"
.text
	# prompt user to enter number 1
	li $v0, 4
	la $a0, num1
	syscall
	
	# get the user input
	li $v0, 5 # 5 for get an integer from keyboard
	syscall
	
	# store result in $t0
	move $t0, $v0 # set content of $to into $v0

	# prompt user to enter number 2
	li $v0, 4
	la $a0, num2
	syscall
	
	# get the user input
	li $v0, 5 # 5 for get an integer from keyboard
	syscall
	
	# store result in $t0
	move $t1, $v0 # set content of $to into $v0
	
	#----------------------Operations------------------------
	
	# ---------------------------------------------
	# display sum message
	li $v0, 4
	la $a0, sum
	syscall
	
	# perfom the addition operation
	add $t2, $t0, $t1 # $t2 = $t0 + $t1
	
	# print t2 - the sum
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	# print a new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	# ---------------------------------------------
	# display muliplication message
	li $v0, 4
	la $a0, multiply
	syscall
	
	# perfom the muliplication operation
	mul $t2, $t0, $t1 # $t2 = $t0 - $t1
	
	# print t2 - the muliplication
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	# print a new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	# ---------------------------------------------
	# display division message
	li $v0, 4
	la $a0, division
	syscall
	
	# perfom the division operation
	div $t2, $t0, $t1 # $t2 = $t0 - $t1
	
	# print t2 - the division
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	# print a new line
	li $v0, 4
	la $a0, newLine
	syscall
		
	# ------------------List---------------------------
	li $v0, 4
	la $a0, listMessage
	syscall
	
	li $t0, 0 # array index => i
	li $s0, 0 # loop counter
	
	loop:
		li $v0, 5 # read an integer
		syscall
	
		sw $v0, list($t0)
		addi $t0, $t0, 4 # update the array index
		addi $s0, $s0, 1 # increment counter by 1
		blt $s0, 5, loop # branch if less than
	
		li $t0, 0 # array index
		lw $s0, list($t0) # min number
		li $t1, 1 # loop the counter
		
	again:
		 beq $t1, 5, endloop
		 add $t0, $t0, 4
		 lw $s1, list($t0) # $s1 < list[i]
		 ble $s0, $s1, doNothing # if min is less than index, move index to max # to get max replace "ble" with "bge"
		 move $s0, $s1
	doNothing:
		add $t1, $t1, 1
		j again # jump to again loop
		
	endloop:
		# display min list message
		li $v0, 4
		la $a0, minMsg
		syscall 
		
		# display min
		li $v0, 1
		move $a0, $s0
		syscall 
		
		sw $s0, min # sw => store word
	
	# print a new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	
	# ------------------Triangle---------------------------
	# prompt user to enter side 1
	li $v0, 4
	la $a0, side1
	syscall
	
	# get the user input
	li $v0, 5 # 5 for get an integer from keyboard
	syscall
	
	# store result in $t0
	move $t0, $v0 # set content of $to into $v0
	
	# prompt user to enter side 2
	li $v0, 4
	la $a0, side2
	syscall
	
	# get the user input
	li $v0, 5 # 5 for get an integer from keyboard
	syscall
	
	# store result in $t1
	move $t1, $v0 # set content of $t1 into $v0
	
	# prompt user to enter side 3
	li $v0, 4
	la $a0, side3
	syscall
	
	# get the user input
	li $v0, 5 # 5 for get an integer from keyboard
	syscall
	
	# store result in $t2
	move $t2, $v0 # set content of $t2 into $v0
		
	#----------------------Operations------------------------
	
	# ------------------Square---------------------------
	# display square message
	li $v0, 4
	la $a0, square
	syscall
	
	# perfom the square operation
	mul $t3, $t0, $t0 # $t3 = $t0 * $t0
	
	# print t3 - the square
	li $v0, 1
	add $a0, $zero, $t3
	syscall
	
	# print a new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	# ------------------checkValidity---------------------------
	beqz $t0, invalid # if any side is zero length, it is invalid
	beqz $t1, invalid
	beqz $t2, invalid
	
	## if a0 + a1 < a2: invalid
	add $t3, $t0, $t1
	blt $t3, $t2, invalid

	## if a1 + a2 < a0: invalid
	add $t3, $t1, $t2
	blt $t3, $t0, invalid

	## if a0 + a2 < a1: invalid
	add $t3, $t0, $t2
	blt $t3, $t1, invalid
	
	# else block here
	li $v0, 4
    la $a0, validMess
    syscall
    j exit
    	
    invalid:
		li $v0, 4
    	la $a0, invalidMess
    	syscall
    	j exit
    	
    exit:
    	li $v0, 10
    	syscall
		
		
		
		
		
		
		
		
		
		
		
		
	
