----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 09:46:22
-- Design Name: 
-- Module Name: debounce - Behavioral
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

entity debounce is
port(   Clock : in std_logic; Reset : in std_logic; button_in : in std_logic; pulse_out : out std_logic);
end debounce;

architecture Behavioral of debounce is

constant COUNT_LIMIT : integer := 2000000; -- change it to 2000000
signal prev_state: std_logic;
signal count : integer := 0;
signal out_sig, release: std_logic;
--type state_type is (idle,waiting); --state machine
--signal state : state_type := idle;

begin
pulse_out<=out_sig;
process(Reset,Clock)
begin
    if(Reset = '1') then
        --state <= idle;
        prev_state<=button_in;
        out_sig <= '0';
        release<='1';
elsif(rising_edge(Clock)) then
                if(button_in = '1') then            
                    if(count = COUNT_LIMIT) then
                        --count <= 0;
                        if(button_in = '1' and prev_state='0' and release='1') then
                            out_sig <= '1';
                            prev_state<='1';
                            release<='0';
                        elsif(button_in='1' and prev_state='1' and release ='1') then
                            out_sig<= '0';  
                            prev_state<='0';
                            release<='0';
                        end if;
                    else
                        count <= count + 1;
                    end if;  
                elsif(button_in = '0') then
                    count<=0;  
                    release<='1';
                end if;
end if;     
end process;                  

end Behavioral;
