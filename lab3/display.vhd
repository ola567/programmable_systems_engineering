----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2023 06:35:44 PM
-- Design Name: 
-- Module Name: display - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
    Port ( clk_i : in STD_LOGIC;
           digit_i : in STD_LOGIC_VECTOR(31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end display;

architecture Behavioral of display is

signal state1 : STD_LOGIC_VECTOR(3 downto 0) := "0111";
signal cnt : INTEGER := 0;

begin
process(clk_i)
begin
if rising_edge(clk_i) then
    cnt <= cnt + 1;
    if cnt = 100000 then
        cnt <= 0;
        if state1 = "0111" then
            state1 <= "1011";
            led7_an_o <= state1;
            led7_seg_o <= digit_i(23 downto 16);
        elsif state1 = "1011" then
            state1 <= "1101";
            led7_an_o <= state1;
            led7_seg_o <= digit_i(15 downto 8);
        elsif state1 = "1101" then
            state1 <= "1110";
            led7_an_o <= state1;
            led7_seg_o <= digit_i(7 downto 0);       
        elsif state1 = "1110" then
            state1 <= "0111";
            led7_an_o <= state1;
            led7_seg_o <= digit_i(31 downto 24);            
        end if;
    end if;
end if;
end process;
end Behavioral;
