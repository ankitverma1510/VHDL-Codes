----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 09:45:46
-- Design Name: 
-- Module Name: ring_counter - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ring_counter is
Port (clk: in std_logic; enable: in std_logic; hold: in std_logic; reset: in std_logic;output: out std_logic_vector(7 downto 0));
end ring_counter;

architecture Behavioral of ring_counter is
signal direction: std_logic;
signal ring_counter : std_logic_vector(7 downto 0);
signal count: integer;

begin
process(clk,reset)
begin
    if (rising_edge(clk)) then    
    if (reset='1') then
        ring_counter <= "00000001";
        direction<='0';
        count<= 1;
    
    
    elsif (direction='0' and hold='0' and enable='1')then
        ring_counter(1)<=ring_counter(0);
        ring_counter(2)<=ring_counter(1);
        ring_counter(3)<=ring_counter(2);
        ring_counter(4)<=ring_counter(3);
        ring_counter(5)<=ring_counter(4);
        ring_counter(6)<=ring_counter(5);
        ring_counter(7)<=ring_counter(6);
        ring_counter(0)<=ring_counter(7);
        count <= count + 1;
        if (count =7) then 
        direction<='1';
        end if;
    elsif (direction='1' and enable = '1' and hold='0') then
        ring_counter(6)<=ring_counter(7);
        ring_counter(0)<=ring_counter(1);
        ring_counter(1)<=ring_counter(2);
        ring_counter(2)<=ring_counter(3);
        ring_counter(3)<=ring_counter(4);
        ring_counter(4)<=ring_counter(5);
        ring_counter(5)<=ring_counter(6);
        ring_counter(7)<=ring_counter(0);
        count <= count - 1;
        if (count =2) then 
        direction<='0';
        end if;       
        
    end if;
    end if;
end process;
output<= ring_counter;

end Behavioral;
