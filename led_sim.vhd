----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2022 20:58:49
-- Design Name: 
-- Module Name: led_sim - Behavioral
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

entity led_sim is
Port ( reset: in std_logic; clock: in std_logic; hold_button: in std_logic; output: out std_logic_vector(7 downto 0));
end led_sim;

architecture Behavioral of led_sim is
component clock_divider
Port (clock : in std_logic; rst : in std_logic; out_clk: out std_logic );
end component;

component debounce
port(Clock : in std_logic; Reset : in std_logic; button_in : in std_logic; pulse_out : out std_logic);
end component;

component ring_counter
Port (clk: in std_logic; enable: in std_logic; hold: in std_logic; reset: in std_logic; output: out std_logic_vector(7 downto 0));
end component;

signal div_clk: std_logic;
signal debounce_hold: std_logic;
begin
CL: clock_divider port map(clock=>clock, rst=>reset, out_clk=>div_clk);
RC: ring_counter port map(reset=>reset, hold=>debounce_hold, enable=>div_clk, clk=>clock, output=>output);
DB: debounce port map(Clock=>clock, Reset=>reset, button_in=>hold_button, pulse_out=>debounce_hold);

end Behavioral;
