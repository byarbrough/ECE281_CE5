ECE281_CE5
==========

MIPS Programming

###Part 1

Load 44 into $s0, -37 into $s1. Store the sum in $s2. Store $s2 in  memory x54.

MIPS Code | Machine Code | Hex translation
-----------------------------------------
addi $s0, $0, 44 | 00100000000100000000000000101100 | 0x2010002C

addi $s1, $0, -37 | |

addi $s2, $s0, $s1 | |

sw $s2, 0x54($0) | |

_Machine Code_
  0x2010002C
  00100000000100000000000000101100
