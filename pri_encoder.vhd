----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2022 17:26:33
-- Design Name: 
-- Module Name: pri_encoder - Behavioral
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
output <= "00" when input = "UUU" else
           "01" when input = "001" else
           "10" when input = "010" else
           "11" when input = "100";
end Behavioral;
