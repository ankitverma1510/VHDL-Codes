----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2022 16:33:34
-- Design Name: 
-- Module Name: clock_divider_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider_tb is

end clock_divider_tb;

architecture Behavioral of clock_divider_tb is

component clock_divider
Port (clock : in std_logic; rst : in std_logic; out_clk: out std_logic );
end component;

signal clk: std_logic;
signal out_clk :std_logic;
signal reset: std_logic;
constant Clock_period :time := 10 ns;

begin
uut: clock_divider port map (clk,reset, out_clk);


p1 :process
begin

clk <= '0';
wait for Clock_period/2;
clk <= '1';
wait for Clock_period/2;
end process;

p2: process
begin 
reset<='1';
wait for 100 ns;
reset<='0';
wait;
end process;

end Behavioral;
