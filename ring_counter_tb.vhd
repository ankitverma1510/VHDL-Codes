----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2022 15:00:08
-- Design Name: 
-- Module Name: ring_counter_tb - Behavioral
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

entity ring_counter_tb is
--  Port ( );
end ring_counter_tb;

architecture Behavioral of ring_counter_tb is

component ring_counter
Port (clk: in std_logic; enable: in std_logic; hold: in std_logic; reset: in std_logic;output: out std_logic_vector(7 downto 0));
end component;

signal Clock : std_logic := '0';
signal Reset : std_logic := '0';
signal enable : std_logic := '0';
signal output : std_logic_vector(7 downto 0);
signal hold_status: std_logic:='0';
constant Clock_period : time := 10 ns;

begin
uut: ring_counter port map (Clock, enable,hold_status, Reset, output);
p1 :process
begin
Clock <= '0';
wait for Clock_period/2;
Clock <= '1';
wait for Clock_period/2;
end process;

p2:process
begin

Reset<='1';
wait for 100 ns;

Reset<='0';
enable<='1';
wait for Clock_period/2;
enable<='0';
wait for Clock_period*2;
enable<='1';
wait for Clock_period*2;
hold_status<='1';
wait for Clock_period*20;
hold_status<='0';


wait;



end process;

end Behavioral;
