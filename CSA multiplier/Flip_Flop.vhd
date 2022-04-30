library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Flip_Flop is
Port (D : in std_logic; Q : out std_logic );
end Flip_Flop;


architecture Behavioral of Flip_Flop is

begin
process 
begin
if D='1' then
Q<='1';
else
Q<='0';
end if;
end process;
end Behavioral;