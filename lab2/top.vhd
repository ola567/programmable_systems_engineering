----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2023 10:31:09 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR (2 downto 0));
end top;

architecture Behavioral of top is
signal state1: STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
begin

process(clk_i, rst_i)
begin
    if rst_i = '1' then
        led_o <= "000";
        state1 <= "000";
    elsif (rising_edge(clk_i)) then
        if state1 = "000" then
            led_o <= "001";
            state1 <= "001";
        elsif state1 = "001" then
            led_o <= "011";
            state1 <= "011";
        elsif state1 = "011" then
            led_o <= "010";
            state1 <= "010";
        elsif state1 = "010" then
            led_o <= "110";
            state1 <= "110";
        elsif state1 = "110" then
            led_o <= "111";
            state1 <= "111";
        elsif state1 = "111" then
            led_o <= "101";
            state1 <= "101";
        elsif state1 = "101" then
            led_o <= "100";
            state1 <= "100";
        elsif state1 = "100" then
            led_o <= "000";
            state1 <= "000";
        end if;
        --with state1 select
        --led_o <= "001" when "000",
        --         "011" when "001",
        --         "010" when "011", 
        --         "110" when "010", 
        --         "111" when "110", 
        --         "101" when "111", 
        --         "100" when "101", 
        --         "000" when others;
        --led_o <= "111";
     end if;
end process;
     
end Behavioral;
