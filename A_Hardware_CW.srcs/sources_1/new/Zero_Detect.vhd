----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2025 15:27:00
-- Design Name: 
-- Module Name: Zero_Detect - Behavioral
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

entity Zero_Detect is
Port ( RES_signal : in std_logic_vector (5 downto 0);
       Zero : out std_logic 
);


end Zero_Detect;

architecture GateLevel of Zero_Detect is

begin

-- Zero Detect
Zero <= not(RES_signal(0) or RES_signal(1) or RES_signal(2) or RES_signal(3) or RES_signal(4) or RES_signal(5));

end GateLevel;
