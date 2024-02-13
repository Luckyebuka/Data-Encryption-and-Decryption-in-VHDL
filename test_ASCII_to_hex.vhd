library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

use std.textio.all ;
use ieee.std_logic_textio.all ;

entity test_ASCII_TO_HEX is
end;

architecture test of test_ASCII_TO_HEX is
  
component ASCII_to_hex
  port (hex: 		out std_logic_vector(3 downto 0);
	ASCII:	in std_logic_vector(7 downto 0));
end component;

signal hex_out : std_logic_vector(3 downto 0);
signal ASCII_in : unsigned(7 downto 0);
signal expected : std_logic_vector(3 downto 0);

begin
  
dev_to_test:  ASCII_to_hex port map(
  hex_out, std_logic_vector(ASCII_in));
  
seg_out_proc : process(ASCII_in)
  begin
    case ASCII_in is
    when x"30" =>
      expected <= "0000";
    when x"31" =>
      expected <= "0001";
    when x"32" =>
      expected <= "0010";
    when x"33" =>
      expected <= "0011";
    when x"34" =>
      expected <= "0100";
    when x"35" =>
      expected <= "0101";
    when x"36" =>
      expected <= "0110";
    when x"37" =>
      expected <= "0111";
    when x"38" =>
      expected <= "1000";
    when x"39" =>
      expected <= "1001";
    when x"41" =>
      expected <= "1010";
    when x"42" =>
      expected <= "1011";
    when x"43" =>
      expected <= "1100";
    when x"44" =>
      expected <= "1101";
    when x"45" =>
      expected <= "1110";
    when x"46" =>
      expected <= "1111";
    when others =>
      expected <= (others => 'X');
    end case;
end process seg_out_proc;      

stimulus : process

  -- Variables for testbench
  variable ErrCnt : integer := 0 ;
  variable WriteBuf : line ;
  
  begin
    for i in 0 to 255 loop
      ASCII_in <= to_unsigned(i,8);
      
      wait for 10 ns;
      
      if(hex_out /= expected) then
        write(WriteBuf, string'("ERROR:  ASCII to HEX failed at ASCII = "));
        write(WriteBuf, std_logic_vector(ASCII_in));
        
        writeline(Output, WriteBuf);
        ErrCnt := ErrCnt+1;
      end if;
    end loop;
    
    if (ErrCnt = 0) then 
      report "SUCCESS!!!  ASCII to HEX Test Completed";
	  else
			report "The hex_to_7_seg device is broken" severity warning;
	  end if;

end process stimulus;

end test;