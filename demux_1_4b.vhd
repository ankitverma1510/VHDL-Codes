library ieee;
use ieee.std_logic_1164.all;



entity demux_1_4b is
port( input:in std_logic_vector (3 downto 0);
sel: in std_logic_vector (1 downto 0);
o1, o2, o3, o4: out std_logic_vector (3 downto 0));



end demux_1_4b;



--///////////////////////////////////////////////////////////
--This architecture is described using equations



architecture equations of demux_1_4b is
begin

with sel select o1 <=
input when "00",
"0000" when others;

with sel select o2 <=
input when "01",
"0000" when others;

with sel select o3 <=
input when "10",
"0000" when others;

with sel select o4 <=
input when "11",
"0000" when others;



end equations;



--///////////////////////////////////////////////////////////