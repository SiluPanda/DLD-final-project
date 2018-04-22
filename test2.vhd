--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:48:34 03/27/2018
-- Design Name:   
-- Module Name:   /home/encryptor/test2.vhd
-- Project Name:  encryptor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main_module
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
 
ENTITY test2 IS
END test2;
 
ARCHITECTURE behavior OF test2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main_module
    PORT(
         input : IN  std_logic;
         control : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         Key : IN  std_logic_vector(31 downto 0);
         cipher : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal control : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal Key : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal cipher : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main_module PORT MAP (
          input => input,
          control => control,
          clk => clk,
          reset => reset,
          Key => Key,
          cipher => cipher
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '1';

      wait for clk_period*10;
		reset <= '0';
		input <= '1';
		control <= '1';
		key <= "11110000111100001111000011110000";
		

      -- insert stimulus here 

      wait;
   end process;

END;
