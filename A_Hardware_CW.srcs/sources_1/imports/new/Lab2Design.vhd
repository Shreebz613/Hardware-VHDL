
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder is
Port (
    A_full_adder : in std_logic;
    B_full_adder : in std_logic;
    Cin: in std_logic;
    Sum : out std_logic;
    Cout_full_adder : out std_logic
);
end full_adder;

architecture gate_level of full_adder is

Begin
    Sum <= A_full_adder xor B_full_adder xor Cin;
    Cout_full_adder <= (A_full_adder and B_full_adder) or (B_full_adder and Cin) or (Cin and A_full_adder); 
end gate_level;