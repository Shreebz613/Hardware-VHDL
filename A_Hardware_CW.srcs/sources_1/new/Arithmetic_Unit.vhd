----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2025 13:47:42
-- Design Name: 
-- Module Name: Arithmetic_Unit - Behavioral
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

entity Arithmetic_Unit is
        Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
               B : in STD_LOGIC_VECTOR (5 downto 0);
               AluOp : in STD_LOGIC_VECTOR (2 downto 0);
               Cout : out STD_LOGIC;
               Ofl : out STD_LOGIC;
               Adder_Output: out STD_LOGIC_VECTOR (5 downto 0)
               );
end Arithmetic_Unit;

architecture GateLevel of Arithmetic_Unit is
-- Add/Subtract Unit 

-- Internal Signals 

-- For Add/Subtract Unit
signal not_B: STD_LOGIC_VECTOR (5 downto 0);
signal Input_to_Adder: STD_LOGIC_VECTOR (5 downto 0);
signal carry1: STD_LOGIC;
signal carry2: STD_LOGIC;
signal carry3: STD_LOGIC;
signal carry4: STD_LOGIC;
signal carry5: STD_LOGIC;

signal RES_signal : STD_LOGIC_VECTOR (5 downto 0); -- We need a RES_signal because we need to use RES for ZERO detect
signal Cout_signal : STD_LOGIC; -- And we also need a Cout_signal because we change Cout after it is calculated

-- Define full adder component, inputs renamed to avoid confusion (both here and in source file) 
component full_adder is
Port (
    A_full_adder : in std_logic;
    B_full_adder : in std_logic;
    Cin: in std_logic;
    Sum : out std_logic;
    Cout_full_adder : out std_logic
);
end component;


begin 

not_B <= not(B);

-- We have B and not B signals, we need to get Input_to_Adder using the MUX and AluOp (1), for each bit of Input_to_Adder
Input_to_Adder(0) <= (B(0) and not(AluOp(1))) or (not_B(0) and AluOp(1));
Input_to_Adder(1) <= (B(1) and not(AluOp(1))) or (not_B(1) and AluOp(1));
Input_to_Adder(2) <= (B(2) and not(AluOp(1))) or (not_B(2) and AluOp(1));
Input_to_Adder(3) <= (B(3) and not(AluOp(1))) or (not_B(3) and AluOp(1));
Input_to_Adder(4) <= (B(4) and not(AluOp(1))) or (not_B(4) and AluOp(1));
Input_to_Adder(5) <= (B(5) and not(AluOp(1))) or (not_B(5) and AluOp(1));

-- Implementing the Ripple Adder using several full adders
-- Cin = AluOp(1);

-- Chaining together 6 full adders 

full_adder0 : full_adder port map (A_full_adder => A(0), B_full_adder => Input_to_Adder(0), Cin => AluOp(1), Sum => Adder_Output(0), Cout_full_adder => carry1);
full_adder1 : full_adder port map (A_full_adder => A(1), B_full_adder => Input_to_Adder(1), Cin => carry1, Sum => Adder_Output(1), Cout_full_adder => carry2);
full_adder2 : full_adder port map (A_full_adder => A(2), B_full_adder => Input_to_Adder(2), Cin => carry2, Sum => Adder_Output(2), Cout_full_adder => carry3);
full_adder3 : full_adder port map (A_full_adder => A(3), B_full_adder => Input_to_Adder(3), Cin => carry3, Sum => Adder_Output(3), Cout_full_adder => carry4);
full_adder4 : full_adder port map (A_full_adder => A(4), B_full_adder => Input_to_Adder(4), Cin => carry4, Sum => Adder_Output(4), Cout_full_adder => carry5);
full_adder5 : full_adder port map (A_full_adder => A(5), B_full_adder => Input_to_Adder(5), Cin => carry5, Sum => Adder_Output(5), Cout_full_adder => Cout_signal);

-- We also need to determine overflow

Ofl <= carry5 xor Cout_signal;

-- We need to correct the Cout when doing subtraction 

Cout <= AluOp(1) xor Cout_signal;



end GateLevel;
