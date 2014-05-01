ECE281_CE5
==========
MIPS Programming

###Part 1

Load 44 into $s0, -37 into $s1. Store the sum in $s2. Store $s2 in  memory x54.

  ####MIPS Code
  
  addi $s0, $0, 44
  
  addi $s1, $0, -37
  
  addi $s2, $s0, $s1
  
  sw $s2, 0x54($0)
