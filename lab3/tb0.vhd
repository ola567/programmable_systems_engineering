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

entity tb is
end tb;

architecture Behavioral of tb is
component encoder is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           digit_o : out STD_LOGIC_VECTOR (31 downto 0) := (others => '1'));
end component encoder;

signal clk_i : STD_LOGIC := '0';
signal btn_i : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal sw_i : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal digit_o : STD_LOGIC_VECTOR (31 downto 0);

begin

dut: encoder port map (
    clk_i => clk_i,
    btn_i => btn_i,
    sw_i => sw_i,
    digit_o => digit_o);

clk_i <= not clk_i after 10 ns;

stim: process
    begin
        btn_i(3) <= '1';
        sw_i <= "10001010";
        wait for 100 ns;
        btn_i(3) <= '0';
        btn_i(2) <= '1';
        sw_i <= "01000011";
        wait for 100 ns;
        btn_i(2) <= '0';
        btn_i(1) <= '1';
        sw_i <= "00101111";
        wait for 100 ns;
        btn_i(1) <= '0';
        btn_i(0) <= '1';
        sw_i <= "00000101";
        wait;
    end process;
end Behavioral;
