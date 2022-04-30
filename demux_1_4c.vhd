library ieee;
use ieee.std_logic_1164.all;



entity demux_1_4c is
port( input:in std_logic_vector (3 downto 0);
sel: in std_logic_vector (1 downto 0);
o1, o2, o3, o4: out std_logic_vector (3 downto 0));



end demux_1_4c;



--///////////////////////////////////////////////////////////
--This architecture is described using equations



architecture equations of demux_1_4c is
begin

demux:
process (sel,input) is
begin
case sel is
    when "00" =>
    o1<=input;
    when others => 
    o1 <= "0000";
    end case;

case sel is
    when "01" =>
    o2<=input;
    when others => 
    o2 <= "0000";
    end case;

case sel is    
    when "10" =>
    o3<=input;
    when others => 
    o3 <= "0000";
 end case;
 
case sel is    
    when "11" =>
    o4<=input;
    when others =>
    o4 <= "0000";
end case;

end process demux;

end equations;



--///////////////////////////////////////////////////////////