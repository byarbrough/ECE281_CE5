ECE281_CE5
==========

MIPS Programming

###Part 1

Load 44 into $s0, -37 into $s1. Store the sum in $s2. Store $s2 in  memory x54.

|MIPS Code | Machine Code | Hex translation|
-----------|--------------|----------------
addi $s0, $0, 44 | 00100000000100000000000000101100 | 0x2010002C
addi $s1, $0, -37 | 00100000000100011111111111011100 | 0x2011FFDC
add $s2, $s0, $s1 | 00000010000100011001000000100000 | 0x02119020
sw $s2, 0x54($0) | 10101100000100100000000001010100 | 0xAC120054

_Machine Code_
  0x2010002C
  00100000000100000000000000101100
