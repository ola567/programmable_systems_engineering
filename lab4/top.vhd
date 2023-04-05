----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2023 11:01:31 AM
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
           RXD_i : in STD_LOGIC;
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

signal bufer : STD_LOGIC_VECTOR (31 downto 0);
signal bufer_RXD1 : STD_LOGIC;
signal bufer_RXD2 : STD_LOGIC;

begin

process(clk_i)
begin
if rising_edge(clk_i) then
    bufer_RXD1 <= RXD_i;
    bufer_RXD2 <= bufer_RXD1;
end if;
end process;
receiver_module: entity work.receiver
                port map (digit_o => bufer, clk_i => clk_i, RXD_i => bufer_RXD2, rst_i => rst_i);
display_module: entity work.display
                port map (digit_i => bufer, rst_i => rst_i, clk_i => clk_i, led7_an_o => led7_an_o, led7_seg_o => led7_seg_o);                         
end Behavioral;
