----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2025 12:09:24
-- Design Name: 
-- Module Name: FourBitAdder - Behavioral
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

entity FourBitAdder is
    Port ( A : in std_logic_vector(3 downto 0);
           B : in std_logic_vector(3 downto 0);
           Cin : in std_logic;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           Cout : out STD_LOGIC);
end FourBitAdder;

architecture gate_level of FourBitAdder is

component full_adder is
Port (
    sw : in std_logic_vector(2 downto 0);
    led : out std_logic_vector(1 downto 0)
);
end component;

signal c1,c2,c3,c4: std_logic;

begin

full_adder0 : full_adder port map (sw(0) => A(0), sw(1) => B(0), sw(2) => Cin, led(0) => S(0), led(1) => c1);
full_adder1 : full_adder port map (sw(0) => A(1), sw(1) => B(1), sw(2) => c1, led(0) => S(1), led(1) => c2);
full_adder2 : full_adder port map (sw(0) => A(2), sw(1) => B(2), sw(2) => c2, led(0) => S(2), led(1) => c3);
full_adder3 : full_adder port map (sw(0) => A(3), sw(1) => B(3), sw(2) => c3, led(0) => S(3), led(1) => c4);

Cout <= c4;
end gate_level;
