ECE281_CE5
==========

MIPS Programming

###Parts 1 & 2

The instruction for Part 1 of the exercise was:
_Load 44 into $s0, -37 into $s1. Store the sum in $s2. Store $s2 in  memory x54._

This table shows the MIPS code which accomplishes this, as well as its translation into binary and hex.

|MIPS Code | Machine Code | Hex translation|
-----------|--------------|----------------
addi $s0, $0, 44 | 00100000000100000000000000101100 | 0x2010002C
addi $s1, $0, -37 | 00100000000100011111111111011011 | 0x2011FFDB
add $s2, $s0, $s1 | 00000010000100011001000000100000 | 0x02119020
sw $s2, 0x54($0) | 10101100000100100000000001010100 | 0xAC120054

Each instruction was run in the MIPS testbench. Once I figured out that the waveformn file had to be modified to have my testbench name in it - not the default - the following waveform was produced.

![alt text](https://github.com/byarbrough/ECE281_CE5/blob/master/sim_2_500ns.PNG?raw=true "Part 2 Simulation")

The four instructions only take a few clock cycles to complete; here is a closer view.

![alt text](https://github.com/byarbrough/ECE281_CE5/blob/master/sim_2_zoom.PNG?raw=true "Part 2 Simulation")

The correct results were stored in the memory signals. The program executed correctly and the final result, 7, was stored in memory.

![alt text](https://github.com/byarbrough/ECE281_CE5/blob/master/sim_2_memResults.PNG?raw=true "Part 2 Simulation Results")
