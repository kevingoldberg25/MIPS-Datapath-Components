library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Add is
Port(   Din1, Din2 : in STD_LOGIC_VECTOR (31 downto 0);
        Dout : out STD_LOGIC_VECTOR (31 downto 0));
end Add;

architecture Behavioral of Add is
begin

Dout <= Din1 + Din2;

end Behavioral;
