library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SIGNEXTEND is
  Port (DIN : in STD_LOGIC_VECTOR(15 downto 0);
        DOUT : out STD_LOGIC_VECTOR(31 downto 0));
end SIGNEXTEND;

architecture Behavioral of SIGNEXTEND is

begin
 
DOUT <= x"0000" & DIN when DIN(15) = '0' else x"1111" & DIN;
        



end Behavioral;