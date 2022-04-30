library ieee;
use ieee.std_logic_1164.all;
library xil_defaultlib;





entity demux1to4_tb_eq is
end demux1to4_tb_eq;





architecture arch_demux1to4_tb_eq of demux1to4_tb_eq is



component demux_1_4c
port( input:in std_logic_vector (3 downto 0);
sel: in std_logic_vector (1 downto 0);
o1, o2, o3, o4: out std_logic_vector (3 downto 0));
end component;



signal input_tb, o1tb1,o2tb1,o3tb1,o4tb1: std_logic_vector (3 downto 0);
signal sel_tb: std_logic_vector (1 downto 0);



begin
DUT1: demux_1_4c
port map(input=> input_tb, o1=>o1tb1, o2=>o2tb1, o3=>o3tb1, o4=>o4tb1, sel=>sel_tb);



process
begin
wait for 100ns;
input_tb<= "1010"; wait for 10ns;
sel_tb<= "00"; wait for 10ns;
sel_tb<= "01"; wait for 10ns;
sel_tb<= "10"; wait for 10ns;
sel_tb<= "11"; wait for 10ns;



wait;
end process;
end arch_demux1to4_tb_eq;