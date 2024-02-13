-- ASCII to HEX converter
-- useful for simulation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ASCII_to_hex is
port (hex: 		out std_logic_vector(3 downto 0);
		ASCII:	in std_logic_vector(7 downto 0));
end ASCII_to_hex;

architecture behavior of ASCII_to_hex is
 	begin
	hex_proc : process(ASCII)
		begin
		case ASCII is
			when x"30" =>
				hex <= x"0";
			when x"31" =>
				hex <= x"1";
			when x"32" =>
				hex <= x"2";
			when x"33" =>
		        hex <= x"3";
			when x"34" =>
		        hex <= x"4";
			when x"35" =>
		        hex <= x"5";
			when x"36" =>
		        hex <= x"6";
			when x"37" =>
		        hex <= x"7";
			when x"38" =>
		        hex <= x"8";
			when x"39" =>
		        hex <= x"9";
			when x"41" =>
		        hex <= x"A";
			when x"42" =>
		        hex <= x"B";
			when x"43" =>
		        hex <= x"C";
			when x"44" =>
		        hex <= x"D";
			when x"45" =>
		        hex <= x"E";
			when x"46" =>
		        hex <= x"F";
			when others =>
		        hex <= (others => 'X');
		end case;
	end process hex_proc;
end behavior;