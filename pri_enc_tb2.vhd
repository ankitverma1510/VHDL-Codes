----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2022 18:23:18
-- Design Name: 
-- Module Name: pri_enc_2 - Behavioral
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

entity pri_encoder is
Port( input : in std_logic_vector(2 downto 0) ; output : out std_logic_vector(1 downto 0) );
end pri_encoder;

architecture Behavioral of pri_encoder is

begin
process (input) begin
if (input(2) ='1') then output <= "11";
elsif (input(2)='0') and (input(1)='1') then output <= "10";
elsif (input(2)='0') and (input(1)='0') and (input(0)='1') then output <="01";
else output <= "00";
end if;
end process;
end Behavioral;
