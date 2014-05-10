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


###Part 3

This task was to modify the MIPS schematic and VHDL files to allow for ori (Or immediate) so that the command _ori $S3, $S2, x8000_ could be executed. Looking at the schematic, I couldn't find a reason why the ALU, which already does Or, couldn't just go for it; everything was wired for addi, how different could ori be?

|MIPS Code | Machine Code | Hex translation|
-----------|--------------|----------------
ori $S3, $S2, x8000 | 00110110010100111000000000000000 | 0x36538000

Well, as it turns out, it's a lot different.
![alt text](https://github.com/byarbrough/ECE281_CE5/blob/master/firstOri_sim.PNG?raw=true "ori flunk")

This came complete with "XXXX" to mem(18) which is $s0, where the ori was supposed to be stored. So what went wrong?

Well, first and foremost, the gray "-----" is because the VHDL file had that in the case of 'others'. So that was an easy 
change, I simply had to add another state.
The XXX's gave me a little more trouble. I continued to debug, working with the Lesson 39 slides, to get the ori implemented. I knew that I had to use part of the immediate signal to or with a 32 bit signal, so I had to concatenate 16 zeros. Then I needed another mux to determine which of the signals to send into the ALU. Informal discussion with classmates lead to these general ideas. The implementation of these changes can be seen in the schematic below.


Dr. Neebel eventually pointed out that my testbench file was missing a wait for clock period... this dumb error accounted for the XXXs in the instruction signal.

I ran the testbench, and behold!
![alt text](https://github.com/byarbrough/ECE281_CE5/blob/master/finalSim.PNG?raw=true "Part 3 Simulation")

A beautiful ORI.
