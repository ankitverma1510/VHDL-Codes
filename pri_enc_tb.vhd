library ieee;
use ieee.std_logic_1164.all;
library xil_defaultlib;



entity pri_encoder_tb is
end pri_encoder_tb;


architecture arch_pri_enc_tb of pri_encoder_tb is

component pri_enc_2
Port( input : in std_logic_vector(2 downto 0) ; output : out std_logic_vector(1 downto 0) );
end component;



signal input_tb: std_logic_vector (2 downto 0);
signal output_tb: std_logic_vector (1 downto 0);



begin
DUT1: pri_enc_2
port map(input=> input_tb, output=> output_tb);



process
begin
wait for 100ns;
input_tb<= "000"; wait for 10ns;
input_tb<= "001"; wait for 10ns;
input_tb<= "010"; wait for 10ns;
input_tb<= "100"; wait for 10ns;



wait;
end process;
end arch_pri_enc_tb;