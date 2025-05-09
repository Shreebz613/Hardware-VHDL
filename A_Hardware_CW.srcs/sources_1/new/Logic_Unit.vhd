----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2025 15:11:56
-- Design Name: 
-- Module Name: Logic_Unit - Behavioral
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

entity Logic_Unit is
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
               B : in STD_LOGIC_VECTOR (5 downto 0);
               AluOp : in STD_LOGIC_VECTOR (2 downto 0);
               Logic_Output: out std_logic_vector (5 downto 0)
               );
end Logic_Unit;

architecture GateLevel of Logic_Unit is

-- For Logic Unit
signal A_and_B: STD_LOGIC_VECTOR (5 downto 0);
signal A_or_B: STD_LOGIC_VECTOR (5 downto 0);
signal A_nor_B: STD_LOGIC_VECTOR (5 downto 0);
signal A_xor_B: STD_LOGIC_VECTOR (5 downto 0);

begin
-- Logic Unit
-- Calculate Signals

A_and_B <= A and B;
A_or_B <= A or B;
A_nor_B <= not(A_or_B);
A_xor_B <= A xor B;

-- Implement 4 to 1 MUX. 1st method, a 4:1 MUX for each bit.

Logic_Output(0) <= (not(AluOp(1)) and not(AluOp(0)) and A_and_B(0)) or (AluOp(1) and AluOp(0) and A_nor_B(0)) or (not(AluOp(1)) and AluOp(0) and A_or_B(0)) or (AluOp(1) and not(AluOp(0)) and A_xor_B(0)); 
Logic_Output(1) <= (not(AluOp(1)) and not(AluOp(0)) and A_and_B(1)) or (AluOp(1) and AluOp(0) and A_nor_B(1)) or (not(AluOp(1)) and AluOp(0) and A_or_B(1)) or (AluOp(1) and not(AluOp(0)) and A_xor_B(1)); 
Logic_Output(2) <= (not(AluOp(1)) and not(AluOp(0)) and A_and_B(2)) or (AluOp(1) and AluOp(0) and A_nor_B(2)) or (not(AluOp(1)) and AluOp(0) and A_or_B(2)) or (AluOp(1) and not(AluOp(0)) and A_xor_B(2)); 
Logic_Output(3) <= (not(AluOp(1)) and not(AluOp(0)) and A_and_B(3)) or (AluOp(1) and AluOp(0) and A_nor_B(3)) or (not(AluOp(1)) and AluOp(0) and A_or_B(3)) or (AluOp(1) and not(AluOp(0)) and A_xor_B(3)); 
Logic_Output(4) <= (not(AluOp(1)) and not(AluOp(0)) and A_and_B(4)) or (AluOp(1) and AluOp(0) and A_nor_B(4)) or (not(AluOp(1)) and AluOp(0) and A_or_B(4)) or (AluOp(1) and not(AluOp(0)) and A_xor_B(4)); 
Logic_Output(5) <= (not(AluOp(1)) and not(AluOp(0)) and A_and_B(5)) or (AluOp(1) and AluOp(0) and A_nor_B(5)) or (not(AluOp(1)) and AluOp(0) and A_or_B(5)) or (AluOp(1) and not(AluOp(0)) and A_xor_B(5)); 

-- Second Method. Three cascading 2:1 MUXs together for each bit.

--Logic_Output(0) <= (not(AluOp(0)) and ((not(AluOp(1)) and A_and_B(0)) or (AluOp(1) and A_xor_B(0)))) or (AluOp(0) and ((not(AluOp(1)) and A_or_B(0)) or (AluOp(1) and A_nor_B(0))));
--Logic_Output(1) <= (not(AluOp(0)) and ((not(AluOp(1)) and A_and_B(1)) or (AluOp(1) and A_xor_B(1)))) or (AluOp(0) and ((not(AluOp(1)) and A_or_B(1)) or (AluOp(1) and A_nor_B(1))));    
--Logic_Output(2) <= (not(AluOp(0)) and ((not(AluOp(1)) and A_and_B(2)) or (AluOp(1) and A_xor_B(2)))) or (AluOp(0) and ((not(AluOp(1)) and A_or_B(2)) or (AluOp(1) and A_nor_B(2))));    
--Logic_Output(3) <= (not(AluOp(0)) and ((not(AluOp(1)) and A_and_B(3)) or (AluOp(1) and A_xor_B(3)))) or (AluOp(0) and ((not(AluOp(1)) and A_or_B(3)) or (AluOp(1) and A_nor_B(3))));    
--Logic_Output(4) <= (not(AluOp(0)) and ((not(AluOp(1)) and A_and_B(4)) or (AluOp(1) and A_xor_B(4)))) or (AluOp(0) and ((not(AluOp(1)) and A_or_B(4)) or (AluOp(1) and A_nor_B(4))));    
--Logic_Output(5) <= (not(AluOp(0)) and ((not(AluOp(1)) and A_and_B(5)) or (AluOp(1) and A_xor_B(5)))) or (AluOp(0) and ((not(AluOp(1)) and A_or_B(5)) or (AluOp(1) and A_nor_B(5))));    

end GateLevel;
