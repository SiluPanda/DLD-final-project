----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:36:41 04/17/2018 
-- Design Name: 
-- Module Name:    clockconverter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockconverter is
    Port ( 
				clk : in STD_LOGIC;
				reset : in STD_LOGIC;
				--n : in std_logic_vector (5 downto 0);
			
           b_c_out : out  STD_LOGIC);
end clockconverter;

architecture Behavioral of clockconverter is
constant n: std_logic_vector (31 downto 0):= "00000000101111101011110000100000";
signal iter : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal prev : std_logic := '0';

begin

process (clk,reset)
begin
	
	if(reset = '1') then
		prev <= '0';
	elsif (reset = '0' and rising_edge(clk)) then
		if(iter /= n) then
			iter <= iter + "00000000000000000000000000000001";
		elsif(iter = n) then
			prev <= not prev;
			iter <= "00000000000000000000000000000000";
		end if;
	end if;
end process;
b_c_out <= prev;



end Behavioral;

