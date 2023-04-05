----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2023 11:10:05 AM
-- Design Name: 
-- Module Name: receiver - Behavioral
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

entity receiver is
    Port ( clk_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           digit_o: out STD_LOGIC_VECTOR(31 downto 0));
end receiver;

architecture Behavioral of receiver is

signal cnt1 : INTEGER := 3;
signal cnt2 : INTEGER := -1;
signal store : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal flagg : STD_LOGIC := '0';
signal store2 : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

begin
        
with store2(7 downto 4) select
digit_o(15 downto 8) <= "00000011" when "0000",
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
        
with store2(3 downto 0) select
digit_o(7 downto 0) <= "00000011" when "0000",
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
       
digit_o(31 downto 24) <= "11111111";
digit_o(23 downto 16) <= "11111111";

process(clk_i) 
begin
if rising_edge(clk_i) then
    if rst_i = '1' then
        store2 <= (others => '0');
    end if;
    cnt1 <= cnt1 - 1;
    flagg <= '0';
    if cnt2 = -1 and RXD_i = '0' then
       cnt2 <= 0;
       cnt1 <= 15832;
    end if;
    if cnt1 = 0 then
        cnt1 <= 10416;
        flagg <= '1';
        if cnt2 > -1 then
            if cnt2 > 7 then
                cnt2 <= -1;
                store2 <= store;
            else
                store(cnt2) <= RXD_i;
                cnt2 <= cnt2 + 1;
            end if;
        end if;
    end if;
end if;
end process;
end Behavioral;
