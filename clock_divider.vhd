----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2022 16:20:02
-- Design Name: 
-- Module Name: clock_divider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
Port (clock : in std_logic; rst : in std_logic; out_clk: out std_logic );
end clock_divider;

architecture Behavioral of clock_divider is
signal count : integer;
signal clock_out : std_logic;

begin
out_clk<=clock_out;
process(clock)
begin
if (rst ='1') then
clock_out<='0';
count<=1;
elsif (rising_edge(clock)) then
    count<=count+1;
    if (count=99999999) then              -- change it to 100000000-1
        clock_out<=not clock_out;
        
    elsif(count=100000000) then           -- change it to 100000000
        clock_out<=not clock_out;
        
        count <=1;
    end if;

end if;
 

end process;

end Behavioral;
