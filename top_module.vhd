----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:23:00 04/20/2018 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
    Port ( input_external : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  clk   : in STD_LOGIC;
           control_external : in  STD_LOGIC;
           
           final_output : out  STD_LOGIC_VECTOR (7 downto 0));
end top_module;

architecture Behavioral of top_module is

component main_module is
	Port ( input : in  STD_LOGIC;
           control : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  Key : in STD_LOGIC_VECTOR (31 downto 0);
           cipher : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end component;

component display_multiple_data_bytes is
	port(clk : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            data_in : in  STD_LOGIC_VECTOR (31 downto 0);
            next_data : in  STD_LOGIC;
            data_out : out  STD_LOGIC_VECTOR (7 downto 0));

end component;

component clockconverter is
	 Port ( 
				clk : in STD_LOGIC;
				reset : in STD_LOGIC;
				
			
           b_c_out : out  STD_LOGIC);
			  
end component;

constant key_external : std_logic_vector (31 downto 0) := "11001100110011001100110001101011";
signal next_data_out  : std_logic := '0';
signal temp_out       : std_logic := '0';
signal temp_c         : std_logic;
signal temp_cipher    : std_logic_vector (31 downto 0) := (others => '0');

begin

process(reset, clk)
begin
if(reset = '1') then
	temp_out <= '0';
elsif( reset = '0' and rising_edge(clk)) then
	if(next_data_out = '0') then
		temp_out <= '1';
	elsif(next_data_out= '1') then
		temp_out <= '0';
	end if;
	
end if;
end process;
next_data_out <= temp_out;

cc01: clockconverter port map (clk,reset,temp_c); 
mm01: main_module port map(input_external,control_external,temp_c,reset,key_external,temp_cipher);
dm01: display_multiple_data_bytes port map(temp_c,reset,temp_cipher,temp_out,final_output);




end Behavioral;

