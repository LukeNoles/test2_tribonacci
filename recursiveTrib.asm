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

        beq $t3, $zero, print_first    #if n is 0
        beq $t3, 1, print_second       #if n is 1
        beq $t3, 2, print_third        #if n is 2

	#function call
        move $a0, $t3
        jal tribonacci

        #final
        li $v0, 1
        syscall

end_program:
        li $v0, 10
        syscall

#recursive function
tribonacci:
        beq $a0, $zero, return_trib0
        beq $a0, 1, return_trib1
        beq $a0, 2, return_trib2

        #save
        addi $sp, $sp, -12
        sw $ra, 0($sp)
        sw $s0, 4($sp)
        sw $s1, 8($sp)
	    move $s0, $a0
        
        #tribonacci(n-1)
        addi $a0, $a0, -1
        jal tribonacci
        move $s1, $v0

        #tribonacci(n-2)
        addi $a0, $s0, -2
        jal tribonacci
        move $t4, $v0

        #tribonacci(n-3)
        addi $a0, $s0, -3
        jal tribonacci
        move $t5, $v0

        #find next
        add $v0, $s1, $t4
        add $v0, $v0, $t5

        #return
        lw $ra, 0($sp)
        lw $s0, 4($sp)
        lw $s1, 8($sp)
        addi $sp, $sp, 12
        jr $ra

return_trib0:
        move $v0, $t0 #tribonacci(0)
        jr $ra

return_trib1:
        move $v0, $t1 #tribonacci(1)
        jr $ra

return_trib2:
        move $v0, $t2 #tribonacci(2)
        jr $ra

#tribonacci(0)
print_first:
        li $v0, 1
        move $a0, $t0
        syscall
        jr $ra

#tribonacci(1)
print_second:
        li $v0, 1
        move $a0, $t1
        syscall
        jr $ra

#tribonacci(2)
print_third:
        li $v0, 1
        move $a0, $t2
        syscall
        jr $ra
