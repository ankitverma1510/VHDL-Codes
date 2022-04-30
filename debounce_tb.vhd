----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2022 11:57:27
-- Design Name: 
-- Module Name: debounce_tb - Behavioral
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
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce_tb is
--  Port ( );
end debounce_tb;

architecture Behavioral of debounce_tb is
component debounce
   port(   Clock : in std_logic; Reset : in std_logic; button_in : in std_logic; pulse_out : out std_logic);

end component;
    
signal Clock : std_logic := '0';
signal Reset : std_logic := '0';
signal button_in : std_logic := '0';
signal pulse_out : std_logic;
constant Clock_period : time := 10 ns;
begin

uut: debounce port map (Clock, Reset, button_in, pulse_out);
p1 :process
begin
Clock <= '0';
wait for Clock_period/2;
Clock <= '1';
wait for Clock_period/2;
end process;

button_proc: process
begin        
button_in <= '0';
reset <= '1';
-- hold reset state for 100 ns.
wait for 100 ns;
reset <= '0';
wait for Clock_period*10;
--first activity
button_in <= '1';   wait for Clock_period*2;
button_in <= '0';   wait for Clock_period*1;
button_in <= '1';   wait for Clock_period*1;
button_in <= '0';   wait for Clock_period*20;

--second activity
button_in <= '1';   wait for Clock_period*1;
button_in <= '0';   wait for Clock_period*1;
button_in <= '1';   wait for Clock_period*1;
button_in <= '0';   wait for Clock_period*2;
button_in <= '1';   wait for Clock_period*22;
button_in <= '0';   

--third activity
button_in <= '1';   wait for Clock_period*2;
button_in <= '0';   wait for Clock_period*1;
button_in <= '1';   wait for Clock_period*1;
button_in <= '0';   wait for Clock_period*200;

--fourth activity
button_in <= '1';   wait for Clock_period*1;
button_in <= '0';   wait for Clock_period*1;
button_in <= '1';   wait for Clock_period*1;
button_in <= '0';   wait for Clock_period*2;
button_in <= '1';   wait for Clock_period*220;
button_in <= '0';   
wait;

end process;


end Behavioral;
