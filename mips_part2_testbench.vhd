--------------------------------------------------------------------------------
-- Company: 	ECE 281
-- Engineer:	Brian Yarbrough
--
-- Create Date:   10:51:25 05/01/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Brian.Yarbrough/Documents/Academics/3dg/CE_Projects/CE5_Yarbrough/mips_part2_testbench.vhd
-- Project Name:  CE5_Yarbrough
-- Target Device:  
-- Tool versions:  
-- Description:   Machine code for the firsr part of MIPS CE_5: add two values and store the result
-- 
-- VHDL Test Bench Created by ISE for module: mips
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mips_part2_testbench IS
END mips_part2_testbench;
 
ARCHITECTURE behavior OF mips_part2_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mips
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         pc : INOUT  std_logic_vector(31 downto 0);
         instr : IN  std_logic_vector(31 downto 0);
         memwrite : OUT  std_logic;
         aluout : INOUT  std_logic_vector(31 downto 0);
         writedata : INOUT  std_logic_vector(31 downto 0);
         readdata : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal instr : std_logic_vector(31 downto 0) := (others => '0');
   signal readdata : std_logic_vector(31 downto 0) := (others => '0');

	--BiDirs
   signal pc : std_logic_vector(31 downto 0);
   signal aluout : std_logic_vector(31 downto 0);
   signal writedata : std_logic_vector(31 downto 0);

 	--Outputs
   signal memwrite : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mips PORT MAP (
          clk => clk,
          reset => reset,
          pc => pc,
          instr => instr,
          memwrite => memwrite,
          aluout => aluout,
          writedata => writedata,
          readdata => readdata
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
----------------------------------------------------
--MIPS Code
--	addi $s0, $0, 44
--	addi $s1, $0, -37
--	add $s2, $s0, $s1
--	sw $s2, 0x54($0)
------------------------------------------------------

   -- Stimulus process
   stim_proc: process
   begin
	reset <= '0';
     wait for clk_period;
	  --	addi $s0, $0, 44
	  instr <= "00100000000100000000000000101100";
	  wait for clk_period;
	  --	addi $s1, $0, -37
	  instr <= "00100000000100011111111111011011";
	  --	add $s2, $s0, $s1
	  instr <= "00000010000100011001000000100000";
	  wait for clk_period;
	  -- ori $S3, $S2, x8000
	  instr <= "00110110010100111000000000000000";
	  wait for clk_period;
	  --	sw $s2, 0x54($0)
	  instr <= "10101100000100100000000001010100";
	  wait for clk_period;

      wait;
   end process;

END;
