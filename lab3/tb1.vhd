----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 01:13:07 PM
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb1 is
end tb1;

architecture Behavioral of tb1 is
component display is
    Port ( clk_i : in STD_LOGIC;
           digit_i : in STD_LOGIC_VECTOR(31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component display;

signal clk_i : STD_LOGIC := '0';
signal digit_i : STD_LOGIC_VECTOR (31 downto 0) := (others => '1');
signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0);
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0);

begin

dut: display port map (
    clk_i => clk_i,
    digit_i => digit_i,
    led7_an_o => led7_an_o,
    led7_seg_o => led7_seg_o);

clk_i <= not clk_i after 10 ns;

stim: process
    begin
        digit_i <= "01000000000001111111111101110001";
        wait for 100 ns;
        digit_i <= "00000011011000011111111111111111";
        wait for 100 ns;
        digit_i <= "00000011011000011111001111111111";
        wait for 100 ns;
        digit_i <= "01110001111111111111111100011111";
        wait;
    end process;
end Behavioral;
