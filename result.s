.text
.globl main
foo:
  addi $sp, $sp, -8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  addi $fp, $sp, 4
  lw $v0, 8($fp)
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  li $v0, 10
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  jal _add
  addi $sp, $sp, 8
  b ret0
ret0:
  addi $sp, $sp, 8
  lw $ra, 0($fp)
  lw $fp, -4($fp)
  jr $ra
main:
  addi $sp, $sp, -12
  sw $ra, 8($sp)
  sw $fp, 4($sp)
  addi $fp, $sp, 8
  sw $v0, -8($fp)
  la $v0, str_1
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  jal puts
  addi $sp, $sp, 4
  jal geti
  addi $sp, $sp, 0
  sw $v0, -8($fp)
  jal putnl
  addi $sp, $sp, 0
  lw $v0, -8($fp)
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  jal puti
  addi $sp, $sp, 4
  la $v0, str_2
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  jal puts
  addi $sp, $sp, 4
  lw $v0, -8($fp)
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  jal foo
  addi $sp, $sp, 4
  addi $sp, $sp, -4
  sw $v0, 0($sp)
  jal puti
  addi $sp, $sp, 4
  jal putnl
  addi $sp, $sp, 0
ret1:
  addi $sp, $sp, 12
  lw $ra, 0($fp)
  lw $fp, -4($fp)
  jr $ra
_add:
  lw $t0, 0($sp)
  lw $t1, 4($sp)
  add $v0, $t0, $t1
  jr $ra
_sub:
  lw $t0, 0($sp)
  lw $t1, 4($sp)
  sub $v0, $t1, $t0
  jr $ra
_mul:
  lw $t0, 0($sp)
  lw $t1, 4($sp)
  mul $v0, $t0, $t1
  jr $ra
_div:
  lw $t0, 0($sp)
  lw $t1, 4($sp)
  div $v0, $t1, $t0
  jr $ra
_mod:
  lw $t0, 0($sp)
  lw $t1, 4($sp)
  div $v0, $t1, $t0
  mfhi $v0
  jr $ra
puti:
  lw $a0, 0($sp)
  li $v0, 1
  syscall
  jr $ra
putnl:
  la $a0, nl
  li $v0, 4
  syscall
  jr $ra
exit:
  li $v0, 0
  syscall
geti:
  lw $a0, 0($sp)
  li $v0, 5
  syscall
  jr $ra
puts:
  move $a0, $v0
  li $v0, 4
  syscall
  jr $ra
putb:
  move $a0, $v0
  li $v0, 1
  syscall
  jr $ra
_gt:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  sgt  $v0, $t0, $t1
  jr $ra
_sll:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  sll  $v0, $t0, $t1
  jr $ra
_srl:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  srl  $v0, $t0, $t1
  jr $ra
_gte:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  sge  $v0, $t0, $t1
  jr $ra
_lt:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  slt  $v0, $t0, $t1
  jr $ra
_lte:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  sle  $v0, $t0, $t1
  jr $ra
_eq:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  seq  $v0, $t0, $t1
  jr $ra
_neq:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  sne  $v0, $t0, $t1
  jr $ra
_and:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  and  $v0, $t0, $t1
  jr $ra
_or:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  or   $v0, $t0, $t1
  jr $ra
_xor:
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  xor  $v0, $t0, $t1
  jr $ra
_not:
  xor  $v0, $v0, 1
  jr $ra

.data
nl: .asciiz "\n" 
str_1: .asciiz "
Enter a number: "
str_2: .asciiz " + 10 = "
buffer: .asciiz "                                                                                                                                                                                                                                                                "
