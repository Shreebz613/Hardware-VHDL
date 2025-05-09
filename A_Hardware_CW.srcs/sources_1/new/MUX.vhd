----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2025 15:21:10
-- Design Name: 
-- Module Name: MUX - GateLevel
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

entity MUX is
Port (AluOp : in STD_LOGIC_VECTOR (2 downto 0);
      Logic_Output: in std_logic_vector (5 downto 0);
      Adder_Output: in STD_LOGIC_VECTOR (5 downto 0);
      RES : out STD_LOGIC_VECTOR (5 downto 0)
         );
end MUX;

architecture GateLevel of MUX is

begin


-- Use a 2-1 MUX to determine RES

RES(0) <= (not(AluOp(2)) and Adder_Output(0)) or (AluOp(2) and Logic_Output(0));
RES(1) <= (not(AluOp(2)) and Adder_Output(1)) or (AluOp(2) and Logic_Output(1));
RES(2) <= (not(AluOp(2)) and Adder_Output(2)) or (AluOp(2) and Logic_Output(2));
RES(3) <= (not(AluOp(2)) and Adder_Output(3)) or (AluOp(2) and Logic_Output(3));
RES(4) <= (not(AluOp(2)) and Adder_Output(4)) or (AluOp(2) and Logic_Output(4));
RES(5) <= (not(AluOp(2)) and Adder_Output(5)) or (AluOp(2) and Logic_Output(5));

end GateLevel;
