----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2025 12:11:12
-- Design Name: 
-- Module Name: Alu - Gate Level
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

entity AluCW is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           AluOp : in STD_LOGIC_VECTOR (2 downto 0);
           RES : out STD_LOGIC_VECTOR (5 downto 0);
           Cout : out STD_LOGIC;
           Ofl : out STD_LOGIC;
           Zero : out STD_LOGIC);
end AluCW;

architecture GateLevel of AluCW is

signal Logic_Output: std_logic_vector (5 downto 0);
signal Adder_Output: STD_LOGIC_VECTOR (5 downto 0);
signal RES_signal : STD_LOGIC_VECTOR (5 downto 0); -- We need a RES_signal because we need to use RES for ZERO detect


component Arithmetic_Unit is
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
               B : in STD_LOGIC_VECTOR (5 downto 0);
               AluOp : in STD_LOGIC_VECTOR (2 downto 0);
               Cout : out STD_LOGIC;
               Ofl : out STD_LOGIC;
               Adder_Output: out STD_LOGIC_VECTOR (5 downto 0)
               );
end component;

component Logic_Unit is
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
               B : in STD_LOGIC_VECTOR (5 downto 0);
               AluOp : in STD_LOGIC_VECTOR (2 downto 0);
               Logic_Output: out std_logic_vector (5 downto 0)
               );
end component;

component MUX is
Port (AluOp : in STD_LOGIC_VECTOR (2 downto 0);
      Logic_Output: in std_logic_vector (5 downto 0);
      Adder_Output: in STD_LOGIC_VECTOR (5 downto 0);
      RES : out STD_LOGIC_VECTOR (5 downto 0)
         );
end component;

component Zero_Detect is
Port ( RES_signal : in std_logic_vector (5 downto 0);
       Zero : out std_logic 
);
end component;

begin

Arithmetic_Unit1 : Arithmetic_Unit port map (A => A, B => B, AluOp => AluOp, Cout => Cout, Ofl => Ofl, Adder_Output => Adder_Output);
Logic_Unit1 : Logic_Unit port map (A => A, B => B, AluOp => AluOp, Logic_Output => Logic_Output);
MUX1 : MUX port map (AluOp => AluOp, Logic_Output => Logic_Output, Adder_Output => Adder_Output, RES => RES_signal);
RES_signal1: Zero_Detect port map(RES_signal => RES_signal, Zero => Zero);

RES <= RES_signal;

end GateLevel;
