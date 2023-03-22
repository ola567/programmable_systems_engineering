----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2023 10:45:35 AM
-- Design Name: 
-- Module Name: encoder - Behavioral
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

entity encoder is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           digit_o : out STD_LOGIC_VECTOR (31 downto 0) := (others => '1'));
end encoder;

architecture Behavioral of encoder is

signal number : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal sign : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

begin

number <= sw_i(3 downto 0);
with number select
sign <= "00000011" when "0000",
        "11110011" when "0001",
        "00100101" when "0010",
        "00001101" when "0011",
        "10011001" when "0100",
        "01001001" when "0101",
        "01000001" when "0110",
        "00011111" when "0111",
        "00000001" when "1000",
        "00001001" when "1001",
        "00010001" when "1010",
        "00000001" when "1011",
        "01100011" when "1100",
        "00000011" when "1101",
        "01100001" when "1110",
        "01110001" when others;


process(clk_i)
begin
    if rising_edge(clk_i) then
        if btn_i(0) = '1' then
            digit_o(7 downto 0) <= sign;
        end if;
        if btn_i(1) = '1' then
            digit_o(15 downto 8) <= sign;
        end if;
        if btn_i(2) = '1' then
            digit_o(23 downto 16) <= sign;
        end if;
        if btn_i(3) = '1' then
            digit_o(31 downto 24) <= sign;
        end if;
        
--        if sw_i(4) = '1' then
            digit_o(24) <= NOT(sw_i(4));
--        end if;    
--        if sw_i(5) = '1' then
            digit_o(0) <= NOT(sw_i(5));
--        end if; 
--        if sw_i(6) = '1' then
            digit_o(8) <= NOT(sw_i(6));
--        end if; 
--        if sw_i(7) = '1' then
            digit_o(16) <= NOT(sw_i(7));
--        end if;
   end if;
end process;
end Behavioral;
