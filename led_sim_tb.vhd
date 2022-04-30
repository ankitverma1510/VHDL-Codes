----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2022 22:31:37
-- Design Name: 
-- Module Name: led_sim_tb - Behavioral
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

entity led_sim_tb is
end led_sim_tb;

architecture Behavioral of led_sim_tb is

component led_sim
Port ( reset: in std_logic; clock: in std_logic; hold_button: in std_logic; output: out std_logic_vector(7 downto 0));
end component;

signal rst: std_logic:='0';
signal hold: std_logic:='0';
signal clock: std_logic;
signal out_led: std_logic_vector(7 downto 0);
constant Clock_period : time := 10 ns;

begin
uut: led_sim port map (rst,clock,hold,out_led);
clk:process
begin

clock <='0';
wait for Clock_period/2;
clock<= '1';
wait for Clock_period/2;
end process;


process
begin
rst<='1';
wait for 100 ns;
rst<='0';
wait for Clock_period*100;
hold<='1';
wait for Clock_period;
hold<='0';
wait for Clock_period*2;
hold<='1';
wait for Clock_period*30; 
hold<='0';
wait for 2000ns;
hold<='1';
wait for Clock_period;
hold<='0';
wait for Clock_period*2;
hold<='1';
wait for Clock_period*30; 
hold<='0';
wait;




end process;

end Behavioral;
