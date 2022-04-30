library ieee;
use ieee.std_logic_1164.all;



entity demux1to4 is
port( input:in std_logic_vector (3 downto 0);
sel: in std_logic_vector (1 downto 0);
o1, o2, o3, o4: out std_logic_vector (3 downto 0));



end demux1to4;



--///////////////////////////////////////////////////////////
--This architecture is described using equations



architecture equations of demux1to4 is
begin
o1(3) <= (input(3)) and (not sel(1)) and (not sel(0));
o1(2) <= (input(2)) and (not sel(1)) and (not sel(0));
o1(1) <= (input(1)) and (not sel(1)) and (not sel(0));
o1(0) <= (input(0)) and (not sel(1)) and (not sel(0));




o2(3) <= (input(3)) and (not sel(1)) and ( sel(0));
o2(2) <= (input(2)) and (not sel(1)) and ( sel(0));
o2(1) <= (input(1)) and (not sel(1)) and ( sel(0));
o2(0) <= (input(0)) and (not sel(1)) and ( sel(0));




o3(3) <= (input(3)) and ( sel(1)) and (not sel(0));
o3(2) <= (input(2)) and ( sel(1)) and (not sel(0));
o3(1) <= (input(1)) and ( sel(1)) and (not sel(0));
o3(0) <= (input(0)) and ( sel(1)) and (not sel(0));




o4(3) <= (input(3)) and ( sel(1)) and ( sel(0));
o4(2) <= (input(2)) and ( sel(1)) and ( sel(0));
o4(1) <= (input(1)) and ( sel(1)) and ( sel(0));
o4(0) <= (input(0)) and ( sel(1)) and ( sel(0));




end equations;



--///////////////////////////////////////////////////////////