----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2023 04:48:35 PM
-- Design Name: 
-- Module Name: tb_receiver - Behavioral
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

entity tb_receiver is
end tb_receiver;

architecture Behavioral of tb_receiver is

component receiver is
    Port ( clk_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           digit_o: out STD_LOGIC_VECTOR(31 downto 0));
end component receiver;

signal clk_i : STD_LOGIC := '0';
signal RXD_i : STD_LOGIC := '0';
signal digit_o : STD_LOGIC_VECTOR(31 downto 0);

begin


end Behavioral;
