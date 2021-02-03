library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity SBTWO is
Port (  Din : in STD_LOGIC_VECTOR (25 downto 0);
        Dout : out STD_LOGIC_VECTOR (27 downto 0));
end SBTWO;

architecture Behavioral of SBTWO is

signal d1 : std_logic_vector(25 downto 0);
signal d2 : unsigned(27 downto 0);

begin

Dout <= Din & "00";

end Behavioral;
