----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2022 21:22:36
-- Design Name: 
-- Module Name: five_bit_multiplier - Behavioral
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
use IEEE.std_logic_unsigned.ALL;
--use IEEE.std_logic_arith.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Five_bit_multiplier is
Port ( in1, in2 : in std_logic_vector(4 downto 0); ff_out : out std_logic_vector(9 downto 0) ; clk : in std_logic );
end Five_bit_multiplier;

architecture Behavioral of Five_bit_multiplier is

component Half_adder
Port (a,b : in std_logic; sum_h,carry_h : out std_logic );
end component;

component Full_adder
Port ( a,b,c : in std_logic; sum_f, carry_f : out std_logic );
end component;

signal s11,s12,s13,s14,s15,s21,s22,s23,s24,s25,s31,s32,s33,s34,s35,s41,s42,s43,s44,s45: std_logic;
signal c11,c12,c13,c14,c15,c21,c22,c23,c24,c25,c31,c32,c33,c34,c35,c41,c42,c43,c44,c45: std_logic;
signal p0,p1,p2,p3,p4 : std_logic_vector(4 downto 0);

signal ff1_in : std_logic_vector(21 downto 0);
signal ff1_out : std_logic_vector(21 downto 0);
signal ff2_in : std_logic_vector(17 downto 0);
signal ff2_out : std_logic_vector(17 downto 0);
signal ff3_in : std_logic_vector(13 downto 0);
signal ff3_out : std_logic_vector(13 downto 0);
signal product : std_logic_vector(9 downto 0);
signal input_buf_in : std_logic_vector(24 downto 0);
signal input_buf_out : std_logic_vector(24 downto 0);
begin

    gen: for i in 0 to 4 generate
        p0(i) <= in1(0) and in2(i);
        p1(i) <= in1(1) and in2(i);
        p2(i) <= in1(2) and in2(i);
        p3(i) <= in1(3) and in2(i);
        p4(i) <= in1(4) and in2(i);
    end generate gen;  
    
    input_buf_in(0)<=p0(0);
    input_buf_in(1)<=p0(1);
    input_buf_in(2)<=p0(2);
    input_buf_in(3)<=p0(3);
    input_buf_in(4)<=p0(4);
    input_buf_in(5)<=p1(0);
    input_buf_in(6)<=p1(1);
    input_buf_in(7)<=p1(2);
    input_buf_in(8)<=p1(3);
    input_buf_in(9)<=p1(4);
    input_buf_in(10)<=p2(0);
    input_buf_in(11)<=p2(1);
    input_buf_in(12)<=p2(2);
    input_buf_in(13)<=p2(3);
    input_buf_in(14)<=p2(4);
    input_buf_in(15)<=p3(0);
    input_buf_in(16)<=p3(1);
    input_buf_in(17)<=p3(2);
    input_buf_in(18)<=p3(3);
    input_buf_in(19)<=p3(4);
    input_buf_in(20)<=p4(0);
    input_buf_in(21)<=p4(1);
    input_buf_in(22)<=p4(2);
    input_buf_in(23)<=p4(3);
    input_buf_in(24)<=p4(4);
        
    
    ff1_in(0)<= input_buf_out(0);
    ff1_in(1)<=s11;
    ff1_in(2)<=c11;
    ff1_in(3)<=s12;
    ff1_in(4)<=c12;
    ff1_in(5)<=s13;
    ff1_in(6)<=input_buf_out(15);
    ff1_in(7)<=c13;
    ff1_in(8)<=s14;
    ff1_in(9)<=input_buf_out(16);
    ff1_in(10)<=c14;
    ff1_in(11)<=s15;
    ff1_in(12)<=input_buf_out(17);
    ff1_in(13)<=c15;
    ff1_in(14)<=input_buf_out(18);
    ff1_in(15)<=input_buf_out(14);
    ff1_in(16)<=input_buf_out(20);
    ff1_in(17)<=input_buf_out(21);
    ff1_in(18)<=input_buf_out(22);
    ff1_in(19)<=input_buf_out(23);
    ff1_in(20)<=input_buf_out(19);
    ff1_in(21)<=input_buf_out(24);
    
    ff2_in(0)<=ff1_out(0);
    ff2_in(1)<=ff1_out(1);
    ff2_in(2)<=s21;
    ff2_in(3)<=c21;
    ff2_in(4)<=s22;
    ff2_in(5)<=c22;
    ff2_in(6)<=s23;
    ff2_in(7)<=ff1_out(16);
    ff2_in(8)<=c23;
    ff2_in(9)<=s24;
    ff2_in(10)<=ff1_out(17);
    ff2_in(11)<=c24;
    ff2_in(12)<=s25;
    ff2_in(13)<=ff1_out(18);
    ff2_in(14)<=c25;
    ff2_in(15)<=ff1_out(19);
    ff2_in(16)<=ff1_out(20);
    ff2_in(17)<=ff1_out(21);
    
    ff3_in(0)<=ff2_out(0);
    ff3_in(1)<=ff2_out(1);
    ff3_in(2)<=ff2_out(2);
    ff3_in(3)<=s31;
    ff3_in(4)<=c31;
    ff3_in(5)<=c32;
    ff3_in(6)<=s32;
    ff3_in(7)<=c33;
    ff3_in(8)<=s33;
    ff3_in(9)<=c34;
    ff3_in(10)<=s34;
    ff3_in(11)<=c35;
    ff3_in(12)<=s35;
    ff3_in(13)<=ff2_out(17);
    



process(clk)
begin
    if (clk'event and clk='1') then
        input_buf_out<=input_buf_in;
        ff1_out<=ff1_in;
        ff2_out<=ff2_in;
        ff3_out<=ff3_in;
        ff_out<=product;
    end if;     
end process;





ha11: Half_adder port map(input_buf_out(1), input_buf_out(5), s11, c11);
fa12: Full_adder port map(input_buf_out(10), input_buf_out(2), input_buf_out(6), s12, c12);
fa13: Full_adder port map(input_buf_out(3), input_buf_out(7), input_buf_out(11) , s13,c13);
fa14: Full_adder port map(input_buf_out(4), input_buf_out(8), input_buf_out(12), s14,c14);
ha15: Half_adder port map(input_buf_out(9),input_buf_out(13), s15, c15);

ha21: Half_adder port map(ff1_out(3),ff1_out(2),s21,c21);
fa22: Full_adder port map(ff1_out(6),ff1_out(5),ff1_out(4),s22,c22);
fa23: Full_adder port map(ff1_out(9),ff1_out(8),ff1_out(7),s23,c23);
fa24: Full_adder port map(ff1_out(12),ff1_out(11),ff1_out(10),s24,c24);
fa25: Full_adder port map(ff1_out(15),ff1_out(14),ff1_out(13),s25,c25);

ha31: Half_adder port map(ff2_out(4),ff2_out(3),s31,c31);
fa32: Full_adder port map(ff2_out(7),ff2_out(6),ff2_out(5),s32,c32);
fa33: Full_adder port map(ff2_out(10),ff2_out(9),ff2_out(8),s33,c33);
fa34: Full_adder port map(ff2_out(13),ff2_out(12),ff2_out(11),s34,c34);
fa35: Full_adder port map(ff2_out(16),ff2_out(15),ff2_out(14),s35,c35);

product(0) <= ff3_out(0);
product(1) <= ff3_out(1);
product(2) <= ff3_out(2);
product(3) <= ff3_out(3);
product(9 downto 4)<=  ('0'&ff3_out(11)&ff3_out(9)&ff3_out(7)&ff3_out(5)&ff3_out(4)) + ('0'&ff3_out(13)&ff3_out(12)&ff3_out(10)&ff3_out(8)&ff3_out(6));


end Behavioral;
