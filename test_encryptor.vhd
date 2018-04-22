--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:35:11 04/17/2018
-- Design Name:   
-- Module Name:   /home/encryptor/test_encryptor.vhd
-- Project Name:  encryptor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: encryptor
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
 
ENTITY test_encryptor IS
END test_encryptor;
 
ARCHITECTURE behavior OF test_encryptor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encryptor
    PORT(
         P : IN  std_logic_vector(31 downto 0);
         K : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         C : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal P : std_logic_vector(31 downto 0) := (others => '0');
   signal K : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal C : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encryptor PORT MAP (
          P => P,
          K => K,
          clk => clk,
          reset => reset,
          enable => enable,
          C => C
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
		reset <= '1';
      wait for 100 ns;	
		
		reset <= '0';
		P <= "00001111000011110000111100001111";
		K <= "11110000111100001111000011110000";
		enable <= '1';
		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
