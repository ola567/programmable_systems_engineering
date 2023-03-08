----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2023 02:55:30 PM
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
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

    signal result : STD_LOGIC := '0';
    signal cnt : INTEGER := 0;
    signal bit0 : INTEGER := 0;
    signal bit1 : INTEGER := 0;
    signal bit2 : INTEGER := 0;
    signal bit3 : INTEGER := 0;
    signal bit4 : INTEGER := 0;
    signal bit5 : INTEGER := 0;
    signal bit6 : INTEGER := 0;
    signal bit7 : INTEGER := 0;

begin

    led7_an_o <= "1110";
    --result <= ((((((sw_i(0) xor sw_i(1)) xor sw_i(2)) xor sw_i(3)) xor sw_i(4)) xor sw_i(5)) xor sw_i(6)) xor sw_i(7);
    
    bit0 <= 1 when (sw_i(0) = '1') else 0;
    bit1 <= 1 when (sw_i(1) = '1') else 0;
    bit2 <= 1 when (sw_i(2) = '1') else 0;
    bit3 <= 1 when (sw_i(3) = '1') else 0;
    bit4 <= 1 when (sw_i(4) = '1') else 0;
    bit5 <= 1 when (sw_i(5) = '1') else 0;
    bit6 <= 1 when (sw_i(6) = '1') else 0;
    bit7 <= 1 when (sw_i(7) = '1') else 0;
    
    cnt <= (bit0 + bit1 + bit2 + bit3 + bit4 + bit5 + bit6 + bit7) mod 2;
    
    --process is
    --    variable bit0: integer := 0;
    --begin
    --    for i in 0 to 7 loop
    --        if sw_i(i) = '0' then
    --            bit0 := 0;
    --        end if;
    --        
    --        if sw_i(i) = '1' then
    --            bit0 := 1;
    --        end if;
            --bit0 := 1 when (sw_i(i) = '1') else 0;
    --        cnt <= cnt + bit0;
    --   end loop;
    --end process;
    --cnt <= cnt mod 2;
    
    result <= '1' when (cnt = 1) else '0';
    
    with result select
    led7_seg_o <= "00001101" when '0',
                  "00000011" when '1',
                  "00000000" when others;
end Behavioral;
