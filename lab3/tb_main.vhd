----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2023 12:33:46 PM
-- Design Name: 
-- Module Name: tb_main - Behavioral
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

entity tb_main is
end tb_main;

architecture Behavioral of tb_main is

component top is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component top;

signal clk_i : STD_LOGIC := '0';
signal btn_i : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal sw_i : STD_LOGIC_VECTOR(7 downto 0) := "10010000";
signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0);
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0);

begin

dut: top port map (
    clk_i => clk_i,
    btn_i => btn_i,
    sw_i => sw_i,
    led7_an_o => led7_an_o,
    led7_seg_o => led7_seg_o);

clk_i <= not clk_i after 10 ns;

stim: process
    begin
        btn_i(3) <= '1';
        wait for 1 ms;
        sw_i(3 downto 0) <= "0010";
        wait for 2 ms;
        btn_i(3) <= '0';
        sw_i(7 downto 4) <= "1100";
        
        btn_i(2) <= '1';
        wait for 1 ms;
        sw_i(3 downto 0) <= "1111";
        wait for 2 ms;
        btn_i(2) <= '0';   
        
        btn_i(1) <= '1';
        wait for 1 ms;
        sw_i(3 downto 0) <= "0101";
        wait for 2 ms;
        btn_i(1) <= '0';
        sw_i(7 downto 4) <= "0101";
        
        btn_i(0) <= '1';
        wait for 1 ms;
        sw_i(3 downto 0) <= "1010";
        wait for 2 ms;
        btn_i(0) <= '0'; 
        wait;
end process;
end Behavioral;
