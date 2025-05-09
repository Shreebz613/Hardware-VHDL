----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2025 15:22:39
-- Design Name: 
-- Module Name: AluCW_tb - Behavioral
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

entity AluCW_tb is
--  Port ( );
end AluCW_tb;

architecture Behavioral of AluCW_tb is

    component AluCW
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);      
       B : in STD_LOGIC_VECTOR (5 downto 0);      
       AluOp : in STD_LOGIC_VECTOR (2 downto 0);  
       RES : inout STD_LOGIC_VECTOR (5 downto 0); 
       Cout : inout STD_LOGIC;                    
       Ofl : out STD_LOGIC;                       
       Zero : out STD_LOGIC
       );
    end component;                     

-- Signals
signal A      : STD_LOGIC_VECTOR(5 downto 0);
signal B      : STD_LOGIC_VECTOR(5 downto 0);
signal AluOp  : STD_LOGIC_VECTOR(2 downto 0);
signal RES    : STD_LOGIC_VECTOR(5 downto 0);
signal Cout   : STD_LOGIC;
signal Ofl    : STD_LOGIC;
signal Zero   : STD_LOGIC;


begin

uut: AluCW
        port map (
            A      => A,
            B      => B,
            AluOp  => AluOp,
            RES    => RES,
            Cout   => Cout,
            Ofl    => Ofl,
            Zero   => Zero
        );
        
        
stim_proc: process
begin 

    a <= "110101"; b <= "100101"; aluop <= "000"; wait for 20 ns;
    a <= "010101"; b <= "011111"; aluop <= "000"; wait for 20 ns;
    a <= "100001"; b <= "111110"; aluop <= "010"; wait for 20 ns;
    a <= "110101"; b <= "111110"; aluop <= "010"; wait for 20 ns;
    a <= "010010"; b <= "101000"; aluop <= "111"; wait for 20 ns;
    a <= "111111"; b <= "001100"; aluop <= "101"; wait for 20 ns;
    a <= "010010"; b <= "101000"; aluop <= "110"; wait for 20 ns;
    a <= "111111"; b <= "001100"; aluop <= "100"; wait for 20 ns;
    wait;

end process;


end Behavioral;
