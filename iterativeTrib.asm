        .data
input1: .asciiz "Enter tribonacci(0): "
input2: .asciiz "Enter tribonacci(1): "
input3: .asciiz "Enter tribonacci(2): "
input4: .asciiz "Enter n: "

        .text
        .globl main

main:
        #first input
        li $v0, 4
        la $a0, input1
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        #second input
        li $v0, 4
        la $a0, input2
        syscall

        li $v0, 5
        syscall
        move $t1, $v0

        #third input
        li $v0, 4
        la $a0, input3
        syscall

        li $v0, 5
        syscall
        move $t2, $v0

        #n input
        li $v0, 4
        la $a0, input4
        syscall

        li $v0, 5
        syscall
        move $t3, $v0

        beqz $t3, print_first #if n is 0
        beq $t3, 1, print_second #if n is 1
        beq $t3, 2, print_third #if n is 2

        move $t4, $t0 #stores input1 in t4
        move $t5, $t1 #stores input2 in t5
        move $t6, $t2 #stores input3 in t6

        li $t7, 2 #loop start

tribonacci:
        #add previous 3
        add $t8, $t4, $t5 
        add $t8, $t8, $t6

        #shift registers
        move $t4, $t5
        move $t5, $t6
        move $t6, $t8

        addi $t7, $t7, 1 #increment

        bge $t7, $t3, print_result #nth number in sequence

        j tribonacci

#if n is 0
print_first:
        li $v0, 1
        move $a0, $t0
        syscall
        j end_program

#if n is 1
print_second:
        li $v0, 1
        move $a0, $t1
        syscall
        j end_program

#if n is 2
print_third:
        li $v0, 1
        move $a0, $t2
        syscall
        j end_program

#nth number in sequence
print_result:
        li $v0, 1
        move $a0, $t6
        syscall

end_program:
        li $v0, 10
        syscall